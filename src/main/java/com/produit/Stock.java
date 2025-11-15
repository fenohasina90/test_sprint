package main.java.com.produit;

import main.java.com.annote.Controllera;
import main.java.com.annote.GETY;
import main.java.com.annote.POSTA;

@Controllera()
public class Stock {
    @GETY("/hello")
    public void hello() {}

    @POSTA("/save")
    public void save() {}
}
