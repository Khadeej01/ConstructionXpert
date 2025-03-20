<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ page import="Model.Tache" %>--%>
<%--<%@ page import="DAO.TacheDAO" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="fr">--%>
<%--<head>--%>
<%--    <title>Créer une Ressource</title>--%>
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
<%--</head>--%>
<%--<body class="bg-gray-100 flex items-center justify-center min-h-screen">--%>
<%--<div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">--%>
<%--    <h2 class="text-2xl font-bold text-indigo-700 mb-4">Créer une Ressource</h2>--%>
<%--    <form action="ResourceServlet?action=create" method="post" onsubmit="return validateForm()">--%>
<%--        <div class="mb-4">--%>
<%--            <label class="block text-gray-700">Tâche</label>--%>
<%--            <select name="taskId" id="taskId" class="w-full p-2 border rounded" required>--%>
<%--                <option value="">Sélectionner une tâche</option>--%>
<%--                <%--%>
<%--                    TacheDAO tacheDAO = new TacheDAO();--%>
<%--                    List<Tache> taches = tacheDAO.getAllTaches();--%>
<%--                    for (Tache tache : taches) {--%>
<%--                %>--%>
<%--                <option value="<%= tache.getId() %>">Tâche <%= tache.getId() %> - <%= tache.getDescription() %></option>--%>
<%--                <% } %>--%>
<%--            </select>--%>
<%--            <span id="taskIdError" class="text-red-500 text-sm hidden">Veuillez sélectionner une tâche.</span>--%>
<%--        </div>--%>
<%--        <div class="mb-4">--%>
<%--            <label class="block text-gray-700">Nom</label>--%>
<%--            <input type="text" name="nom" id="nom" class="w-full p-2 border rounded" required>--%>
<%--            <span id="nomError" class="text-red-500 text-sm hidden">Le nom doit contenir uniquement des lettres et des espaces.</span>--%>
<%--        </div>--%>
<%--        <div class="mb-4">--%>
<%--            <label class="block text-gray-700">Type</label>--%>
<%--            <select name="type" id="type" class="w-full p-2 border rounded" required>--%>
<%--                <option value="">Sélectionner un type</option>--%>
<%--                <option value="Matériel">Matériel</option>--%>
<%--                <option value="Main-d'œuvre">Main-d'œuvre</option>--%>
<%--                <option value="Équipement">Équipement</option>--%>
<%--            </select>--%>
<%--            <span id="typeError" class="text-red-500 text-sm hidden">Veuillez sélectionner un type.</span>--%>
<%--        </div>--%>
<%--        <div class="mb-4">--%>
<%--            <label class="block text-gray-700">Quantité</label>--%>
<%--            <input type="number" name="quantite" id="quantite" class="w-full p-2 border rounded" required>--%>
<%--            <span id="quantiteError" class="text-red-500 text-sm hidden">La quantité doit être un nombre positif.</span>--%>
<%--        </div>--%>
<%--        <button type="submit" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">Créer</button>--%>
<%--    </form>--%>
<%--</div>--%>

<%--<script>--%>
<%--    function validateForm() {--%>
<%--        document.querySelectorAll('.text-red-500').forEach(error => error.classList.add('hidden'));--%>

<%--        let isValid = true;--%>

<%--        const taskId = document.getElementById('taskId').value;--%>
<%--        const nom = document.getElementById('nom').value.trim();--%>
<%--        const type = document.getElementById('type').value;--%>
<%--        const quantite = parseInt(document.getElementById('quantite').value);--%>

<%--        if (!taskId) {--%>
<%--            document.getElementById('taskIdError').classList.remove('hidden');--%>
<%--            isValid = false;--%>
<%--        }--%>

<%--        const nomRegex = /^[a-zA-Z\s]+$/;--%>
<%--        if (!nom || !nomRegex.test(nom)) {--%>
<%--            document.getElementById('nomError').classList.remove('hidden');--%>
<%--            isValid = false;--%>
<%--        }--%>

<%--        if (!type) {--%>
<%--            document.getElementById('typeError').classList.remove('hidden');--%>
<%--            isValid = false;--%>
<%--        }--%>

<%--        if (isNaN(quantite) || quantite <= 0) {--%>
<%--            document.getElementById('quantiteError').classList.remove('hidden');--%>
<%--            isValid = false;--%>
<%--        }--%>

<%--        return isValid;--%>
<%--    }--%>
<%--</script>--%>
<%--</body>--%>
<%--</html>--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="Model.Tache" %>
<%@ page import="DAO.TacheDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Créer une Ressource</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
<div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
    <h2 class="text-2xl font-bold text-indigo-700 mb-4">Créer une Ressource</h2>
    <form action="ResourceServlet?action=create" method="post" onsubmit="return validateForm()">
        <div class="mb-4">
            <label class="block text-gray-700">Tâche</label>
            <select name="taskId" id="taskId" class="w-full p-2 border rounded" required>
                <option value="">Sélectionner une tâche</option>
                <%
                    TacheDAO tacheDAO = new TacheDAO();
                    List<Tache> taches = tacheDAO.getAllTaches();
                    for (Tache tache : taches) {
                %>
                <option value="<%= tache.getId() %>">Tâche <%= tache.getId() %> - <%= tache.getDescription() %></option>
                <% } %>
            </select>
            <span id="taskIdError" class="text-red-500 text-sm hidden">Veuillez sélectionner une tâche.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Nom</label>
            <input type="text" name="nom" id="nom" class="w-full p-2 border rounded" required>
            <span id="nomError" class="text-red-500 text-sm hidden">Le nom doit contenir uniquement des lettres et des espaces.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Type</label>
            <select name="type" id="type" class="w-full p-2 border rounded" required>
                <option value="">Sélectionner un type</option>
                <option value="Matériel">Matériel</option>
                <option value="Main-d'œuvre">Main-d'œuvre</option>
                <option value="Équipement">Équipement</option>
            </select>
            <span id="typeError" class="text-red-500 text-sm hidden">Veuillez sélectionner un type.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Quantité</label>
            <input type="number" name="quantite" id="quantite" class="w-full p-2 border rounded" required>
            <span id="quantiteError" class="text-red-500 text-sm hidden">La quantité doit être un nombre positif.</span>
        </div>
        <button type="submit" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">Créer</button>
    </form>
</div>

<script>
    function validateForm() {
        document.querySelectorAll('.text-red-500').forEach(error => error.classList.add('hidden'));

        let isValid = true;

        const taskId = document.getElementById('taskId').value;
        const nom = document.getElementById('nom').value.trim();
        const type = document.getElementById('type').value;
        const quantite = parseInt(document.getElementById('quantite').value);

        if (!taskId) {
            document.getElementById('taskIdError').classList.remove('hidden');
            isValid = false;
        }

        const nomRegex = /^[a-zA-Z\s]+$/;
        if (!nom || !nomRegex.test(nom)) {
            document.getElementById('nomError').classList.remove('hidden');
            isValid = false;
        }

        if (!type) {
            document.getElementById('typeError').classList.remove('hidden');
            isValid = false;
        }

        if (isNaN(quantite) || quantite <= 0) {
            document.getElementById('quantiteError').classList.remove('hidden');
            isValid = false;
        }

        return isValid;
    }
</script>
</body>
</html>