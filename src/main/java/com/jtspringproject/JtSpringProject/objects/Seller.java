package com.jtspringproject.JtSpringProject.objects;

import com.jtspringproject.JtSpringProject.controller.Person;

import java.util.List;

class Seller extends Person {
    private List<Grain> grains;

    public Seller() {
    }

    public List<Grain> getGrainListings() {
        return this.grains;
    }

    public void addGrainListing(Grain grain) {
        this.grains.add(grain);
    }

    public void removeGrainListing(Grain grain) {
        this.grains.remove(grain);
    }
}