<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructExpert | Créer un Projet</title>
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
                    <a href="projects.jsp" class="block py-4 px-6 text-accent font-medium border-b-3 border-accent">
                        <i class="fas fa-project-diagram mr-2"></i> Projets
                    </a>
                </li>
                <li>
                    <a href="tasks.jsp" class="block py-4 px-6 text-dark font-medium hover:text-accent border-b-3 border-transparent">
                        <i class="fas fa-tasks mr-2"></i> Tâches
                    </a>
                </li>
                <li>
                    <a href="resources.jsp" class="block py-4 px-6 text-dark font-medium hover:text-accent border-b-3 border-transparent">
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


<section class="py-8">
    <div class="container mx-auto px-4">
        <a href="projects.jsp" class="inline-flex items-center text-dark font-medium mb-4 hover:text-accent">
            <i class="fas fa-arrow-left mr-2"></i> Retour à la liste des projets
        </a>

        <div class="max-w-2xl mx-auto bg-white rounded-lg shadow-md overflow-hidden">
            <div class="bg-primary text-white px-6 py-4 flex justify-between items-center">
                <h2 class="text-xl font-bold">Créer un Projet</h2>
                <i class="fas fa-project-diagram text-xl"></i>
            </div>
            <div class="p-6">
                <form action="ProjetServlet?action=create" method="post" onsubmit="return validateForm()">
                    <div class="mb-4">
                        <label for="nom" class="block text-dark font-medium mb-2">Nom</label>
                        <input type="text" name="nom" id="nom" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent" required>
                        <p id="nomError" class="text-danger text-sm mt-1 hidden">Le nom doit contenir uniquement des lettres et des espaces.</p>
                    </div>

                    <div class="mb-4">
                        <label for="description" class="block text-dark font-medium mb-2">Description</label>
                        <textarea name="description" id="description" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent min-h-[100px]" required></textarea>
                        <p id="descriptionError" class="text-danger text-sm mt-1 hidden">La description est requise.</p>
                    </div>

                    <div class="mb-4">
                        <label for="dateDebut" class="block text-dark font-medium mb-2">Date Début</label>
                        <input type="date" name="dateDebut" id="dateDebut" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent" required>
                        <p id="dateDebutError" class="text-danger text-sm mt-1 hidden">La date de début doit être antérieure ou égale à la date de fin.</p>
                    </div>

                    <div class="mb-4">
                        <label for="dateFin" class="block text-dark font-medium mb-2">Date Fin</label>
                        <input type="date" name="dateFin" id="dateFin" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent" required>
                        <p id="dateFinError" class="text-danger text-sm mt-1 hidden">La date de fin doit être postérieure ou égale à la date de début.</p>
                    </div>

                    <div class="mb-6">
                        <label for="budget" class="block text-dark font-medium mb-2">Budget</label>
                        <input type="number" name="budget" id="budget" step="0.01" class="w-full px-3 py-2 border rounded-md focus:outline-none focus:ring-2 focus:ring-accent" required>
                        <p id="budgetError" class="text-danger text-sm mt-1 hidden">Le budget doit être un nombre positif.</p>
                    </div>

                    <div class="flex justify-end">
                        <button type="submit" class="bg-accent hover:bg-blue-600 text-white px-5 py-2 rounded-md flex items-center">
                            <i class="fas fa-plus-circle mr-2"></i> Créer le projet
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
<script>
    function validateForm() {
        // Réinitialiser les messages d'erreur
        document.querySelectorAll('[id$="Error"]').forEach(error => error.classList.add('hidden'));

        let isValid = true;

        // Récupérer les valeurs des champs
        const nom = document.getElementById('nom').value.trim();
        const description = document.getElementById('description').value.trim();
        const dateDebut = document.getElementById('dateDebut').value;
        const dateFin = document.getElementById('dateFin').value;
        const budget = parseFloat(document.getElementById('budget').value);

        // Validation du Nom (lettres et espaces uniquement)
        const nomRegex = /^[a-zA-Z\s]+$/;
        if (!nom || !nomRegex.test(nom)) {
            document.getElementById('nomError').classList.remove('hidden');
            isValid = false;
        }

        // Validation de la Description (non vide)
        if (!description) {
            document.getElementById('descriptionError').classList.remove('hidden');
            isValid = false;
        }

        // Validation des Dates
        if (dateDebut && dateFin) {
            const debut = new Date(dateDebut);
            const fin = new Date(dateFin);
            if (debut > fin) {
                document.getElementById('dateDebutError').classList.remove('hidden');
                document.getElementById('dateFinError').classList.remove('hidden');
                isValid = false;
            }
        }

        // Validation du Budget (positif)
        if (isNaN(budget) || budget <= 0) {
            document.getElementById('budgetError').classList.remove('hidden');
            isValid = false;
        }

        return isValid;
    }
</script>
</body>
</html>