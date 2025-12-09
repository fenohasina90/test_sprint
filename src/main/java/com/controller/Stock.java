package main.java.com.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
    public ModelyAndView soumettre(Map<String, Object> form) {
        String nom = (String) form.get("nom");
        String prenom = (String) form.get("prenom");
        String ageStr = (String) form.get("age");

        Object vipRaw = form.get("vip"); // peut être String ou String[]

        String[] vipValues;
        if (vipRaw instanceof String) {
            vipValues = new String[]{(String) vipRaw};
        } else if (vipRaw instanceof String[]) {
            vipValues = (String[]) vipRaw;
        } else {
            vipValues = new String[0]; // rien coché
        }

        ModelyAndView mv = new ModelyAndView("include/pages");
        mv.addObject("nomComplet", nom + " " + prenom);
        mv.addObject("age", ageStr);
        mv.addObject("vipOptions", vipValues);
        return mv;
    }

    // @POSTA("/vente")
    // public ModelyAndView soumettre(
    //         @RequestParam("nom") String nom,
    //         @RequestParam("prenom") String prenom,
    //         @RequestParam("age") BigDecimal age // si tu ajoutes un champ age
    // ) {
    //     System.out.println("date avec time : " + age);
    //     ModelyAndView mv = new ModelyAndView("include/pages");
    //     mv.addObject("nomComplet", nom + " " + prenom);
    //     mv.addObject("age", age);
    //     return mv;
    // }



    @POSTA("/save")
    public void save() {}
}
