<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <h1>Ito efamety ilay texte.jsp</h1>
    <h1>Efa mety rah mipotra eo</h1>

    <h2>Message depuis le contrôleur :</h2>
    <p>${message}</p>
    <ul>
    <%
        Object raw = request.getAttribute("messages");
        if (raw instanceof java.util.List<?>) {
            java.util.List<?> list = (java.util.List<?>) raw;
            for (Object m : list) {
    %>
        <li><%= m %></li>
    <%
            }
        }
    %>
    </ul>
    <form action="/soumettre" method="post">
        <input type="text" name="nom">
        <input type="text" name="prenom">
        <input type="submit" value="soumettre">
    </form>
</body>
</html>