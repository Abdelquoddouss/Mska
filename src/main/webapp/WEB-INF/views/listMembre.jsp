<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Liste des Membres</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #333;
            background: #f0f4f7;
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            padding: 20px;
            margin: 0 auto;
        }
        .table-wrapper {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        .table-title {
            margin-bottom: 20px;
            background: #007bff;
            color: #fff;
            border-radius: 8px 8px 0 0;
            padding: 15px;
        }
        .table-title h2 {
            font-size: 24px;
            margin: 0;
        }
        .add-new {
            float: right;
            height: 40px;
            font-weight: bold;
            font-size: 16px;
            background: #28a745;
            color: white;
            border-radius: 25px;
            padding: 10px 20px;
            border: none;
            transition: background-color 0.3s ease;
        }
        .add-new:hover {
            background: #218838;
        }
        table.table {
            width: 100%;
            margin-top: 20px;
            background-color: #f8f9fa;
            border-radius: 8px;
            overflow: hidden;
        }
        table.table th, table.table td {
            padding: 15px;
            text-align: left;
            vertical-align: middle;
            border-bottom: 1px solid #dee2e6;
        }
        table.table th {
            background-color: #007bff;
            color: #fff;
            text-transform: uppercase;
        }
        table.table tr:hover {
            background-color: #e9ecef;
        }
        table.table td a {
            display: inline-block;
            margin: 0 5px;
            min-width: 24px;
        }
        table.table td a.edit {
            color: #ffc107;
        }
        table.table td button.delete {
            color: #e34724;
            background: none;
            border: none;
            cursor: pointer;
        }
        .alert {
            margin-top: 15px;
            border-radius: 5px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <h2>Liste des <b>Membres</b></h2>
            <a href="${pageContext.request.contextPath}/membre/create" class="btn add-new"><i class="fa fa-plus"></i> Ajouter un membre</a>
        </div>

        <!-- Affichage du message de succès -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>

        <table class="table table-bordered table-striped">
            <thead>
            <tr>
                <th>ID</th>
                <th>Numéro d'adhésion</th>
                <th>Prénom</th>
                <th>Nom</th>
                <th>Document d'identité</th>
                <th>Nationalité</th>
                <th>Date d'adhésion</th>
                <th>Date d'expiration de la licence</th>
                <th>Date de création</th>
                <th>Actions</th>
            </tr>
            </thead>
            <tbody>
            <c:if test="${empty membres}">
                <tr>
                    <td colspan="10" class="text-center">Aucun membre trouvé</td>
                </tr>
            </c:if>
            <c:forEach var="membre" items="${membres}">
                <tr>
                    <td>${membre.id}</td>
                    <td>${membre.membershipNumber}</td>
                    <td>${membre.firstName}</td>
                    <td>${membre.lastName}</td>
                    <td>${membre.idDocument}</td>
                    <td>${membre.nationality}</td>
                    <td>${membre.membershipDate}</td>
                    <td>${membre.licenseExpiryDate}</td>
                    <td>${membre.created_at}</td>
                    <td>
                        <a class="edit" title="Edit" href="/spring-framework/membre/edit/${membre.id}"><i class="fas fa-edit"></i></a>
                        <form action="/spring-framework/membre/delete/${membre.id}" method="post" style="display:inline;" onsubmit="return confirm('Êtes-vous sûr de vouloir supprimer ce membre ?');">
                            <button type="submit" class="delete" title="Delete"><i class="fas fa-trash-alt"></i></button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
