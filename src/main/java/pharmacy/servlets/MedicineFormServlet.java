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
import pharmacy.entities.Medicine;
import pharmacy.services.LaboratoryService;
import pharmacy.services.MedCategoryService;
import pharmacy.services.MedicineService;

public class MedicineFormServlet extends HttpServlet {
    private MedicineService medicineService;
    private MedCategoryService medCategoryService;
    private LaboratoryService laboratoryService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Laboratory> labs = laboratoryService.getAll(null, null, null);
            req.setAttribute("laboratories", labs);

            List<MedCategory> categories = medCategoryService.getAll();
            req.setAttribute("categories", categories);

            String idStr = req.getParameter("id");
            if (idStr != null && !idStr.isBlank()) {
                int id = Integer.valueOf(idStr);
                Medicine m = medicineService.findById(id);
                req.setAttribute("medicine", m);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("new-medicine.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");
        
        String labStr = req.getParameter("laboratory");
        int labId = Integer.valueOf(labStr);

        String categoryStr = req.getParameter("category");
        int categId = Integer.valueOf(categoryStr);

        String needsNoticeStr = req.getParameter("needsNotice");
        boolean needsNotice = Boolean.valueOf(needsNoticeStr);

        try {
            Medicine m = new Medicine(name, needsNotice, categId, labId);

            String action = req.getParameter("action");
            if (action != null && action.equalsIgnoreCase("update")) {
                String idStr = req.getParameter("id");
                int id = Integer.valueOf(idStr);
                m.setId(id);

                medicineService.update(m);
                resp.sendRedirect("medicines");
            } else {
                m = medicineService.insert(m);
                resp.sendRedirect("new-form?medicineId=" + m.getId());
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        try {
            this.medicineService = new MedicineService();
            this.medCategoryService = new MedCategoryService();
            this.laboratoryService = new LaboratoryService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
