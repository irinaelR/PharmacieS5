package pharmacy.servlets;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Laboratory;
import pharmacy.entities.MedCategory;
import pharmacy.entities.MedicalConstraint;
import pharmacy.entities.Medicine;
import pharmacy.entities.MedicinesDosage;
import pharmacy.entities.MedicinesFormat;
import pharmacy.services.LaboratoryService;
import pharmacy.services.MedCategoryService;
import pharmacy.services.MedicalConstraintService;
import pharmacy.services.MedicineService;

public class MedicineDetailsServlet extends HttpServlet {
    private MedicineService medicineService;
    private MedicalConstraintService medConstraintService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            
            Medicine m = this.medicineService.findById(Integer.parseInt(req.getParameter("medId")));
            
            List<MedicinesFormat> medFormat = this.medicineService.getAllFormats(m);

            Map<MedicinesFormat,List<MedicinesDosage>> medDosage = this.medicineService.getAllFormatsDosages(m);

            List<MedicalConstraint> medConstraint = this.medConstraintService.getAll(m.getId());

            req.setAttribute("medicine", m);
            req.setAttribute("medConstraint", medConstraint);
            req.setAttribute("medFormat", medFormat);
            req.setAttribute("medDosage", medDosage);
            req.setAttribute("medicine", m);
            RequestDispatcher dispatcher = req.getRequestDispatcher("medicine-details.jsp");
            dispatcher.forward(req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        try {
            this.medicineService = new MedicineService();
            this.medConstraintService = new MedicalConstraintService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}