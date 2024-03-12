package com.javaweb.service.impl;

import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.UserEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;
import com.javaweb.repository.AssignBuildingRepository;
import com.javaweb.service.AssignmentBuildingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AssignmentBuildingServiceImpl implements AssignmentBuildingService {
    @Autowired
    private AssignBuildingRepository assignBuildingRepository;
    @Override
    public void createAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO) {
        List<AssignBuildingEntity> assignBuildingEntities = new ArrayList<>();
        for(Long it : assignmentBuildingDTO.getStaffs()){
            AssignBuildingEntity assignBuilding = new AssignBuildingEntity();
            UserEntity userEntity = new UserEntity();
            BuildingEntity buildingEntity = new BuildingEntity();
            userEntity.setId(it);
            buildingEntity.setId(assignmentBuildingDTO.getBuildingId());
            assignBuilding.setUserEntity(userEntity);
            assignBuilding.setBuildingEntity(buildingEntity);
            assignBuildingEntities.add(assignBuilding);
        }
        for(AssignBuildingEntity it : assignBuildingEntities){
            assignBuildingRepository.save(it);
        }

    }
}
