//package Controller;
//
//import DAO.ProjetDAO;
//import Model.Projet;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.SQLException;
//import java.text.ParseException;
//import java.text.SimpleDateFormat;
//import java.util.List;
//
//@WebServlet("/ProjetServlet")
//public class ProjetServlet extends HttpServlet {
//    private ProjetDAO projetDAO = new ProjetDAO();
//
//    // Méthode GET pour lister ou afficher un formulaire
//    @Override
//    protected void doGet(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        try {
//            if (action == null || action.isEmpty() || action.equals("list")) {
//                // Lister tous les projets
//                List<Projet> projets = projetDAO.getAllProjets();
//                request.setAttribute("projets", projets);
//                request.getRequestDispatcher("/listProjets.jsp").forward(request, response);
//            } else if (action.equals("create")) {
//                // Afficher le formulaire de création
//                request.getRequestDispatcher("/createProjet.jsp").forward(request, response);
//            } else if (action.equals("edit")) {
//                // Récupérer un projet pour modification
//                int id = Integer.parseInt(request.getParameter("id"));
//                Projet projet = projetDAO.getProjetById(id);
//                request.setAttribute("projet", projet);
//                request.getRequestDispatcher("/editProjet.jsp").forward(request, response);
//            } else if (action.equals("delete")) {
//                // Supprimer un projet
//                int id = Integer.parseInt(request.getParameter("id"));
//                projetDAO.deleteProjet(id);
//                response.sendRedirect("ProjetServlet");
//            }
//
//         else if (action.equals("delete")) {
//            int id = Integer.parseInt(request.getParameter("id"));
//            projetDAO.deleteProjet(id);
//            response.sendRedirect("ProjetServlet");
//        }
//        } catch (SQLException e) {
//            e.printStackTrace();
//            request.setAttribute("error", "Erreur lors de l'opération : " + e.getMessage());
//            request.getRequestDispatcher("/error.jsp").forward(request, response); // Page d'erreur optionnelle
//        } catch (NumberFormatException e) {
//            e.printStackTrace();
//            request.setAttribute("error", "ID invalide : " + e.getMessage());
//            request.getRequestDispatcher("/error.jsp").forward(request, response);
//        }
//    }
//
//    // Méthode POST pour créer ou mettre à jour un projet
//    @Override
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String action = request.getParameter("action");
//        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
//
//        // Vérifier si action est null ou vide, sinon utiliser une valeur par défaut
//        if (action == null || action.isEmpty()) {
//            action = "create"; // Valeur par défaut, ajuste selon tes besoins
//        }
//
//        try {
//            if (action.equals("create")) {
//                // Créer un nouveau projet
//                Projet projet = new Projet(
//                        0, // ID sera auto-incrémenté
//                        request.getParameter("nom"),
//                        request.getParameter("description"),
//                        sdf.parse(request.getParameter("dateDebut")),
//                        sdf.parse(request.getParameter("dateFin")),
//                        Double.parseDouble(request.getParameter("budget"))
//                );
//                projetDAO.createProjet(projet);
//            } else if (action.equals("update")) {
//                // Mettre à jour un projet existant
//                int id = Integer.parseInt(request.getParameter("id"));
//                Projet projet = new Projet(
//                        id,
//                        request.getParameter("nom"),
//                        request.getParameter("description"),
//                        sdf.parse(request.getParameter("dateDebut")),
//                        sdf.parse(request.getParameter("dateFin")),
//                        Double.parseDouble(request.getParameter("budget"))
//                );
//                projetDAO.updateProjet(projet);
//            }
//            response.sendRedirect("ProjetServlet");
//        } catch (ParseException | SQLException | NumberFormatException e) {
//            e.printStackTrace();
//            request.setAttribute("error", "Erreur lors de la soumission : " + e.getMessage());
//            request.getRequestDispatcher("/error.jsp").forward(request, response); // Page d'erreur optionnelle
//        }
//    }
//
//    // Méthode pour initialiser le DAO (optionnel, ici pour référence)
//    @Override
//    public void init() throws ServletException {
//        super.init();
//        // Initialisation si nécessaire
//    }
//}

package Controller;

import DAO.ProjetDAO;
import Model.Projet;
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

@WebServlet("/ProjetServlet")
public class ProjetServlet extends HttpServlet {
    private ProjetDAO projetDAO = new ProjetDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        try {
            if (action == null || action.isEmpty() || action.equals("list")) {
                List<Projet> projets = projetDAO.getAllProjets();
                request.setAttribute("projets", projets);
                request.getRequestDispatcher("/listProjets.jsp").forward(request, response);
            } else if (action.equals("create")) {
                request.getRequestDispatcher("/createProjet.jsp").forward(request, response);
            } else if (action.equals("edit")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Projet projet = projetDAO.getProjetById(id);
                if (projet != null) {
                    request.setAttribute("projet", projet);
                    request.getRequestDispatcher("/editProjet.jsp").forward(request, response);
                } else {
                    request.setAttribute("error", "Projet avec ID " + id + " non trouvé.");
                    request.getRequestDispatcher("/error.jsp").forward(request, response);
                }
            } else if (action.equals("delete")) {
                int id = Integer.parseInt(request.getParameter("id"));
                projetDAO.deleteProjet(id);
                response.sendRedirect("ProjetServlet");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("error", "Erreur SQL : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        } catch (NumberFormatException e) {
            e.printStackTrace();
            request.setAttribute("error", "ID invalide : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");


        if (action == null || action.isEmpty()) {
            request.setAttribute("error", "Action non spécifiée.");
            request.getRequestDispatcher("/error.jsp").forward(request, response);
            return;
        }

        try {
            if (action.equals("create")) {
                Projet projet = new Projet(
                        0,
                        request.getParameter("nom"),
                        request.getParameter("description"),
                        sdf.parse(request.getParameter("dateDebut")),
                        sdf.parse(request.getParameter("dateFin")),
                        Double.parseDouble(request.getParameter("budget"))
                );
                projetDAO.createProjet(projet);
            } else if (action.equals("update")) {
                int id = Integer.parseInt(request.getParameter("id"));
                Projet projet = new Projet(
                        id,
                        request.getParameter("nom"),
                        request.getParameter("description"),
                        sdf.parse(request.getParameter("dateDebut")),
                        sdf.parse(request.getParameter("dateFin")),
                        Double.parseDouble(request.getParameter("budget"))
                );
                projetDAO.updateProjet(projet);
            }
            response.sendRedirect("ProjetServlet");
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
            request.setAttribute("error", "Valeur invalide pour budget ou ID : " + e.getMessage());
            request.getRequestDispatcher("/error.jsp").forward(request, response);
        }
    }

    @Override
    public void init() throws ServletException {
        super.init();
    }
}