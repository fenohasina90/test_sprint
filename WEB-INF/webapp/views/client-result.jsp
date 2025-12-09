<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Client result</title>
</head>
<body>
    <p>Nom : ${client.nom}</p>
    <p>Prénom : ${client.prenom}</p>
    <p>Age : ${client.age}</p>

    <h3>Types de client :</h3>
    <ul>
    <%
        Object rawTypes = request.getAttribute("types");
        if (rawTypes instanceof java.util.List<?>) {
            for (Object o : (java.util.List<?>) rawTypes) {
                if (o instanceof main.java.com.entity.TypeClient) {
                    main.java.com.entity.TypeClient tc = (main.java.com.entity.TypeClient) o;
    %>
        <li>École = <%= tc.getEcole() %>, Lieu = <%= tc.getLieu() %></li>
    <%
                }
            }
        }
    %>
    </ul>
</body>
</html>