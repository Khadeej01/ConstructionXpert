<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Resource" %>
<%@ page import="DAO.TacheDAO" %>
<%@ page import="Model.Tache" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Liste des Ressources</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="max-w-4xl mx-auto my-10 p-6 bg-white rounded-lg shadow-lg">
    <h1 class="text-2xl font-bold text-indigo-700 mb-4">Liste des Ressources</h1>
    <%
        List<Resource> resources = (List<Resource>) request.getAttribute("resources");
        if (resources == null || resources.isEmpty()) {
    %>
    <p class="text-gray-600">Aucune ressource trouvée.</p>
    <% } else { %>
    <table class="w-full text-left border-collapse">
        <tr class="bg-indigo-600 text-white">
            <th class="p-2">ID</th>
            <th class="p-2">Nom</th>
            <th class="p-2">Type</th>
            <th class="p-2">Quantité</th>
            <th class="p-2">Tâche</th>
            <th class="p-2">Actions</th>
        </tr>
        <%
            TacheDAO tacheDAO = new TacheDAO();
            for (Resource r : resources) {
                Tache tache = tacheDAO.getTacheById(r.getTaskId());
                String tacheDescription = (tache != null && tache.getDescription() != null) ? tache.getDescription() : "Tâche inconnue";
        %>
        <tr class="border-b">
            <td class="p-2"><%= r.getId() %></td>
            <td class="p-2"><%= r.getNom() != null ? r.getNom() : "Sans nom" %></td>
            <td class="p-2"><%= r.getType() != null ? r.getType() : "Non défini" %></td>
            <td class="p-2"><%= r.getQuantite() %></td>
            <td class="p-2"><%= tacheDescription %></td>
            <td class="p-2">
                <a href="ResourceServlet?action=edit&id=<%= r.getId() %>" class="text-blue-600 hover:text-blue-800">Modifier</a>
                <a href="ResourceServlet?action=delete&id=<%= r.getId() %>" class="text-red-600 hover:text-red-800 ml-2" onclick="return confirm('Confirmer la suppression ?');">Supprimer</a>
            </td>
        </tr>
        <% } %>
    </table>
    <% } %>
    <a href="ResourceServlet?action=create" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700 mt-4 inline-block">Ajouter une ressource</a>
    <a href="TacheServlet" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-700 mt-4 inline-block ml-2">Retour aux tâches</a>
</div>
</body>
</html>