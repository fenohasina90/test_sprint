package main.java.com.controller;

import main.java.com.annote.Controllera;
import main.java.com.annote.GETY;
import main.java.com.annote.POSTA;
import main.java.com.annote.RequestMapping;
import main.java.com.entity.Client;
import main.java.com.framework.ModelyAndView;

@Controllera()
@RequestMapping("/clients")
public class ClientController {
    @GETY("/form")
    public ModelyAndView showForm() {
        return new ModelyAndView("views/client-form");
    }

    @POSTA("/save")
    public ModelyAndView save(Client client) {
        ModelyAndView mv = new ModelyAndView("views/client-result");
        mv.addObject("client", client);
        mv.addObject("types", client.getTypeClient());
        return mv;
    }
}
