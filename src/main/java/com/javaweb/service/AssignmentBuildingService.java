package com.javaweb.service;

import com.javaweb.entity.AssignBuildingEntity;
import com.javaweb.model.dto.AssignmentBuildingDTO;

import java.util.List;

public interface AssignmentBuildingService {

    List<AssignBuildingEntity> createAssignmentBuilding(AssignmentBuildingDTO assignmentBuildingDTO);
}
