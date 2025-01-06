package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.MedicalConstraint;
import pharmacy.entities.Medicine;
import pharmacy.entities.MedicinesRestriction;
import pharmacy.services.MedicalConstraintService;
import pharmacy.services.MedicineService;
import pharmacy.services.MedicinesRestrictionService;

public class MedicineConstraintServlet extends HttpServlet {
    MedicineService medicineService;
    MedicalConstraintService medicalConstraintService;
    MedicinesRestrictionService medicinesRestrictionService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String medId = req.getParameter("medId");
        try {
            Medicine m = medicineService.findById(Integer.valueOf(medId));
            req.setAttribute("medicine", m);

            List<MedicalConstraint> alreadyThere = medicalConstraintService.getAll(m.getId());
            req.setAttribute("medConstraints", alreadyThere);

            List<MedicalConstraint> all = medicalConstraintService.getAll();
            all.removeAll(alreadyThere); // remove the constraints that are already linked to this medication from dropdown
            req.setAttribute("constraintsList", all);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("medicine-constraints.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String medId = req.getParameter("medId");
        String constraintId = req.getParameter("constraint");

        try {
            MedicinesRestriction mr = new MedicinesRestriction(Integer.valueOf(medId), Integer.valueOf(constraintId));
            mr = medicinesRestrictionService.insert(mr);

            resp.sendRedirect("new-constraints?medId=" + medId);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.medicineService = new MedicineService();
            this.medicalConstraintService = new MedicalConstraintService();
            this.medicinesRestrictionService = new MedicinesRestrictionService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
