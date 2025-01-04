package pharmacy.servlets;

import java.io.IOException;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Illness;
import pharmacy.services.IllnessService;

@WebServlet("/illnesses")
public class IllnessServlet extends HttpServlet {

    private IllnessService illnessService;
    private int resultsNb;

    private void sendToView(List<Illness> illnesses, HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("illnesses", illnesses);
        RequestDispatcher dispatcher = req.getRequestDispatcher("list-illness.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // int startIndex = 0;
        // String startIndexStr = req.getParameter("start");
        // if (startIndexStr != null) {
        //     startIndex = Integer.valueOf(startIndexStr);
        // }

        try {
            List<Illness> illnesses = illnessService.getAll(null, null, null);
            sendToView(illnesses, req, resp);
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.illnessService = new IllnessService();
            this.resultsNb = Integer.valueOf(this.getServletContext().getInitParameter("resultsNb"));

        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
    
}
