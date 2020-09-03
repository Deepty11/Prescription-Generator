package com.rehnuma.web.UserStories.repostories;

import com.rehnuma.web.UserStories.model.Prescription;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface PrescriptionRepository extends CrudRepository<Prescription,Integer> {

    @Query(value = "select * " +
            "from prescription " +
            "where date like ?"+"%",
            nativeQuery = true)
    Iterable<Prescription> findAllByDateStartingWith(String pattern);

    @Query(value="select date,count(id) " +
            "from prescription " +
            "group by date;",
            nativeQuery = true)
    List<Object> findCountOfPrescription();

}
