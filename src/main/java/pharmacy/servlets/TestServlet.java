package pharmacy.servlets;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;

public class TestServlet extends HttpServlet {

    private void processRequest(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String hello = "Hola baby girl";
        resp.getWriter().println(hello);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        processRequest(req, resp);
    }

}
