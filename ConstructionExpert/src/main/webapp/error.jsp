<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <title>Erreur</title>
    <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="bg-gray-100 flex items-center justify-center min-h-screen">
<div class="bg-white p-6 rounded-lg shadow-lg w-full max-w-md text-center">
    <h1 class="text-2xl font-bold text-red-600 mb-4">Oups ! Une erreur est survenue</h1>
    <p class="text-gray-700 mb-4">
        <%= request.getAttribute("error") != null ? request.getAttribute("error") : "Une erreur inattendue s'est produite." %>
    </p>
    <a href="listProjets.jsp" class="bg-indigo-600 text-white px-4 py-2 rounded hover:bg-indigo-700">Retour à la liste des projets</a>
</div>
</body>
</html>