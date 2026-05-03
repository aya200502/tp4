<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Gestion des Produits MVC1</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 30px;
            background-color: #f5f5f5;
        }
        h2 {
            color: #333;
        }
        form {
            background: #fff;
            padding: 15px 20px;
            border-radius: 6px;
            margin-bottom: 15px;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
            display: inline-block;
            width: 100%;
            box-sizing: border-box;
        }
        input[type="text"] {
            padding: 6px 10px;
            margin: 4px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            padding: 7px 16px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background: #fff;
            box-shadow: 0 1px 4px rgba(0,0,0,0.1);
            border-radius: 6px;
            overflow: hidden;
        }
        th {
            background-color: #4CAF50;
            color: white;
            padding: 10px 14px;
            text-align: left;
        }
        td {
            padding: 9px 14px;
            border-bottom: 1px solid #ddd;
        }
        tr:last-child td {
            border-bottom: none;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .delete-link {
            color: #dc3545;
        }
    </style>
</head>
<body>

<h2>Gestion des Produits (MVC1)</h2>

<!--
    Formulaire Ajouter / Modifier
    - Utilise le même formulaire pour créer ou modifier un produit
    - Si un produit est chargé pour modification (produitEdit != null)
      => action pointe vers UpdateProduitServlet
    - Sinon => action pointe vers AddProduitServlet
-->
<form action="${produitEdit != null ? 'updateProduit' : 'addProduit'}" method="post">
    <!-- Champ caché pour l'ID du produit à modifier -->
    <input type="hidden" name="idProduit" value="${produitEdit.idProduit}" />

    <label>Nom :</label>
    <input type="text" name="nom" value="${produitEdit.nom}" required />

    <label>Description :</label>
    <input type="text" name="description" value="${produitEdit.description}" required />

    <label>Prix :</label>
    <input type="text" name="prix" value="${produitEdit.prix}" required />

    <input type="submit" value="${produitEdit != null ? 'Modifier' : 'Ajouter'}" />
</form>

<hr/>

<!--
    Formulaire Recherche
    - Redirige vers ListProduitServlet
    - Si un ID est fourni, seul ce produit est affiché
    - Sinon, tous les produits sont listés
-->
<form action="listProduits" method="get">
    <label>Rechercher par ID :</label>
    <input type="text" name="idProduit" placeholder="Entrer l'ID du produit" />
    <input type="submit" value="Rechercher" />
</form>

<hr/>

<!--
    Tableau affichant la liste des produits
    - Utilise JSTL c:forEach pour parcourir listeProduits
    - Les actions "Modifier" et "Supprimer" appellent respectivement
      EditProduitServlet et DeleteProduitServlet
-->
<table>
    <tr>
        <th>ID</th>
        <th>Nom</th>
        <th>Description</th>
        <th>Prix (DH)</th>
        <th>Actions</th>
    </tr>
    <c:forEach var="p" items="${listeProduits}">
        <tr>
            <td>${p.idProduit}</td>
            <td>${p.nom}</td>
            <td>${p.description}</td>
            <td>${p.prix}</td>
            <td>
                <!-- Modifier : charge le produit dans le formulaire pour édition -->
                <a href="editProduit?id=${p.idProduit}">Modifier</a> |
                <!-- Supprimer : supprime le produit après confirmation -->
                <a class="delete-link" href="deleteProduit?id=${p.idProduit}"
                   onclick="return confirm('Voulez-vous vraiment supprimer ce produit ?');">Supprimer</a>
            </td>
        </tr>
    </c:forEach>
</table>

</body>
</html>
