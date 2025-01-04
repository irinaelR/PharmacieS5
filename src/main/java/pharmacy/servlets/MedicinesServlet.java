package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Laboratory;
import pharmacy.entities.MedCategory;
import pharmacy.entities.MedicalConstraint;
import pharmacy.entities.Medicine;
import pharmacy.services.LaboratoryService;
import pharmacy.services.MedCategoryService;
import pharmacy.services.MedicalConstraintService;
import pharmacy.services.MedicineService;

public class MedicinesServlet extends HttpServlet {
    private MedicineService medicineService;
    private MedCategoryService medCategoryService;
    private MedicalConstraintService medicalConstraintService;
    private LaboratoryService laboratoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<MedCategory> categories = medCategoryService.getAll();
            req.setAttribute("medCategories", categories);

            List<MedicalConstraint> constraints = medicalConstraintService.getAll();
            req.setAttribute("constraints", constraints);

            List<Laboratory> labs = laboratoryService.getAll(null, null, null);
            req.setAttribute("labs", labs);

            String medicineIdStr = req.getParameter("medicineId");
            String action = req.getParameter("action");
            if (medicineIdStr != null && action != null && action.equalsIgnoreCase("del")) {
                int mId = Integer.valueOf(medicineIdStr);
                Medicine medicine = medicineService.findById(mId);
                boolean wasDeleted = medicineService.delete(medicine);
            }

            String laboratory = req.getParameter("laboratory");
            String categ = req.getParameter("category");
            String needsNotice = req.getParameter("needsNotice");
            String constraint = req.getParameter("constraint");
            String minPriceStr = req.getParameter("minPrice");
            String maxPriceStr = req.getParameter("maxPrice");

            String[] conditions = medicineService.filterConditions(laboratory, categ, needsNotice, constraint, minPriceStr, maxPriceStr);
            Object[] values = medicineService.filterValues(laboratory, categ, needsNotice, constraint, minPriceStr, maxPriceStr);

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
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
