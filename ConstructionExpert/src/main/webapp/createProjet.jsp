<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Créer un Projet</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
<div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md">
    <h2 class="text-2xl font-bold text-indigo-700 mb-4">Créer un Projet</h2>
    <form action="ProjetServlet?action=create" method="post" onsubmit="return validateForm()">
        <div class="mb-4">
            <label class="block text-gray-700">Nom</label>
            <input type="text" name="nom" id="nom" class="w-full p-2 border rounded" required>
            <span id="nomError" class="text-red-500 text-sm hidden">Le nom doit contenir uniquement des lettres et des espaces.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Description</label>
            <textarea name="description" id="description" class="w-full p-2 border rounded" required></textarea>
            <span id="descriptionError" class="text-red-500 text-sm hidden">La description est requise.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Date Début</label>
            <input type="date" name="dateDebut" id="dateDebut" class="w-full p-2 border rounded" required>
            <span id="dateDebutError" class="text-red-500 text-sm hidden">La date de début doit être antérieure ou égale à la date de fin.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Date Fin</label>
            <input type="date" name="dateFin" id="dateFin" class="w-full p-2 border rounded" required>
            <span id="dateFinError" class="text-red-500 text-sm hidden">La date de fin doit être postérieure ou égale à la date de début.</span>
        </div>
        <div class="mb-4">
            <label class="block text-gray-700">Budget</label>
            <input type="number" name="budget" id="budget" step="0.01" class="w-full p-2 border rounded" required>
            <span id="budgetError" class="text-red-500 text-sm hidden">Le budget doit être un nombre positif.</span>
        </div>
        <button type="submit" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">Créer</button>
    </form>
</div>

<script>
    function validateForm() {
        // Réinitialiser les messages d'erreur
        document.querySelectorAll('.text-red-500').forEach(error => error.classList.add('hidden'));

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