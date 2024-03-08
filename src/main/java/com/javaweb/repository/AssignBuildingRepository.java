package com.javaweb.repository;


import com.javaweb.entity.AssignBuildingEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AssignBuildingRepository extends JpaRepository<AssignBuildingEntity,Long> {
    void deleteByBuildingEntityIdIn(Long[] ids);

    void deleteByBuildingEntityId(Long id);

}
