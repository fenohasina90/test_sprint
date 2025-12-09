package main.java.com.entity;

import java.util.List;

public class Client {
    private String nom;
    private String prenom;
    private Integer age;
    private List<TypeClient> typeClient;

    public List<TypeClient> getTypeClient() {
        return typeClient;
    }
    public void setTypeClient(List<TypeClient> typeClient) {
        this.typeClient = typeClient;
    }
    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public String getPrenom() { return prenom; }
    public void setPrenom(String prenom) { this.prenom = prenom; }

    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }
}
