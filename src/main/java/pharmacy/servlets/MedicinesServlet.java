package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Illness;
import pharmacy.entities.Laboratory;
import pharmacy.entities.MedCategory;
import pharmacy.entities.MedicalConstraint;
import pharmacy.entities.Medicine;
import pharmacy.services.IllnessService;
import pharmacy.services.LaboratoryService;
import pharmacy.services.MedCategoryService;
import pharmacy.services.MedicalConstraintService;
import pharmacy.services.MedicineService;

public class MedicinesServlet extends HttpServlet {
    private MedicineService medicineService;
    private MedCategoryService medCategoryService;
    private MedicalConstraintService medicalConstraintService;
    private LaboratoryService laboratoryService;
    private IllnessService illnessService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<MedCategory> categories = medCategoryService.getAll();
            req.setAttribute("medCategories", categories);

            List<MedicalConstraint> constraints = medicalConstraintService.getAll();
            req.setAttribute("constraints", constraints);

            List<Laboratory> labs = laboratoryService.getAll(null, null, null);
            req.setAttribute("labs", labs);

            List<Illness> illnesses = illnessService.getAll(null, null, null);
            req.setAttribute("illnesses", illnesses);

            String medicineIdStr = req.getParameter("medicineId");
            String action = req.getParameter("action");
            if (medicineIdStr != null && action != null && action.equalsIgnoreCase("del")) {
                int mId = Integer.valueOf(medicineIdStr);
                Medicine medicine = medicineService.findById(mId);
                boolean wasDeleted = medicineService.delete(medicine);
            }

            String laboratory = req.getParameter("laboratory");
            String illness = req.getParameter("illnesses");
            String categ = req.getParameter("category");
            String needsNotice = req.getParameter("needsNotice");
            String constraintInclusion = req.getParameter("constraintInclusion");
            String constraintExclusion = req.getParameter("constraintExclusion");
            String minPriceStr = req.getParameter("minPrice");
            String maxPriceStr = req.getParameter("maxPrice");

            String[] conditions = medicineService.filterConditions(laboratory, categ,illness, needsNotice, constraintInclusion,constraintExclusion, minPriceStr, maxPriceStr, null, null);
            Object[] values = medicineService.filterValues(laboratory, categ,illness, needsNotice, constraintInclusion,constraintExclusion, minPriceStr, maxPriceStr, null, null);

            List<Medicine> medicines = medicineService.getAll(conditions, values, null);
            req.setAttribute("medicines", medicines);

            RequestDispatcher dispatcher = req.getRequestDispatcher("list-medicine.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.medicineService = new MedicineService();
            this.medCategoryService = new MedCategoryService();
            this.medicalConstraintService = new MedicalConstraintService();
            this.laboratoryService = new LaboratoryService();
            this.illnessService = new IllnessService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
