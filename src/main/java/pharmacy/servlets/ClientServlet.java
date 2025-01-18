package pharmacy.servlets;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import pharmacy.entities.Client;
import pharmacy.services.ClientService;

public class ClientServlet extends HttpServlet {
    private ClientService clientService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String dateAchat = req.getParameter("dateClient");
        LocalDate date = null;
        if(dateAchat == null || dateAchat.isBlank()) {
            date = LocalDate.now();
        } else {
            date = LocalDate.parse(dateAchat);
        }
        dateAchat = date.toString();

        String[] conditions = clientService.filterConditions(dateAchat);
        Object[] values = clientService.filterValues(dateAchat);
        try {
            List<Client> clients = clientService.getAll(conditions, values, null);
            req.setAttribute("clients", clients);
        } catch (Exception e) {
            throw new ServletException(e);
        }

        RequestDispatcher dispatcher = req.getRequestDispatcher("list-client.jsp");
        dispatcher.forward(req, resp);
    }

    @Override
    public void init() throws ServletException {
        super.init();
        try {
            this.clientService = new ClientService();
        } catch (Exception e) {
            throw new ServletException(e);
        }
    }
}
