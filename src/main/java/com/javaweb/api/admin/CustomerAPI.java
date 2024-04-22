package com.javaweb.api.admin;

import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.AssignmentCustomerDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.dto.CustomerDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.CustomerRepository;
import com.javaweb.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

@RestController(value = "customerAPIOfAdmin")
@RequestMapping("/api/customer")
@Transactional
public class CustomerAPI {
    @Autowired
    private CustomerService customerService;
    @Autowired
    private CustomerRepository customerRepository;


    @PostMapping
    public void addOrUpdateCustomer(@RequestBody CustomerDTO customerDTO){
        customerService.createAndUpdateCustomer(customerDTO);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = customerService.listStaffs(id);
        return result;
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable Long[] ids){
        customerRepository.deleteByIdIn(ids);
    }

    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentCustomerDTO assignmentCustomerDTO) {
        customerService.asignmentCustomer(assignmentCustomerDTO);
    }
}
