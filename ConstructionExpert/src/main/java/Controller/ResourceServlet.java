package Controller;

import DAO.ResourceDAO;
import Model.Resource;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ResourceServlet")
public class ResourceServlet extends HttpServlet {
    private ResourceDAO resourceDAO = new ResourceDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            response.sendRedirect("TacheServlet");
            return;
        }

        if (action.equals("create")) {
            request.getRequestDispatcher("/createResource.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if (action == null || action.isEmpty()) {
            request.setAttribute("error", "Action non spécifiée.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        try {
            if (action.equals("create")) {
                Resource resource = new Resource(
                        0,
                        request.getParameter("nom"),
                        request.getParameter("type"),
                        Integer.parseInt(request.getParameter("quantite")),
                        Integer.parseInt(request.getParameter("taskId"))
                );
                resourceDAO.createResource(resource);
                response.sendRedirect("TacheServlet?action=list");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur SQL : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "Valeur invalide pour quantité ou ID de tâche : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}