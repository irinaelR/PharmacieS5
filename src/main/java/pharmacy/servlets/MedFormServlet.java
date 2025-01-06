package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.MeasuringUnit;
import pharmacy.entities.MedForm;
import pharmacy.entities.Medicine;
import pharmacy.entities.MedicinesDosage;
import pharmacy.entities.MedicinesFormat;
import pharmacy.services.MeasuringUnitService;
import pharmacy.services.MedFormService;
import pharmacy.services.MedicineDosageService;
import pharmacy.services.MedicineService;
import pharmacy.services.MedicinesFormatService;

public class MedFormServlet extends HttpServlet {
    private MedicineService medicineService; // also contains MedFormatService
    private MedFormService medFormService;
    private MeasuringUnitService measuringUnitService;
    private MedicineDosageService medicineDosageService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<MedForm> forms = medFormService.getAll();
            req.setAttribute("forms", forms);

            List<MeasuringUnit> units = measuringUnitService.getAll();
            req.setAttribute("units", units);

            String medIdStr = req.getParameter("medicineId");
            Medicine m = medicineService.findById(Integer.valueOf(medIdStr));
            req.setAttribute("medicine", m);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("medicine-form.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String medIdStr = req.getParameter("medId");
        int medId = Integer.valueOf(medIdStr);

        String formStr = req.getParameter("form");
        int formId = Integer.valueOf(formStr);

        String doseStr = req.getParameter("dose");
        double dose = Double.valueOf(doseStr);

        String unitIdStr = req.getParameter("measuring_unit");
        int unitId = Integer.valueOf(unitIdStr);

        String priceStr = req.getParameter("price");
        double price = Double.valueOf(priceStr);

        try {
            MedicinesFormatService mfs = this.medicineService.getMedicinesFormatService();
            MedicinesFormat mf = new MedicinesFormat(medId, formId);
            MedicinesFormat temp = mfs.exists(mf);
            boolean exists = (temp != null);
            
            if(!exists) {
                mf = mfs.insert(mf);
            } else {
                mf = temp;
            }

            MedicinesDosage md = new MedicinesDosage(mf.getId(), price, dose, unitId);
            medicineDosageService.insert(md);

            resp.sendRedirect("new-form");
        } catch (Exception e) {
            throw new ServletException(e);
        }

    }

    @Override
    public void init() throws ServletException {
        try {
            this.medicineService = new MedicineService();
            this.medFormService = new MedFormService();
            this.measuringUnitService = new MeasuringUnitService();
            this.medicineDosageService = new MedicineDosageService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
