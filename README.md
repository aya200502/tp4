# GestionDesProduitsMVC1

Application CRUD – Gestion des Produits en architecture **MVC1 + 3-Tiers**  
Technologies : **Servlet, JSP, JSTL, Maven, Apache Tomcat**

---

## Structure du projet

```
GestionDesProduitsMVC1/
├── pom.xml
└── src/
    └── main/
        ├── java/
        │   ├── dao/
        │   │   ├── Produit.java          ← Modèle (entité)
        │   │   ├── ProduitDAO.java       ← Interface DAO
        │   │   └── ProduitImpl.java      ← Implémentation DAO (en mémoire)
        │   ├── services/
        │   │   ├── ProduitMetier.java    ← Interface Service
        │   │   └── ProduitMetierImpl.java← Implémentation Service (Singleton)
        │   └── web/
        │       ├── ListProduitServlet.java
        │       ├── AddProduitServlet.java
        │       ├── DeleteProduitServlet.java
        │       ├── EditProduitServlet.java
        │       └── UpdateProduitServlet.java
        └── webapp/
            ├── index.jsp                 ← Vue principale (JSTL)
            └── WEB-INF/
                └── web.xml              ← Descripteur de déploiement
```

## Fonctionnalités

- **Lister** tous les produits
- **Rechercher** un produit par ID
- **Ajouter** un nouveau produit
- **Modifier** un produit existant (formulaire pré-rempli)
- **Supprimer** un produit (avec confirmation)

## Prérequis

- Java 11+
- Maven 3.x
- Apache Tomcat 9.x

## Installation & Démarrage

### 1. Cloner / Extraire le projet

```bash
cd GestionDesProduitsMVC1
```

### 2. Compiler avec Maven

```bash
mvn clean package
```

Le fichier WAR sera généré dans `target/GestionDesProduitsMVC1-1.0-SNAPSHOT.war`

### 3. Déployer sur Tomcat

Copier le fichier WAR dans le dossier `webapps/` de Tomcat :

```bash
cp target/GestionDesProduitsMVC1-1.0-SNAPSHOT.war $TOMCAT_HOME/webapps/
```

### 4. Accéder à l'application

```
http://localhost:8080/GestionDesProduitsMVC1-1.0-SNAPSHOT/listProduits
```

## Architecture MVC1

```
[Navigateur] → Servlet (Controller) → Service (Métier) → DAO → [Mémoire]
                     ↓
                  JSP (View)
```

Chaque opération CRUD est gérée par une Servlet dédiée :

| URL             | Servlet               | Méthode |
|-----------------|-----------------------|---------|
| /listProduits   | ListProduitServlet    | GET     |
| /addProduit     | AddProduitServlet     | POST    |
| /deleteProduit  | DeleteProduitServlet  | GET     |
| /editProduit    | EditProduitServlet    | GET     |
| /updateProduit  | UpdateProduitServlet  | POST    |

---

Projet réalisé par **Mohamed CHERRADI** – ENSA Hoceima, UAE
"# tp4" 
