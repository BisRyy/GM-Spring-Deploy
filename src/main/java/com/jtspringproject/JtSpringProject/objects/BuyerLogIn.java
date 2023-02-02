package com.jtspringproject.JtSpringProject.objects;

import com.jtspringproject.JtSpringProject.controller.Buyer;

public class BuyerLogIn extends LogIn {
    Buyer buyer;
    public Buyer logIn(){
        getID();
        getPassword();
        if(verifyPassword()){
            buyer = getBuyer();
        }
        return buyer;
    }

    public Buyer getBuyer(){
        return new Buyer();
    }
}