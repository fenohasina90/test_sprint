<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Client form</title>
</head>
<body>
    <form action="save" method="post">
        <!-- Données du client -->
        <input type="text"   name="nom">
        <input type="text"   name="prenom">
        <input type="number" name="age">

        <h3>TypeClient 0</h3>
        <input type="text" name="typeClient[0].ecole">
        <input type="text" name="typeClient[0].lieu">

        <h3>TypeClient 1</h3>
        <input type="text" name="typeClient[1].ecole">
        <input type="text" name="typeClient[1].lieu">

        <input type="submit" value="Envoyer">
    </form>
</body>
</html>