<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <p>Nom complet : ${nomComplet}</p>
    <p>Age : ${age}</p>

    <p>Options VIP choisies :</p>
    <ul>
    <%
        Object raw = request.getAttribute("vipOptions");
        if (raw instanceof String[]) {
            for (String v : (String[]) raw) {
    %>
        <li><%= v %></li>
    <%
            }
        }
    %>
    </ul>
</body>
</html>