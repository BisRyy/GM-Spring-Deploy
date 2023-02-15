package com.jtspringproject.JtSpringProject.mail;

public class IPInfo {
    String ip;
    String latitude;
    String longitude;
    String country;
    String city;
    String region;
    String current_time;

    public void setIp(String ip) {
        this.ip = ip;
    }

    public void setLatitude(String latitude) {
        this.latitude = latitude;
    }

    public void setLongitude(String longitude) {
        this.longitude = longitude;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public void setCurrent_time(String current_time) {
        this.current_time = current_time;
    }

    public String getIp() {
        return ip;
    }

    public String getLatitude() {
        return latitude;
    }

    public String getLongitude() {
        return longitude;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getRegion() {
        return region;
    }

    public String getCurrent_time() {
        return current_time;
    }
}
