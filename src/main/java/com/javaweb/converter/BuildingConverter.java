package com.javaweb.converter;

import com.javaweb.entity.BuildingEntity;
import com.javaweb.entity.RentAreaEntity;
import com.javaweb.model.dto.BuildingDTO;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class BuildingConverter {
    @Autowired
    private ModelMapper modelMapper;

    public BuildingDTO toBuildingDTO(BuildingEntity item) {
        BuildingDTO building = modelMapper.map(item, BuildingDTO.class);
        String[] typeCodes = item.getTypeCode().split(",");
        List<String> typeCodeDTO = new ArrayList<>();
        for(String it : typeCodes){
            typeCodeDTO.add(it);
        }
        building.setTypeCode(typeCodeDTO);
        List<RentAreaEntity> rentAreaEntities = item.getRentAreaEntities();
        String areaResult = rentAreaEntities.stream().map(it -> it.getValue()).collect(Collectors.joining(","));
        building.setRentArea(areaResult);
        return building;
    }

}
