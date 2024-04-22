package com.javaweb.service;

import com.javaweb.entity.CustomerEntity;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.request.BuildingSearchRequest;
import com.javaweb.model.request.CustomerSearchRequest;
import com.javaweb.model.response.BuildingSearchResponse;
import com.javaweb.model.response.CustomerSearchResponse;
import com.javaweb.model.response.ResponseDTO;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface CustomerService {

    List<CustomerEntity> findAll(CustomerSearchRequest customerSearchRequest, Pageable pageable);

    void createAndUpdateCustomer(CustomerDTO customerDTO);

    ResponseDTO listStaffs(Long customerId);

    void asignmentCustomer(AssignmentCustomerDTO assignmentBuildingDTO);

    CustomerDTO toCustomerDTO(CustomerEntity customerEntity);

}
