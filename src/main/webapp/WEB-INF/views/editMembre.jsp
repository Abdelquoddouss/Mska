<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Edit Membre</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <style>
        body {
            background-color: #E9ECEF;
            font-family: 'Open Sans', sans-serif;
            padding: 20px;
        }
        .card {
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .card-header {
            background-color: #007bff;
            color: white;
            border-radius: 10px 10px 0 0;
        }
        .btn-primary {
            background-color: #28a745;
            border: none;
            transition: background-color 0.3s ease;
        }
        .btn-primary:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
<div class="container mt-5">
    <div class="card">
        <div class="card-header">
            <h2 class="mb-0">Edit Membre</h2>
        </div>
        <div class="card-body">
            <form:form method="post" action="${pageContext.request.contextPath}/membre/update" modelAttribute="membre">
                <input type="hidden" name="id" value="${membre.id}" />
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
                <button type="submit" class="btn btn-primary">Update Membre</button>
                <a href="${pageContext.request.contextPath}/membre" class="btn btn-secondary ml-2">Cancel</a>
            </form:form>
        </div>
    </div>
</div>
</body>
</html>
