<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.Resource" %>
<%@ page import="DAO.TacheDAO" %>
<%@ page import="Model.Tache" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructExpert | Liste des Ressources</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    colors: {
                        primary: '#2c3e50',
                        secondary: '#f39c12',
                        accent: '#3498db',
                        success: '#27ae60',
                        danger: '#e74c3c',
                        warning: '#f1c40f',
                        light: '#ecf0f1',
                        dark: '#2c3e50'
                    }
                }
            }
        }
    </script>
</head>
<body class="bg-gray-100 min-h-screen">
<!-- Header -->
<header class="bg-primary text-white shadow-md">
    <div class="container mx-auto px-4 py-4 flex justify-between items-center">
        <div class="flex items-center">
            <i class="fas fa-hard-hat text-3xl"></i>
            <h1 class="text-2xl font-bold ml-3">Construct<span class="text-secondary">Expert</span></h1>
        </div>

        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div class="flex items-center">
                    <div class="text-right mr-4">
                        <div>${sessionScope.user.fullName}</div>
                        <small class="text-gray-300">${sessionScope.user.role}</small>
                    </div>
                    <div class="w-10 h-10 bg-secondary rounded-full flex items-center justify-center font-bold">
                            ${fn:substring(sessionScope.user.fullName, 0, 1)}
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <a href="login.jsp" class="bg-accent hover:bg-blue-600 text-white px-4 py-2 rounded flex items-center">
                    <i class="fas fa-sign-in-alt mr-2"></i> Se connecter
                </a>
            </c:otherwise>
        </c:choose>
    </div>
</header>

<!-- Navigation -->
<nav class="bg-white shadow">
    <div class="container mx-auto px-4">
        <div class="flex flex-col md:flex-row md:justify-between">
            <ul class="flex flex-wrap">
                <li>
                    <a href="dashboard.jsp" class="block py-4 px-6 text-dark font-medium hover:text-accent border-b-3 border-transparent">
                        <i class="fas fa-tachometer-alt mr-2"></i> Tableau de bord
                    </a>
                </li>
                <li>
                    <a href="projects.jsp" class="block py-4 px-6 text-dark font-medium hover:text-accent border-b-3 border-transparent">
                        <i class="fas fa-project-diagram mr-2"></i> Projets
                    </a>
                </li>
                <li>
                    <a href="tasks.jsp" class="block py-4 px-6 text-dark font-medium hover:text-accent border-b-3 border-transparent">
                        <i class="fas fa-tasks mr-2"></i> Tâches
                    </a>
                </li>
                <li>
                    <a href="resources.jsp" class="block py-4 px-6 text-accent font-medium border-b-3 border-accent">
                        <i class="fas fa-tools mr-2"></i> Ressources
                    </a>
                </li>
            </ul>

            <div class="flex items-center py-2">
                <input type="text" placeholder="Rechercher..." class="px-4 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent">
                <button type="submit" class="bg-accent text-white px-4 py-2 rounded-md ml-2">
                    <i class="fas fa-search"></i>
                </button>
            </div>
        </div>
    </div>
</nav>

<!-- Main Section -->
<section class="py-8">
    <div class="container mx-auto px-4">
        <div class="max-w-4xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <div class="bg-primary text-white px-6 py-4 flex justify-between items-center">
                <h2 class="text-xl font-bold">Liste des Ressources</h2>
                或者: <i class="fas fa-tools text-xl"></i>
            </div>
            <div class="p-6">
                <%
                    List<Resource> resources = (List<Resource>) request.getAttribute("resources");
                    if (resources == null || resources.isEmpty()) {
                %>
                <p class="text-dark">Aucune ressource trouvée.</p>
                <% } else { %>
                <table class="w-full text-left border-collapse">
                    <thead>
                    <tr class="bg-light text-dark">
                        <th class="p-3">ID</th>
                        <th class="p-3">Nom</th>
                        <th class="p-3">Type</th>
                        <th class="p-3">Quantité</th>
                        <th class="p-3">Tâche</th>
                        <th class="p-3">Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        TacheDAO tacheDAO = new TacheDAO();
                        for (Resource r : resources) {
                            Tache tache = tacheDAO.getTacheById(r.getTaskId());
                            String tacheDescription = (tache != null && tache.getDescription() != null) ? tache.getDescription() : "Tâche inconnue";
                    %>
                    <tr class="border-b hover:bg-gray-50">
                        <td class="p-3"><%= r.getId() %></td>
                        <td class="p-3"><%= r.getNom() != null ? r.getNom() : "Sans nom" %></td>
                        <td class="p-3"><%= r.getType() != null ? r.getType() : "Non défini" %></td>
                        <td class="p-3"><%= r.getQuantite() %></td>
                        <td class="p-3"><%= tacheDescription %></td>
                        <td class="p-3">
                            <a href="ResourceServlet?action=edit&id=<%= r.getId() %>" class="text-accent hover:text-blue-600 mr-2">
                                <i class="fas fa-edit"></i> Modifier
                            </a>
                            <a href="ResourceServlet?action=delete&id=<%= r.getId() %>" class="text-danger hover:text-red-700" onclick="return confirm('Confirmer la suppression ?');">
                                <i class="fas fa-trash-alt"></i> Supprimer
                            </a>
                        </td>
                    </tr>
                    <% } %>
                    </tbody>
                </table>
                <% } %>
                <div class="mt-6 flex justify-end space-x-4">
                    <a href="ResourceServlet?action=create" class="bg-accent hover:bg-blue-600 text-white px-5 py-2 rounded-md flex items-center">
                        <i class="fas fa-plus-circle mr-2"></i> Ajouter une ressource
                    </a>
                    <a href="TacheServlet" class="bg-dark hover:bg-gray-700 text-white px-5 py-2 rounded-md flex items-center">
                        <i class="fas fa-arrow-left mr-2"></i> Retour aux tâches
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>
</html>