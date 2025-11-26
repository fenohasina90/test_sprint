package main.java.com.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import main.java.com.annote.Controllera;
import main.java.com.annote.GETY;
import main.java.com.annote.POSTA;
import main.java.com.annote.PathVariable;
import main.java.com.annote.RequestMapping;
import main.java.com.annote.RequestParam;
import main.java.com.framework.ModelyAndView;

@Controllera()
@RequestMapping("/produits")
public class Stock {
    @GETY("/vente")
    public ModelyAndView hello() {
        try {
            
            ModelyAndView mv = new ModelyAndView("views/texte");
            return mv;
        } catch (Exception e) {
            ModelyAndView mv = new ModelyAndView("include/erreur");
            e.printStackTrace();
            return mv;
        }
    }

    @GETY("/vente/{id}")
    public ModelyAndView calc(@PathVariable("id") String id) {
        ModelyAndView mv = new ModelyAndView("views/id");
        mv.addObject("id", id);
        return mv;
    }

    @POSTA("/vente")
    public ModelyAndView soumettre(
            @RequestParam("nom") String nom,
            @RequestParam("prenom") String prenom,
            @RequestParam("age") BigDecimal age // si tu ajoutes un champ age
    ) {
        System.out.println("date avec time : " + age);
        ModelyAndView mv = new ModelyAndView("include/pages");
        mv.addObject("nomComplet", nom + " " + prenom);
        mv.addObject("age", age);
        return mv;
    }

    @POSTA("/save")
    public void save() {}
}
