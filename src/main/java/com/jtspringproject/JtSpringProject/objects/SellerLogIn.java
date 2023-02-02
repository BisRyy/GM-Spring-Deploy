package com.jtspringproject.JtSpringProject.objects;

public class SellerLogIn extends LogIn {
    Seller seller;

    public Seller logIn() {
        getID();
        getPassword();
        if (verifyPassword()) {
            seller = getSeller();
        }
        return seller;
    }

    public Seller getSeller() {
        return new Seller();

    }
}