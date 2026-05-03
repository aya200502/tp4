package dao;

/**
 * Classe représentant un produit dans l'application.
 * Cette classe sert de modèle pour le CRUD.
 * Chaque instance correspond à un produit unique avec ses propriétés.
 */
public class Produit {

    private Long idProduit;       // Identifiant unique du produit (généralement auto-incrémenté en BDD)
    private String nom;           // Nom du produit
    private String description;   // Description détaillée du produit
    private Double prix;          // Prix du produit

    // Constructeur vide requis par Spring et JSP pour créer des objets dynamiquement
    public Produit() {
    }

    // Constructeur utile pour créer rapidement un produit sans ID (ex: lors de l'ajout)
    public Produit(String nom, String description, Double prix) {
        this.nom = nom;
        this.description = description;
        this.prix = prix;
    }

    // --- Getters et Setters ---
    // Ils permettent à Spring MVC et aux JSP de lier automatiquement les valeurs

    public Long getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(Long idProduit) {
        this.idProduit = idProduit;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Double getPrix() {
        return prix;
    }

    public void setPrix(Double prix) {
        this.prix = prix;
    }
}
