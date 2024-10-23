<%--
  Created by IntelliJ IDEA.
  User: Youcode
  Date: 22/10/2024
  Time: 16:35
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Create Membre</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Create Membre</h2>
    <form:form method="post" action="${pageContext.request.contextPath}/membre/save" modelAttribute="membre">
        <div class="form-group">
            <label for="membershipNumber">Membership Number:</label>
            <form:input path="membershipNumber" class="form-control" id="membershipNumber" />
        </div>
        <div class="form-group">
            <label for="firstName">First Name:</label>
            <form:input path="firstName" class="form-control" id="firstName" />
        </div>
        <div class="form-group">
            <label for="lastName">Last Name:</label>
            <form:input path="lastName" class="form-control" id="lastName" />
        </div>
        <div class="form-group">
            <label for="idDocument">ID Document:</label>
            <form:input path="idDocument" class="form-control" id="idDocument" />
        </div>
        <div class="form-group">
            <label for="nationality">Nationality:</label>
            <form:input path="nationality" class="form-control" id="nationality" />
        </div>
        <div class="form-group">
            <label for="membershipDate">Membership Date:</label>
            <form:input path="membershipDate" type="date" class="form-control" id="membershipDate" />
        </div>
        <div class="form-group">
            <label for="licenseExpiryDate">License Expiry Date:</label>
            <form:input path="licenseExpiryDate" type="date" class="form-control" id="licenseExpiryDate" />
        </div>
        <button type="submit" class="btn btn-primary">Create Membre</button>
    </form:form>
</div>
</body>
</html>
