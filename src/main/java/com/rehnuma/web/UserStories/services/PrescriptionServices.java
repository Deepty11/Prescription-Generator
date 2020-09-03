package com.rehnuma.web.UserStories.services;

import com.rehnuma.web.UserStories.model.CountPrescription;
import com.rehnuma.web.UserStories.model.Prescription;
import com.rehnuma.web.UserStories.repostories.CountPrescriptionRepository;
import com.rehnuma.web.UserStories.repostories.PrescriptionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PrescriptionServices {
    @Autowired
    private PrescriptionRepository prescriptionRepository;

    @Autowired
    private CountPrescriptionRepository countPrescriptionRepository;

    public Prescription savePrescription(Prescription pr){
        Prescription prescription=prescriptionRepository.save(pr);
        return prescription;
    }
    public List<Prescription> showRecordsByMonth(String monthPattern){
        Iterable<Prescription> prescriptions=prescriptionRepository.findAllByDateStartingWith(monthPattern);
        List<Prescription> prescriptionList=new ArrayList<Prescription>();
        prescriptions.forEach(c ->{
            prescriptionList.add(c);
        });
        return prescriptionList;
    }
    public void deletePrescription(int id){
        prescriptionRepository.deleteById(id);
    }
    public Prescription editPrescription(int id, Prescription prescription){
        Optional<Prescription> prescriptionResult=prescriptionRepository.findById(id);
        Prescription pr=prescriptionResult.get();
        pr.setDate(prescription.getDate());
        pr.setPatient_name(prescription.getPatient_name());
        pr.setAge(prescription.getAge());
        pr.setGender(prescription.getGender());
        pr.setMedicines(prescription.getMedicines());
        pr.setDiagnosis(prescription.getDiagnosis());
        pr.setNext_visit_date(prescription.getNext_visit_date());
//        saving updates
        Prescription updates=savePrescription(pr);
        return updates;

    }
    public Prescription readPrescriptionById(int id){
        Optional<Prescription>prescriptionResult=prescriptionRepository.findById(id);
        Prescription pr=prescriptionResult.get();
        return pr;
    }

    public  List<Prescription> findAllPrescriptions(){
        Iterable<Prescription> presList=prescriptionRepository.findAll();
        List<Prescription> prescriptionList=new ArrayList<Prescription>();
        presList.forEach(c->{
            prescriptionList.add(c);
        });
        return prescriptionList;
    }

    public List<CountPrescription> findCountOfprescription(){
        List<CountPrescription> countList=countPrescriptionRepository.dailyRecords();
        return countList;

    }
}
