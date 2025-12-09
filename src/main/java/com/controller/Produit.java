package main.java.com.controller;

import main.java.com.annote.Controllera;
import main.java.com.annote.GETY;
import main.java.com.annote.POSTA;
import main.java.com.annote.RequestMapping;
import main.java.com.annote.RequestParam;
import main.java.com.framework.ModelyAndView;

// import main.java.com.annotation.Controllera;
// import main.java.com.annotation.GETY;

@Controllera()
@RequestMapping("/table")
public class Produit {
    @POSTA("/affiche")
    public ModelyAndView calc(@RequestParam("nom") String nom) {
        ModelyAndView mv = new ModelyAndView("views/table-form");
        mv.addObject("nom", nom);
        return mv;
    }

    @GETY("/affiche")
    public ModelyAndView hello() {
        return new ModelyAndView("views/table");
    }
}
