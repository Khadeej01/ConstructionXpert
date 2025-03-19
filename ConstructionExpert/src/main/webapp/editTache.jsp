<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Tache" %>
<%@ page import="Model.Projet" %>
<%@ page import="DAO.ProjetDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Modifier une Tâche</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
<div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
    <h2 class="text-2xl font-bold text-indigo-700 mb-4">Modifier une Tâche</h2>
    <%
        Tache tache = (Tache) request.getAttribute("tache");
        if (tache == null) {
    %>
    <p class="text-red-500">Tâche non trouvée.</p>
    <% } else { %>
    <form action="TacheServlet?action=update" method="post" onsubmit="return validateForm()">
        <input type="hidden" name="id" value="<%= tache.getId() %>">
        <div class="mb-4">
            <label class="block text-gray-700">Projet</label>
            <select name="projectId" id="projectId" class="w-full p-2 border rounded" required>
                <option value="">Sélectionner un projet</option>
                <%
                    ProjetDAO projetDAO = new ProjetDAO();
                    List<Projet> projets = projetDAO.getAllProjets();
                    for (Projet projet : projets) {
                %>
                <option value="<%= projet.getId() %>" <%= tache.getProjectId() == projet.getId() ? "selected" : "" %>>
                    <%= projet.getNom() %>
                </option>
                <% } %>
            </select>
            <span id="projectIdError" class="text-red-500 text-sm hidden">Veuillez sélectionner un projet.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Description</label>
            <textarea name="description" id="description" class="w-full p-2 border rounded" required><%= tache.getDescription() != null ? tache.getDescription() : "" %></textarea>
            <span id="descriptionError" class="text-red-500 text-sm hidden">La description est requise.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Date Début</label>
            <input type="date" name="dateDebut" id="dateDebut" value="<%= tache.getDateDebut() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(tache.getDateDebut()) : "" %>" class="w-full p-2 border rounded" required>
            <span id="dateDebutError" class="text-red-500 text-sm hidden">La date de début doit être antérieure ou égale à la date de fin.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Date Fin</label>
            <input type="date" name="dateFin" id="dateFin" value="<%= tache.getDateFin() != null ? new java.text.SimpleDateFormat("yyyy-MM-dd").format(tache.getDateFin()) : "" %>" class="w-full p-2 border rounded" required>
            <span id="dateFinError" class="text-red-500 text-sm hidden">La date de fin doit être postérieure ou égale à la date de début.</span>
        </div>
        <button type="submit" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">Mettre à jour</button>
    </form>
    <% } %>
</div>

<script>
    function validateForm() {
        document.querySelectorAll('.text-red-500').forEach(error => error.classList.add('hidden'));

        let isValid = true;

        const projectId = document.getElementById('projectId').value;
        const description = document.getElementById('description').value.trim();
        const dateDebut = document.getElementById('dateDebut').value;
        const dateFin = document.getElementById('dateFin').value;

        if (!projectId) {
            document.getElementById('projectIdError').classList.remove('hidden');
            isValid = false;
        }

        if (!description) {
            document.getElementById('descriptionError').classList.remove('hidden');
            isValid = false;
        }

        if (dateDebut && dateFin) {
            const debut = new Date(dateDebut);
            const fin = new Date(dateFin);
            if (debut > fin) {
                document.getElementById('dateDebutError').classList.remove('hidden');
                document.getElementById('dateFinError').classList.remove('hidden');
                isValid = false;
            }
        }

        return isValid;
    }
</script>
</body>
</html>