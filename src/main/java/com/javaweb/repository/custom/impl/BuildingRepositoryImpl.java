package com.javaweb.repository.custom.impl;

import java.lang.reflect.Field;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.repository.custom.BuildingRepositoryCustom;
import org.springframework.context.annotation.Primary;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

@Repository
@Primary
public class BuildingRepositoryImpl implements BuildingRepositoryCustom {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public List<BuildingEntity> findAll(BuildingSearchRequest buildingSearchBuilder, Pageable pageable) {
        StringBuilder sql = new StringBuilder("SELECT b.* FROM building b ");
        joinTable(buildingSearchBuilder, sql);
        StringBuilder where = new StringBuilder("WHERE 1 = 1 ");
        queryNomal(buildingSearchBuilder, where);
        querySpecial(buildingSearchBuilder, where);
        sql.append(where);
        Query queryTotal = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        List<BuildingEntity> resultListTotal = queryTotal.getResultList();
        buildingSearchBuilder.setTotalItems(resultListTotal.size());
        sql.append(" LIMIT ").append(pageable.getPageSize()).append(" OFFSET ").append(pageable.getOffset());
        Query query = entityManager.createNativeQuery(sql.toString(), BuildingEntity.class);
        return query.getResultList();
    }

    public static void joinTable(BuildingSearchRequest buildingSearchBuilder, StringBuilder sql) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            sql.append("INNER JOIN assignmentbuilding d ON b.id = d.buildingid ");
        }
    }

    public static void queryNomal(BuildingSearchRequest buildingSearchBuilder, StringBuilder where) {
        try {
            Field[] fields = BuildingSearchRequest.class.getDeclaredFields();
            for (Field item : fields) {
                item.setAccessible(true);
                String fieldName = item.getName();
                if (!fieldName.equals("staffId") && !fieldName.equals("typeCode") && !fieldName.startsWith("area")
                        && !fieldName.startsWith("rentPrice")) {
                    Object value = item.get(buildingSearchBuilder);
                    if (value != null) {
                        if (item.getType().getName().equals("java.lang.Long")
                                || item.getType().getName().equals("java.lang.Double")) {
                            where.append("AND b." + fieldName + " = " + value + " ");
                        } else if (item.getType().getName().equals("java.lang.String") && value != "") {
                            where.append("AND b." + fieldName + " LIKE '%" + value + "%' ");
                        }
                    }
                }
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

    public static void querySpecial(BuildingSearchRequest buildingSearchBuilder, StringBuilder where) {
        Long staffId = buildingSearchBuilder.getStaffId();
        if (staffId != null) {
            where.append("AND d.staffid = " + staffId + " ");
        }
        Long areaFrom = buildingSearchBuilder.getAreaFrom();
        Long areaTo = buildingSearchBuilder.getAreaTo();
        if (areaFrom != null || areaTo != null) {
            where.append("AND EXISTS (SELECT * FROM rentarea e WHERE b.id = e.buildingid ");
            if (areaFrom != null) {
                where.append("AND e.value >= " + areaFrom + " ");
            }
            if (areaTo != null) {
                where.append("AND e.value <= " + areaTo + " ");
            }
            where.append(") ");
        }
        Long rentPriceFrom = buildingSearchBuilder.getRentPriceFrom();
        Long rentPriceTo = buildingSearchBuilder.getRentPriceTo();
        if (rentPriceFrom != null) {
            where.append("AND b.rentprice >= " + rentPriceFrom + " ");
        }
        if (rentPriceTo != null) {
            where.append("AND b.rentprice <= " + rentPriceTo + " ");
        }
        List<String> typeCode = buildingSearchBuilder.getTypeCode();
        if (typeCode != null) {
            for (String it : typeCode) {
                where.append("AND b.type LIKE '%" + it + "%' ");
            }
        }
        where.append("GROUP BY b.id ORDER BY b.name ");
    }
}
