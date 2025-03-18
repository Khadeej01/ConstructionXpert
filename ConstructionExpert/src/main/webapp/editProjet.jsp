<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Projet" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Modifier un Projet</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
<div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
    <h2 class="text-2xl font-bold text-indigo-700 mb-4">Modifier un Projet</h2>
    <%
        Projet projet = (Projet) request.getAttribute("projet");
        if (projet == null) {
            out.println("<p>Projet non trouvé.</p>");
        } else {
    %>
    <form action="updateProjet" method="post">
        <input type="hidden" name="id" value="<%= projet.getId() %>">
        <div class="mb-4">
            <label class="block text-gray-700">Nom</label>
            <input type="text" name="nom" value="<%= projet.getNom() != null ? projet.getNom() : "" %>" class="w-full p-2 border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Description</label>
            <textarea name="description" class="w-full p-2 border rounded" required><%= projet.getDescription() != null ? projet.getDescription() : "" %></textarea>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Date Début</label>
            <input type="date" name="dateDebut" value="<%= projet.getDateDebut() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(projet.getDateDebut()) : "" %>" class="w-full p-2 border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Date Fin</label>
            <input type="date" name="dateFin" value="<%= projet.getDateFin() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(projet.getDateFin()) : "" %>" class="w-full p-2 border rounded" required>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Budget</label>
            <input type="number" name="budget" step="0.01" value="<%= projet.getBudget() %>" class="w-full p-2 border rounded" required>
        </div>
        <button type="submit" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">Mettre à jour</button>
    </form>
    <% } %>
</div>
</body>
</html>