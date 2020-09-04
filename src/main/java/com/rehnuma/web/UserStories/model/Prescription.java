package com.rehnuma.web.UserStories.model;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.NonNull;
import org.springframework.lang.Nullable;

import javax.persistence.*;
import javax.persistence.metamodel.IdentifiableType;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "prescription")
public class Prescription {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "date")
    private String date;

    @Column(name = "patient_name")
    private String patient_name;

    @Column(name = "age")
    private String age;

    @Column(name = "gender")
    private String gender;

    @Column(name = "diagnosis")
    private String diagnosis;

    @Column(name = "medicines")
    private String medicines;

    @Column(name = "next_visit_date")
    private String next_visit_date;

    public Prescription() {

    }

    public Prescription( String date,
                        String patient_name,
                        String age,
                        String gender,
                        String diagnosis,
                        String medicines,
                        String next_visit_date) {
        
        this.date = date;
        this.patient_name = patient_name;
        this.age = age;
        this.gender = gender;
        this.diagnosis = diagnosis;
        this.medicines = medicines;
        this.next_visit_date = next_visit_date;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getNext_visit_date() {
        return next_visit_date;
    }

    public void setNext_visit_date(String next_visit_date) {
        this.next_visit_date = next_visit_date;
    }

    public String getPatient_name() {
        return patient_name;
    }

    public void setPatient_name(String patient_name) {
        this.patient_name = patient_name;
    }

    public String getAge() {
        return age;
    }

    public void setAge(String age) {
        this.age = age;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }

    public String getMedicines() {
        return medicines;
    }

    public void setMedicines(String medicines) {
        this.medicines = medicines;
    }


}
