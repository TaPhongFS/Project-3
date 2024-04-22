package com.javaweb.repository.custom.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.repository.custom.CustomerRepositoryCustom;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.lang.reflect.Field;
import java.util.List;

@Repository
@Primary
public class CustomerRepositoryImpl implements CustomerRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT c.* FROM customer c ");
        joinTable(customerSearchRequest, sql);
        StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
        queryNomal(customerSearchRequest, where);
        querySpecial(customerSearchRequest, where);
        sql.append(where);
        Query queryTotal = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        List<BuildingEntity> resultListTotal = queryTotal.getResultList();
        customerSearchRequest.setTotalItems(resultListTotal.size());
        sql.append(" LIMIT ").append(pageable.getPageSize()).append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(sql.toString(), CustomerEntity.class);
        return query.getResultList();
    }


    public static void joinTable(CustomerSearchRequest customerSearchRequest, StringBuilder sql) {
        Long staffId = customerSearchRequest.getStaffId();
        if (staffId != null) {
            sql.append("INNER JOIN assignmentcustomer d ON c.id = d.customerid ");
        }
    }

    public static void queryNomal(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        try {
            Field[] fields = CustomerSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if (!fieldName.equals("staffId")) {
                    Object value = item.get(customerSearchRequest);
                    if (value != null) {
                        if (item.getType().getName().equals("java.lang.Long")
                                || item.getType().getName().equals("java.lang.Double")) {
                            where.append("AND c." + fieldName + " = " + value + " ");
                        } else if (item.getType().getName().equals("java.lang.String") && value != "") {
                            where.append("AND c." + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void querySpecial(CustomerSearchRequest customerSearchRequest, StringBuilder where) {
        Long staffId = customerSearchRequest.getStaffId();
        if (staffId != null) {
            where.append("AND d.staffid = " + staffId + " ");
        }
    }
}
