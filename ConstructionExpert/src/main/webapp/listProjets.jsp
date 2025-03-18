<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ page import="Model.Projet" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="fr">--%>
<%--<head>--%>
<%--    <title>Liste des Projets</title>--%>
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
<%--</head>--%>
<%--<body class="bg-gray-100">--%>
<%--<div class="max-w-4xl mx-auto my-10 p-6 bg-white rounded-lg shadow-lg">--%>
<%--    <h1 class="text-2xl font-bold text-indigo-700 mb-4">Liste des Projets</h1>--%>
<%--    <%--%>
<%--        List<Projet> projets = (List<Projet>) request.getAttribute("projets");--%>
<%--        if (projets == null || projets.isEmpty()) {--%>
<%--    %>--%>
<%--    <p class="text-gray-600">Aucun projet trouvé.</p>--%>
<%--    <% } else { %>--%>
<%--    <table class="w-full text-left border-collapse">--%>
<%--        <tr class="bg-indigo-600 text-white">--%>
<%--            <th class="p-2">ID</th>--%>
<%--            <th class="p-2">Nom</th>--%>
<%--            <th class="p-2">Description</th>--%>
<%--            <th class="p-2">Date Début</th>--%>
<%--            <th class="p-2">Date Fin</th>--%>
<%--            <th class="p-2">Budget</th>--%>
<%--        </tr>--%>
<%--        <% for (Projet p : projets) { %>--%>
<%--        <tr class="border-b">--%>
<%--            <td class="p-2"><%= p.getId() %></td>--%>
<%--            <td class="p-2"><%= p.getNom() != null ? p.getNom() : "" %></td>--%>
<%--            <td class="p-2"><%= p.getDescription() != null ? p.getDescription() : "" %></td>--%>
<%--            <td class="p-2"><%= p.getDateDebut() != null ? p.getDateDebut() : "" %></td>--%>
<%--            <td class="p-2"><%= p.getDateFin() != null ? p.getDateFin() : "" %></td>--%>
<%--            <td class="p-2"><%= p.getBudget() %></td>--%>
<%--        </tr>--%>
<%--        <% } %>--%>
<%--    </table>--%>
<%--    <% } %>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Projet" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Projets</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="max-w-4xl mx-auto my-10 p-6 bg-white rounded-lg shadow-lg">
    <h1 class="text-2xl font-bold text-indigo-700 mb-4">Liste des Projets</h1>
    <%
        List<Projet> projets = (List<Projet>) request.getAttribute("projets");
        if (projets == null || projets.isEmpty()) {
    %>
    <p class="text-gray-600">Aucun projet trouvé.</p>
    <% } else { %>
    <table class="w-full text-left border-collapse">
        <tr class="bg-indigo-600 text-white">
            <th class="p-2">ID</th>
            <th class="p-2">Nom</th>
            <th class="p-2">Description</th>
            <th class="p-2">Date Début</th>
            <th class="p-2">Date Fin</th>
            <th class="p-2">Budget</th>
            <th class="p-2">Actions</th>
        </tr>
        <% for (Projet p : projets) { %>
        <tr class="border-b">
            <td class="p-2"><%= p.getId() %></td>
            <td class="p-2"><%= p.getNom() != null ? p.getNom() : "" %></td>
            <td class="p-2"><%= p.getDescription() != null ? p.getDescription() : "" %></td>
            <td class="p-2"><%= p.getDateDebut() != null ? p.getDateDebut() : "" %></td>
            <td class="p-2"><%= p.getDateFin() != null ? p.getDateFin() : "" %></td>
            <td class="p-2"><%= p.getBudget() %></td>
            <td class="p-2">
                <a href="editProjet.jsp<%= p.getId() %>" class="text-blue-600 hover:text-blue-800">Modifier</a>
                <a href="ProjetServlet?action=delete&id=<%= p.getId() %>" class="text-red-600 hover:text-red-800 ml-2" onclick="return confirm('Confirmer la suppression ?');">Supprimer</a>
            </td>
        </tr>
        <% } %>
    </table>
    <% } %>
    <a href="createProjet.jsp" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700 mt-4 inline-block">Ajouter un autre projet</a>
</div>
</body>
</html>