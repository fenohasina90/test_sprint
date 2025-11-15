package main.java.com.vente;

import main.java.com.annote.Controllera;
import main.java.com.annote.GETY;
import main.java.com.annote.POSTA;

@Controllera
public class Daty {
    @GETY("/now")
    public void tsaiko() {}

    @POSTA("/af")
    public void mety() {}
}
