package com.rehnuma.web.UserStories.repostories;

import com.rehnuma.web.UserStories.model.CountPrescription;
import com.rehnuma.web.UserStories.model.Prescription;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CountPrescriptionRepository extends CrudRepository<Prescription,Integer> {

    @Query(value="select p.date AS date ,count(p.id) AS count " +
            "from prescription p " +
            "group by p.date;",nativeQuery = true)
    List<CountPrescription> dailyRecords();
}
