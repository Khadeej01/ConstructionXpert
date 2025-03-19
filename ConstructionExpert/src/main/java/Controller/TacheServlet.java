package Controller;

import DAO.TacheDAO;
import Model.Tache;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/TacheServlet")
public class TacheServlet extends HttpServlet {
    private TacheDAO tacheDAO = new TacheDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null || action.isEmpty()) {
            action = "list"; // Par défaut, afficher la liste des tâches
        }

        try {
            if (action.equals("list")) {
                // Récupérer toutes les tâches
                List<Tache> taches = tacheDAO.getAllTaches();
                request.setAttribute("taches", taches);
                request.getRequestDispatcher("/listTaches.jsp").forward(request, response);
            } else if (action.equals("create")) {
                request.getRequestDispatcher("/createTache.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur SQL : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
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

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        try {
            if (action.equals("create")) {
                Tache tache = new Tache(
                        0,
                        request.getParameter("description"),
                        sdf.parse(request.getParameter("dateDebut")),
                        sdf.parse(request.getParameter("dateFin")),
                        Integer.parseInt(request.getParameter("projectId"))
                );
                tacheDAO.createTache(tache);
                response.sendRedirect("TacheServlet?action=list"); // Rediriger vers la liste des tâches
            }
        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur de format de date : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur SQL : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "ID de projet invalide : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }
}