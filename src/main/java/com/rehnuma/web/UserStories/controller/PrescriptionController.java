package com.rehnuma.web.UserStories.controller;

import com.rehnuma.web.UserStories.model.CountPrescription;
import com.rehnuma.web.UserStories.model.MonthRange;
import com.rehnuma.web.UserStories.model.Prescription;
import com.rehnuma.web.UserStories.services.PrescriptionServices;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Controller
public class PrescriptionController {

    @Autowired
    private PrescriptionServices prescriptionServices;

    @PostMapping("/home")
    public String storePrescription(@ModelAttribute Prescription prescription,
                                    BindingResult result,
                                    HttpServletRequest request,
                                    Model model,
                                    RedirectAttributes redirectAttributes) {
        System.out.println(prescription.getId()
                + "\n" + prescription.getDate()
                + "\n" + prescription.getPatient_name()
                + "\n" + prescription.getAge()
                + "\n" + prescription.getGender()
                + "\n" + prescription.getNext_visit_date()
                + "\n" + prescription.getDiagnosis()
                + "\n" + prescription.getMedicines());
        Prescription storedPrescription = prescriptionServices.savePrescription(prescription);

        if (storedPrescription != null) {
            //request.setAttribute("successMessage", "Prescription saved successfully");
            redirectAttributes.addFlashAttribute("successMessage", "Prescription saved successfully" );
            return "redirect:/home";
        } else {
            request.setAttribute("failureMessage", "Error while saving prescription.Try again!");
            return "redirect:/home";
        }
    }

    @GetMapping("/showPrescription")
    public String showPrescriptions(Model model,
                                    HttpServletRequest request) {
        model.addAttribute("monthRange", new MonthRange());
        Date date = new Date();
        Calendar cal = Calendar.getInstance();
        cal.setTime(date);
        int monthNumber = cal.get(Calendar.MONTH) + 1;
        int yearNum = cal.get(Calendar.YEAR);
        String monthAndYear = Integer.toString(yearNum) + "-0" + Integer.toString(monthNumber);
        System.out.println(monthAndYear);

        List<Prescription> prescriptionList = prescriptionServices
                .showRecordsByMonth(monthAndYear);

        request.setAttribute("prescription", prescriptionList);
        return "showTable";
    }

    @PostMapping("/showPrescription")
    public String showSelectedMonthRecord(@ModelAttribute MonthRange monthRange,
                                          BindingResult result,
                                          HttpServletRequest request) {
        System.out.println(monthRange.getMonth());
        List<Prescription> prescriptionList = prescriptionServices
                .showRecordsByMonth(monthRange.getMonth());
        System.out.println("hello I am List");
        request.setAttribute("prescription", prescriptionList);
        return "showTable";
    }

    @PostMapping("/delete")
    public String delete(@RequestParam("pId") int pId) {
        System.out.println("TO BE DELETED ID : " + pId);
        prescriptionServices.deletePrescription(pId);
        System.out.println("Deletion successful!");
        return "redirect:/showPrescription";
    }

    @PostMapping("/update")
    public String update(@RequestParam("id") int id,
                         RedirectAttributes attributes) {
        System.out.println("hello this is update");
        attributes.addAttribute("id", id);
        return "redirect:/edit";
    }

    @GetMapping("/edit")
    public String getEdit(@RequestParam("id") int id, Model model) {
        Prescription pr = prescriptionServices.readPrescriptionById(id);
        List<String> genderList = new ArrayList<String>();
        genderList.add("Male");
        genderList.add("Female");
        model.addAttribute("prescriptionUpdate", pr);
        model.addAttribute("genderList", genderList);
        return "updatePrescription";
    }

    @PostMapping("/edit")
    public String edit(@RequestParam int id,
                       @ModelAttribute("prescription") Prescription prescription,
                       BindingResult result,
                       HttpServletRequest request) {
        Prescription updateResult = prescriptionServices.editPrescription(id, prescription);
        System.out.println("update successful!");
        if (updateResult != null) {
            request.setAttribute("successUpdate", "Prescription updated successfully!");
        } else {
            request.setAttribute("failureUpdate", "Prescription updated failed!");
        }
        return "redirect:/showPrescription";

    }
    @GetMapping("/dailyCountReport")
    public String showReport(ModelMap model){
        List<CountPrescription> reportList=prescriptionServices.findCountOfprescription();
        model.put("reportList",reportList);
        return "dailyReport";
    }


}
