package main.java.com.controller;

import java.util.ArrayList;
import java.util.List;

import main.java.com.annote.Controllera;
import main.java.com.annote.GETY;
import main.java.com.annote.POSTA;
import main.java.com.framework.ModelyAndView;

@Controllera()
public class Stock {
    @GETY("/hello")
    public ModelyAndView hello() {
        try {
            
            ModelyAndView mv = new ModelyAndView("views/texte");
        List<String> test = new ArrayList<>();
        test.add("Feno");
        test.add("Hasina");
        mv.addObject("messages", test);
        mv.addObject("message", "andrana");
            return mv;
        } catch (Exception e) {
            ModelyAndView mv = new ModelyAndView("include/erreur");
            e.printStackTrace();
            return mv;
        }
    }

    @POSTA("/save")
    public void save() {}
}
