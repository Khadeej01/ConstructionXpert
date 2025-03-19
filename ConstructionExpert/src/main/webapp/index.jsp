<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>ConstructionXpert</title>--%>
<%--    <script src="https://cdn.tailwindcss.com"></script>--%>
<%--</head>--%>
<%--<body class="bg-gray-100 text-gray-900">--%>
<%--<header class="bg-white shadow-md p-4 flex justify-between items-center">--%>
<%--    <div class="flex items-center space-x-2">--%>
<%--        <img src="https://www.flaticon.com/fr/icone-gratuite/equipage_15564469?term=construction&page=1&position=41&origin=search&related_id=15564469" alt="image host" class="h-8"/></a>--%>
<%--        <span class="text-xl font-bold text-indigo-700">ConstructionXpert</span>--%>
<%--    </div>--%>

<%--    <div class="space-x-6">--%>
<%--        <a href="createProjet.jsp" class="hover:text-blue-200">Projet</a>--%>
<%--        <a href="createTache.jsp" class="hover:text-blue-200">Task </a>--%>
<%--        <a href="#" class="hover:text-blue-200">Resources</a>--%>
<%--        <a href="#" class="hover:text-blue-200">LOGIN</a>--%>
<%--        <a href="login.jsp" class="hover:text-blue-200">Login</a>--%>

<%--    </div>--%>
<%--</header>--%>

<%--<main class="max-w-4xl mx-auto my-10 bg-white p-6 rounded-lg shadow-lg">--%>
<%--    <div class="rounded-lg overflow-hidden">--%>

<%--        <img src="https://images.pexels.com/photos/31161357/pexels-photo-31161357/free-photo-of-facade-en-verre-moderne-dans-l-architecture-berlinoise.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2" alt="Building Image" class="w-full">--%>
<%--    </div>--%>

