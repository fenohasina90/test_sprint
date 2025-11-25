package main.java.com.controller;

// import main.java.com.annotation.Controllera;
// import main.java.com.annotation.GETY;

@main.java.com.annote.Controllera
public class Produit {
    @main.java.com.annote.GETY("/up")
    public Integer calc() {
        System.out.println("result : 10");
        return 4 + 6;
    }
}
