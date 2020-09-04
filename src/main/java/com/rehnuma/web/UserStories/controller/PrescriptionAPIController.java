package com.rehnuma.web.UserStories.controller;

import com.rehnuma.web.UserStories.model.Prescription;
import com.rehnuma.web.UserStories.services.PrescriptionServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class PrescriptionAPIController {

    @Autowired
    private PrescriptionServices prescriptionServices;

    @GetMapping("/api/v1/prescription")
    public ResponseEntity<Object> getPrescriptions(){

        List<Prescription> prescriptionList=prescriptionServices.findAllPrescriptions();

        //Return as json Object in the response body
        return new ResponseEntity<>(prescriptionList, HttpStatus.OK);

    }

}