<%--    <div class="mt-6">--%>
<%--        <h2 class="text-xl font-semibold text-indigo-700 mb-2">Who We Are</h2>--%>
<%--        <p class="text-gray-700 leading-relaxed">--%>
<%--            ConstructionXpert is a global consulting firm that combines technical,--%>
<%--            scientific, financial, and strategic expertise to advise clients seeking to--%>
<%--            realize value and mitigate risk. Our professionals serve as trusted advisors--%>
<%--            to organizations facing high stakes matters demanding urgent attention,--%>
<%--            staunch integrity, proven experience, clear-cut analysis, and an understanding--%>
<%--            of both tangible and intangible assets.--%>
<%--        </p>--%>
<%--    </div>--%>
<%--    <div class="mt-4">--%>
<%--        <a href="#" class="inline-block bg-indigo-600 text-white px-6 py-2 rounded-lg hover:bg-indigo-700 transition">More about us</a>--%>
<%--    </div>--%>
<%--</main>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ConstructExpert | Plateforme d'expertise en construction</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        :root {
            --primary-color: #2c3e50;
            --secondary-color: #f39c12;
            --accent-color: #3498db;
            --light-color: #ecf0f1;
            --dark-color: #2c3e50;
            --success-color: #27ae60;
            --danger-color: #e74c3c;
            --warning-color: #f1c40f;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background-color: #f5f5f5;
        }

        .container {
            width: 100%;
            max-width: 1400px;
            margin: 0 auto;
            padding: 0 20px;
        }

        /* Header */
        header {
            background-color: var(--primary-color);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logo {
            display: flex;
            align-items: center;
        }

        .logo h1 {
            font-size: 1.8rem;
            margin-left: 10px;
        }

        .logo span {
            color: var(--secondary-color);
        }

        .user-area {
            display: flex;
            align-items: center;
        }

        .user-area .user-info {
            margin-right: 15px;
            text-align: right;
        }

        .user-area .avatar {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            background-color: var(--secondary-color);
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: bold;
        }

        /* Navigation */
        nav {
            background-color: white;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .nav-container {
            display: flex;
            justify-content: space-between;
        }

        .main-menu {
            display: flex;
            list-style: none;
        }

        .main-menu li a {
            display: block;
            padding: 1rem 1.5rem;
            color: var(--dark-color);
            text-decoration: none;
            font-weight: 500;
            transition: all 0.3s ease;
            border-bottom: 3px solid transparent;
        }

        .main-menu li a:hover,
        .main-menu li a.active {
            color: var(--accent-color);
            border-bottom: 3px solid var(--accent-color);
        }

        .main-menu li a i {
            margin-right: 8px;
        }

        .search-container {
            display: flex;
            align-items: center;
            padding: 0.5rem 0;
        }

        .search-container input {
            padding: 0.5rem 1rem;
            border: 1px solid #ddd;
            border-radius: 4px;
            outline: none;
            width: 220px;
        }

        .search-container button {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 0.5rem 1rem;
            margin-left: 5px;
            border-radius: 4px;
            cursor: pointer;
        }

        /* Dashboard Grid */
        .dashboard {
            padding: 2rem 0;
        }

        .dashboard-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 20px;
            margin-top: 1.5rem;
        }

        .dash-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            overflow: hidden;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .dash-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
        }

        .dash-card-header {
            padding: 1.2rem;
            background-color: var(--primary-color);
            color: white;
            font-weight: bold;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dash-card-header i {
            font-size: 1.3rem;
        }

        .dash-card-body {
            padding: 1.2rem;
        }

        .dash-card-footer {
            padding: 0.8rem 1.2rem;
            background-color: #f8f9fa;
            text-align: right;
        }

        .dash-card-footer a {
            color: var(--accent-color);
            text-decoration: none;
            font-weight: 500;
        }

        .dash-card-footer a:hover {
            text-decoration: underline;
        }

        .stat-box {
            display: flex;
            align-items: center;
            margin-bottom: 15px;
        }

        .stat-icon {
            width: 50px;
            height: 50px;
            background-color: rgba(52, 152, 219, 0.1);
            color: var(--accent-color);
            border-radius: 8px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            margin-right: 15px;
        }

        .stat-info h3 {
            font-size: 1.5rem;
            margin-bottom: 5px;
        }

        .stat-info p {
            color: #6c757d;
            font-size: 0.9rem;
        }

        /* Project List */
        .project-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .project-item:last-child {
            border-bottom: none;
        }

        .project-details h4 {
            margin-bottom: 5px;
        }

        .project-details p {
            font-size: 0.85rem;
            color: #6c757d;
        }

        .project-status {
            padding: 3px 10px;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: bold;
        }

        .status-active {
            background-color: rgba(39, 174, 96, 0.1);
            color: var(--success-color);
        }

        .status-pending {
            background-color: rgba(241, 196, 15, 0.1);
            color: var(--warning-color);
        }

        .status-completed {
            background-color: rgba(52, 152, 219, 0.1);
            color: var(--accent-color);
        }

        /* Tasks List */
        .task-item {
            display: flex;
            align-items: center;
            margin-bottom: 12px;
        }

        .task-checkbox {
            margin-right: 10px;
        }

        .task-checkbox input[type="checkbox"] {
            width: 18px;
            height: 18px;
        }

        .task-info {
            flex-grow: 1;
        }

        .task-info h4 {
            font-size: 0.95rem;
            margin-bottom: 3px;
        }

        .task-info p {
            font-size: 0.8rem;
            color: #6c757d;
        }

        .task-date {
            font-size: 0.8rem;
            color: #6c757d;
        }

        .dashboard-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .dashboard-header h2 {
            color: var(--dark-color);
        }

        .action-btn {
            background-color: var(--accent-color);
            color: white;
            border: none;
            padding: 0.6rem 1.2rem;
            border-radius: 4px;
            cursor: pointer;
            font-weight: 500;
            display: inline-flex;
            align-items: center;
        }

        .action-btn i {
            margin-right: 8px;
        }

        .action-btn:hover {
            background-color: #2980b9;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                text-align: center;
            }

            .logo {
                margin-bottom: 1rem;
                justify-content: center;
            }

            .user-area {
                margin-top: 1rem;
                justify-content: center;
            }

            .nav-container {
                flex-direction: column;
            }

            .main-menu {
                flex-wrap: wrap;
                justify-content: center;
            }

            .search-container {
                margin-top: 1rem;
                justify-content: center;
            }

            .dashboard-header {
                flex-direction: column;
                gap: 1rem;
            }
        }

        @media (max-width: 576px) {
            .dashboard-grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>
<body>
<!-- Header -->
<header>
    <div class="container header-content">
        <div class="logo">
            <i class="fas fa-hard-hat fa-2x"></i>
            <h1>Construct<span>Expert</span></h1>
        </div>

        <c:choose>
            <c:when test="${not empty sessionScope.user}">
                <div class="user-area">
                    <div class="user-info">
                        <div>${sessionScope.user.fullName}</div>
                        <small>${sessionScope.user.role}</small>
                    </div>
                    <div class="avatar">
                            ${fn:substring(sessionScope.user.fullName, 0, 1)}
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <div class="user-area">
                    <a href="login.jsp" class="action-btn">
                        <i class="fas fa-sign-in-alt"></i> Se connecter
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</header>

<!-- Navigation -->
<nav>
    <div class="container nav-container">
        <ul class="main-menu">
            <li><a href="dashboard.jsp" class="active"><i class="fas fa-tachometer-alt"></i> Tableau de bord</a></li>
            <li><a href="createTache.jsp"><i class="fas fa-project-diagram"></i> Projets</a></li>
            <li><a href="createTache.jsp"><i class="fas fa-tasks"></i> Tâches</a></li>
            <li><a href="createResource.jsp"><i class="fas fa-tools"></i> Ressources</a></li>
        </ul>

        <div class="search-container">
            <input type="text" placeholder="Rechercher...">
            <button type="submit"><i class="fas fa-search"></i></button>
        </div>
    </div>
</nav>

<!-- Dashboard -->
<section class="dashboard">
    <div class="container">
        <div class="dashboard-header">
            <h2>Tableau de bord</h2>
            <button class="action-btn"><i class="fas fa-plus"></i> Nouveau projet</button>
        </div>

        <div class="dashboard-grid">
            <!-- Statistics Card -->
            <div class="dash-card">
                <div class="dash-card-header">
                    <span>Statistiques</span>
                    <i class="fas fa-chart-bar"></i>
                </div>
                <div class="dash-card-body">
                    <div class="stat-box">
                        <div class="stat-icon">
                            <i class="fas fa-project-diagram"></i>
                        </div>
                        <div class="stat-info">
                            <h3>12</h3>
                            <p>Projets actifs</p>
                        </div>
                    </div>

                    <div class="stat-box">
                        <div class="stat-icon">
                            <i class="fas fa-tasks"></i>
                        </div>
                        <div class="stat-info">
                            <h3>24</h3>
                            <p>Tâches en cours</p>
                        </div>
                    </div>

                    <div class="stat-box">
                        <div class="stat-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="stat-info">
                            <h3>18</h3>
                            <p>Équipes déployées</p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Projects Card -->
            <div class="dash-card">
                <div class="dash-card-header">
                    <span>Projets récents</span>
                    <i class="fas fa-project-diagram"></i>
                </div>
                <div class="dash-card-body">
                    <div class="project-item">
                        <div class="project-details">
                            <h4>Immeuble Horizon</h4>
                            <p>Phase: Fondations</p>
                        </div>
                        <span class="project-status status-active">Actif</span>
                    </div>

                    <div class="project-item">
                        <div class="project-details">
                            <h4>Centre Commercial Élysée</h4>
                            <p>Phase: Planification</p>
                        </div>
                        <span class="project-status status-pending">En attente</span>
                    </div>

                    <div class="project-item">
                        <div class="project-details">
                            <h4>Résidence Les Pins</h4>
                            <p>Phase: Finalisation</p>
                        </div>
                        <span class="project-status status-completed">Terminé</span>
                    </div>
                </div>
                <div class="dash-card-footer">
                    <a href="projects.jsp">Voir tous les projets</a>
                </div>
            </div>

            <!-- Tasks Card -->
            <div class="dash-card">
                <div class="dash-card-header">
                    <span>Tâches à venir</span>
                    <i class="fas fa-tasks"></i>
                </div>
                <div class="dash-card-body">
                    <div class="task-item">
                        <div class="task-checkbox">
                            <input type="checkbox" id="task1">
                        </div>
                        <div class="task-info">
                            <h4>Inspection des fondations</h4>
                            <p>Projet: Immeuble Horizon</p>
                        </div>
                        <div class="task-date">
                            20 Mar
                        </div>
                    </div>

                    <div class="task-item">
                        <div class="task-checkbox">
                            <input type="checkbox" id="task2">
                        </div>
                        <div class="task-info">
                            <h4>Réunion avec l'architecte</h4>
                            <p>Projet: Centre Commercial Élysée</p>
                        </div>
                        <div class="task-date">
                            22 Mar
                        </div>
                    </div>

                    <div class="task-item">
                        <div class="task-checkbox">
                            <input type="checkbox" id="task3">
                        </div>
                        <div class="task-info">
                            <h4>Livraison des matériaux</h4>
                            <p>Projet: Résidence Les Pins</p>
                        </div>
                        <div class="task-date">
                            25 Mar
                        </div>
                    </div>

                    <div class="task-item">
                        <div class="task-checkbox">
                            <input type="checkbox" id="task4">
                        </div>
                        <div class="task-info">
                            <h4>Vérification des normes</h4>
                            <p>Projet: Immeuble Horizon</p>
                        </div>
                        <div class="task-date">
                            27 Mar
                        </div>
                    </div>
                </div>
                <div class="dash-card-footer">
                    <a href="tasks.jsp">Voir toutes les tâches</a>
                </div>
            </div>

            <!-- Resources Card -->
            <div class="dash-card">
                <div class="dash-card-header">
                    <span>Ressources disponibles</span>
                    <i class="fas fa-tools"></i>
                </div>
                <div class="dash-card-body">
                    <div class="project-item">
                        <div class="project-details">
                            <h4>Équipe A</h4>
                            <p>6 membres, spécialité: béton</p>
                        </div>
                        <span class="project-status status-active">Disponible</span>
                    </div>

                    <div class="project-item">
                        <div class="project-details">
                            <h4>Grue mobile</h4>
                            <p>Capacité: 50 tonnes</p>
                        </div>
                        <span class="project-status status-pending">Réservé</span>
                    </div>

                    <div class="project-item">
                        <div class="project-details">
                            <h4>Équipe Électricité</h4>
                            <p>4 membres, spécialité: installation</p>
                        </div>
                        <span class="project-status status-active">Disponible</span>
                    </div>
                </div>
                <div class="dash-card-footer">
                    <a href="resources.jsp">Voir toutes les ressources</a>
                </div>
            </div>
        </div>
    </div>
</section>

<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/js/all.min.js"></script>
</body>
</html>