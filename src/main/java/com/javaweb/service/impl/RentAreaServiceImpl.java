package com.javaweb.service.impl;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import com.javaweb.service.RentAreaService;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RentAreaServiceImpl implements RentAreaService {
    @Override
    public List<RentAreaEntity> createRentArea(BuildingEntity buildingEntity, BuildingDTO buildingDTO) {
        List<RentAreaEntity> result = new ArrayList<>();
        if(buildingDTO.getRentArea() != "") {
            String[] values = buildingDTO.getRentArea().trim().split(",");
            for (String it : values) {
                RentAreaEntity rentArea = new RentAreaEntity();
                rentArea.setValue(it);
                rentArea.setBuildingEntity(buildingEntity);
                result.add(rentArea);
            }
        }
        return result;
    }




}
