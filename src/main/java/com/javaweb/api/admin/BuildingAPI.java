package com.javaweb.api.admin;

import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.model.response.ResponseDTO;
import com.javaweb.repository.AssignBuildingRepository;
import com.javaweb.repository.BuildingRepository;
import com.javaweb.repository.RentAreaRepository;
import com.javaweb.service.AssignmentBuildingService;
import com.javaweb.service.BuildingService;
import com.javaweb.service.RentAreaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController(value = "buildingAPIOfAdmin")
@RequestMapping ("/api/building")
@Transactional
public class BuildingAPI {
    @Autowired
    private BuildingService buildingService;
    @Autowired
    private BuildingRepository buildingRepository;
    @Autowired
    private RentAreaRepository rentAreaRepository;
    @Autowired
    private AssignBuildingRepository assignBuildingRepository;
    @Autowired
    private AssignmentBuildingService assignmentBuildingService;

    @PostMapping
    public void addOrUpdateBuilding(@RequestBody BuildingDTO buildingDTO){
        //Xuong DB de update hoac them moi
        buildingService.createAndUpdateBuilding(buildingDTO);
    }

    @DeleteMapping("/{ids}")
    public void deleteBuilding(@PathVariable Long[] ids){
        rentAreaRepository.deleteByBuildingEntityIdIn(ids);
        assignBuildingRepository.deleteByBuildingEntityIdIn(ids);
        buildingRepository.deleteByIdIn(ids);
    }

    @GetMapping("/{id}/staffs")
    public ResponseDTO loadStaffs(@PathVariable Long id){
        ResponseDTO result = buildingService.listStaffs(id);
        return result;
    }

    @PostMapping("/assignment")
    public void updateAssignmentBuilding(@RequestBody AssignmentBuildingDTO assignmentBuildingDTO) {
        assignBuildingRepository.deleteByBuildingEntityId(assignmentBuildingDTO.getBuildingId());
        assignmentBuildingService.createAssignmentBuilding(assignmentBuildingDTO);
    }

}
