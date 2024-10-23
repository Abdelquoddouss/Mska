<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 22/10/2024
  Time: 16:47
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Liste des membres</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <style>
        body {
            color: #404E67;
            background: #F5F7FA;
            font-family: 'Open Sans', sans-serif;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            padding: 0 15px;
            margin: 0 auto;
        }
        .table-wrapper {
            width: 100%;
            margin: 20px 0;
            background: #fff;
            padding: 20px;
            box-shadow: 0 1px 1px rgba(0,0,0,.05);
            border-radius: 8px;
        }
        .table-title {
            padding: 15px;
            margin-bottom: 10px;
            background: #435d7d;
            color: #fff;
            border-radius: 8px 8px 0 0;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .table-title h2 {
            font-size: 24px;
            margin: 0;
        }
        .add-new {
            height: 35px;
            font-weight: bold;
            font-size: 14px;
            background: #28a745;
            color: white;
            border-radius: 50px;
            padding: 0 20px;
            border: none;
        }
        table.table {
            table-layout: fixed;
            width: 100%;
            background-color: white;
        }
        table.table th, table.table td {
            border-color: #e9e9e9;
            padding: 15px;
            text-align: left;
            vertical-align: middle;
            word-wrap: break-word;
        }
        table.table td a {
            display: inline-block;
            margin: 0 5px;
            min-width: 24px;
        }
        table.table td a.edit {
            color: #FFC107;
        }
        table.table td button.delete {
            color: #E34724;
            background: none;
            border: none;
            cursor: pointer;
        }
        table.table td .add {
            display: none;
        }
        .alert {
            margin-top: 15px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="table-wrapper">
        <div class="table-title">
            <h2>Liste des <b>membres</b></h2>
            <a href="${pageContext.request.contextPath}/membre/create" class="btn add-new"><i class="fa fa-plus"></i> Ajouter un membre</a>
        </div>

        <!-- Display success message -->
        <c:if test="${not empty message}">
            <div class="alert alert-success">${message}</div>
        </c:if>

        <table class="table table-bordered">
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
                    <td colspan="10" style="text-align: center;">Aucun membre trouvé</td>
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
                        <form action="/spring-framework/membre/delete/${membre.id}" method="post" style="display:inline;" onsubmit="return confirm('Are you sure you want to delete this member?');">
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
