<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="vente" method="post">
        <label> nom : </label>
        <input type="text" name="nom">

        <label> prenom : </label>
        <input type="text" name="prenom">

        <label> date naissance : </label>
        <input type="number" name="age">

        <label>Options VIP :</label><br>

        <input type="checkbox" name="vip" value="newsletter"> Newsletter<br>
        <input type="checkbox" name="vip" value="promo"> Promotions<br>
        <input type="checkbox" name="vip" value="event"> Invitations events<br>

        <input type="submit" value="soumettre">
    </form>
</body>
</html>