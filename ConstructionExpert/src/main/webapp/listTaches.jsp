<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Tache" %>
<%@ page import="DAO.TacheDAO" %>
<%@ page import="Model.Projet" %>
<%@ page import="DAO.ProjetDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
  <title>Liste des Tâches</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100">
<div class="max-w-4xl mx-auto my-10 p-6 bg-white rounded-lg shadow-lg">
  <h1 class="text-2xl font-bold text-indigo-700 mb-4">Liste des Tâches</h1>
  <%
    TacheDAO tacheDAO = new TacheDAO();
    List<Tache> taches = tacheDAO.getAllTaches(); // Nouvelle méthode à implémenter
    if (taches == null || taches.isEmpty()) {
  %>
  <p class="text-gray-600">Aucune tâche trouvée.</p>
  <% } else { %>
  <table class="w-full text-left border-collapse">
    <tr class="bg-indigo-600 text-white">
      <th class="p-2">ID</th>
      <th class="p-2">Description</th>
      <th class="p-2">Date Début</th>
      <th class="p-2">Date Fin</th>
      <th class="p-2">Projet</th>
      <th class="p-2">Actions</th>
    </tr>
    <%
      ProjetDAO projetDAO = new ProjetDAO();
      for (Tache t : taches) {
        Projet projet = projetDAO.getProjetById(t.getProjectId());
        String projetNom = (projet != null && projet.getNom() != null) ? projet.getNom() : "Projet inconnu";
    %>
    <tr class="border-b">
      <td class="p-2"><%= t.getId() %></td>
      <td class="p-2"><%= t.getDescription() != null ? t.getDescription() : "Sans description" %></td>
      <td class="p-2"><%= t.getDateDebut() != null ? t.getDateDebut() : "Non définie" %></td>
      <td class="p-2"><%= t.getDateFin() != null ? t.getDateFin() : "Non définie" %></td>
      <td class="p-2"><%= projetNom %></td>
      <td class="p-2">
        <a href="TacheServlet?action=edit&id=<%= t.getId() %>" class="text-blue-600 hover:text-blue-800">Modifier</a>
        <a href="TacheServlet?action=delete&id=<%= t.getId() %>" class="text-red-600 hover:text-red-800 ml-2" onclick="return confirm('Confirmer la suppression ?');">Supprimer</a>
      </td>
    </tr>
    <% } %>
  </table>
  <% } %>
  <a href="createTache.jsp" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700 mt-4 inline-block">Ajouter une tâche</a>
  <a href="listProjets.jsp" class="bg-gray-500 text-white px-4 py-2 rounded hover:bg-gray-700 mt-4 inline-block ml-2">Retour aux projets</a>
  <td class="p-2">
    <a href="TacheServlet?action=edit&id=<%= t.getId() %>" class="text-blue-600 hover:text-blue-800">Edit</a>
    <a href="TacheServlet?action=delete&id=<%= t.getId() %>" class="text-red-600 hover:text-red-800 ml-2" onclick="return confirm('Confirmer la suppression ?');">Delete</a>
    <a href="<%= t.getId() %>" class="text-green-600 hover:text-green-800 ml-2">Ajouter une ressource</a>
  </td>
</div>
</body>
</html>