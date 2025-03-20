<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.Resource" %>
<%@ page import="Model.Tache" %>
<%@ page import="DAO.TacheDAO" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructExpert | Modifier une Ressource</title>
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
                    <a href="index.jsp" class="block py-4 px-6 text-dark font-medium hover:text-accent border-b-3 border-transparent">
                        <i class="fas fa-tachometer-alt mr-2"></i> Tableau de bord
                    </a>
                </li>
                <li>
                    <a href="listProjets.jsp" class="block py-4 px-6 text-dark font-medium hover:text-accent border-b-3 border-transparent">
                        <i class="fas fa-project-diagram mr-2"></i> Projets
                    </a>
                </li>
                <li>
                    <a href="listTaches.jsp" class="block py-4 px-6 text-dark font-medium hover:text-accent border-b-3 border-transparent">
                        <i class="fas fa-tasks mr-2"></i> Tâches
                    </a>
                </li>
                <li>
                    <a href="listResources.jsp" class="block py-4 px-6 text-accent font-medium border-b-3 border-accent">
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
        <a href="listResources.jsp" class="inline-flex items-center text-dark font-medium mb-4 hover:text-accent">
            <i class="fas fa-arrow-left mr-2"></i> Retour à la liste des ressources
        </a>

        <div class="max-w-2xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <div class="bg-primary text-white px-6 py-4 flex justify-between items-center">
                <h2 class="text-xl font-bold">Modifier une Ressource</h2>
                <i class="fas fa-edit text-xl"></i>
            </div>
            <div class="p-6">
                <%
                    Resource resource = (Resource) request.getAttribute("resource");
                    if (resource == null) {
                %>
                <p class="text-danger">Ressource non trouvée.</p>
                <% } else { %>
                <form action="ResourceServlet?action=update" method="post" onsubmit="return validateForm()">
                    <input type="hidden" name="id" value="<%= resource.getId() %>">
                    <div class="mb-4">
                        <label for="taskId" class="block text-dark font-medium mb-2">Tâche</label>
                        <select name="taskId" id="taskId" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent" required>
                            <option value="">Sélectionner une tâche</option>
                            <%
                                TacheDAO tacheDAO = new TacheDAO();
                                List<Tache> taches = tacheDAO.getAllTaches();
                                for (Tache tache : taches) {
                            %>
                            <option value="<%= tache.getId() %>" <%= resource.getTaskId() == tache.getId() ? "selected" : "" %>>
                                Tâche <%= tache.getId() %> - <%= tache.getDescription() != null ? tache.getDescription() : "Sans description" %>
                            </option>
                            <% } %>
                        </select>
                        <p id="taskIdError" class="text-danger text-sm mt-1 hidden">Veuillez sélectionner une tâche.</p>
                    </div>

                    <div class="mb-4">
                        <label for="nom" class="block text-dark font-medium mb-2">Nom</label>
                        <input type="text" name="nom" id="nom" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent" value="<%= resource.getNom() != null ? resource.getNom() : "" %>" required>
                        <p id="nomError" class="text-danger text-sm mt-1 hidden">Le nom doit contenir uniquement des lettres et des espaces.</p>
                    </div>

                    <div class="mb-4">
                        <label for="type" class="block text-dark font-medium mb-2">Type</label>
                        <select name="type" id="type" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent" required>
                            <option value="">Sélectionner un type</option>
                            <option value="Matériel" <%= "Matériel".equals(resource.getType()) ? "selected" : "" %>>Matériel</option>
                            <option value="Main-d'œuvre" <%= "Main-d'œuvre".equals(resource.getType()) ? "selected" : "" %>>Main-d'œuvre</option>
                            <option value="Équipement" <%= "Équipement".equals(resource.getType()) ? "selected" : "" %>>Équipement</option>
                        </select>
                        <p id="typeError" class="text-danger text-sm mt-1 hidden">Veuillez sélectionner un type.</p>
                    </div>

                    <div class="mb-6">
                        <label for="quantite" class="block text-dark font-medium mb-2">Quantité</label>
                        <input type="number" name="quantite" id="quantite" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent" value="<%= resource.getQuantite() %>" required>
                        <p id="quantiteError" class="text-danger text-sm mt-1 hidden">La quantité doit être un nombre positif.</p>
                    </div>

                    <div class="flex justify-end">
                        <button type="submit" class="bg-accent hover:bg-blue-600 text-white px-5 py-2 rounded-md flex items-center">
                            <i class="fas fa-save mr-2"></i> Mettre à jour
                        </button>
                    </div>
                </form>
                <% } %>
            </div>
        </div>
    </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
<script>
    function validateForm() {
        document.querySelectorAll('[id$="Error"]').forEach(error => error.classList.add('hidden'));

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