package main.java.com.test_sprint;

import java.lang.reflect.Method;

import main.java.com.annotation.Andrana;
import main.java.com.annotation.AnnotationProcessor;

public class Main {
    // Classe de test avec l'annotation
    
    // @Andrana("https://api.monsite.com/users")
    // public void getUsers() {
    //     System.out.println("Récupération des utilisateurs...");
    // }
    
    
    
    @Andrana(url="https://api.monsite.com/products")
    public void getProducts() {
        System.out.println("Récupération des produits...");
    }
    
    @Andrana(url="https://api.monsite.com/orders")
    public void getOrders() {
        System.out.println("Récupération des commandes...");
    }
    
    // Méthode sans annotation
    public void methodSansAnnotation() {
        System.out.println("Méthode sans annotation");
    }



    public static void main(String[] args) {
        Main app = new Main();
        
        // Différentes façons d'utiliser :
        
        // 1. Exécution complète (par défaut)
        AnnotationProcessor.processAnnotations(app);
        
        // 2. Sans exécuter les méthodes
        // AnnotationProcessor.processAnnotations(app, false);
        
        // 3. Directement avec la classe
        AnnotationProcessor.processAnnotations(Main.class);
        
        // 4. Juste lister les URLs
        // AnnotationProcessor.listAllUrls(Main.class);
    }
}
