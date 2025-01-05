package pharmacy.servlets;

import java.io.IOException;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Illness;
import pharmacy.services.IllnessService;

public class IllnessFormServlet extends HttpServlet {
    private IllnessService illnessService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String idStr = req.getParameter("id");
            if (idStr != null && !idStr.isBlank()) {
                int id = Integer.valueOf(idStr);
                Illness i = illnessService.findById(id);
                req.setAttribute("illness", i);
            }
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("new-illness.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String name = req.getParameter("name");

        String descri = req.getParameter("descri");

        String isChronic = req.getParameter("isChronic");
        boolean isChronicBool = Boolean.valueOf(isChronic);

        Illness i = new Illness(name, descri, isChronicBool);

        try {
            String action = req.getParameter("action");
            if (action != null && action.equalsIgnoreCase("update")) {
                String idStr = req.getParameter("id");
                int id = Integer.valueOf(idStr);
                i.setId(id);
    
                illnessService.update(i);
            } else {
                i = illnessService.insert(i);
            }
            
            resp.sendRedirect("illnesses");

        } catch (Exception e) {
            throw new ServletException(e);
        }

    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.illnessService = new IllnessService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}