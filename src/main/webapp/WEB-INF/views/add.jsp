<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 22/10/2024
  Time: 15:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
    <title>Add Membre</title>
</head>
<body>
<h2>Add Membre</h2>
<a href="${pageContext.request.contextPath}/test">Test page</a>
<%--@elvariable id="membre" type=""--%>
<form:form action="${pageContext.request.contextPath}/save" modelAttribute="membre" method="post">
    <label for="numeroAdhesion">Numéro d'adhésion:</label>
    <form:input path="numeroAdhesion" /><br/>

    <label for="nom">Nom:</label>
    <form:input path="nom" /><br/>

    <label for="prenom">Prénom:</label>
    <form:input path="prenom" /><br/>

    <label for="pieceIdentification">Pièce d'identification:</label>
    <form:input path="pieceIdentification" /><br/>

    <label for="nationalite">Nationalité:</label>
    <form:input path="nationalite" /><br/>

    <label for="dateAdhesion">Date d'adhésion:</label>
    <form:input path="dateAdhesion" type="date" /><br/>

    <label for="dateExpirationLicence">Date d'expiration de la licence:</label>
    <form:input path="dateExpirationLicence" type="date" /><br/>

    <input type="submit" value="Save" />
</form:form>
</body>
</html>
