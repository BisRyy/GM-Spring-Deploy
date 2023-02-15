package com.jtspringproject.JtSpringProject.mail;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.MalformedURLException;
import java.net.URL;

import org.json.JSONObject;
import org.springframework.stereotype.Controller;


import javax.servlet.http.HttpServletRequest;
@Controller
public class GetIPDetails {


    public IPInfo generateMail(JSONObject jsonObject) throws MalformedURLException {

        IPInfo ipInfo = new IPInfo();
        ipInfo.setIp(jsonObject.get("ip").toString());
        ipInfo.setCity(jsonObject.get("city").toString());
        ipInfo.setRegion(jsonObject.get("region").toString());
        ipInfo.setCountry(jsonObject.get("country").toString());



        System.out.println(ipInfo.ip);
        System.out.println(ipInfo.country);
        System.out.println(jsonObject.get("city"));
        System.out.println(jsonObject.get("latitude"));
        System.out.println(jsonObject.get("longitude"));
        System.out.println(jsonObject.get("country_code"));
        System.out.println(jsonObject.get("region"));
        System.out.println(jsonObject.get("region_code"));
        System.out.println(jsonObject.get("calling_code"));
        System.out.println(jsonObject.get("capital"));

//        System.out.println(jsonObject.get("flag"));
//        System.out.println(jsonObject.get("emoji"));
//        System.out.println(jsonObject.get("timezone"));
//        System.out.println(jsonObject.get("current_time"));
//        System.out.println(jsonObject.get("utc"));
//        System.out.println(jsonObject.get("offset"));
//        System.out.println(jsonObject.get("currency"));

        return ipInfo;
    }
    public JSONObject getIpInfo() throws MalformedURLException {
        String ip = "";
        String urlString = "https://ipv4.icanhazip.com/";
        URL url1 = new URL(urlString);
        try{
            BufferedReader br = new BufferedReader(new InputStreamReader(url1.openStream()));
            ip = br.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        ip = ip.trim();
        URL url;

        try {

            url = new URL("http://ipwho.is/" + ip);

            BufferedReader br = new BufferedReader(new InputStreamReader(url.openStream()));
            String json = br.readLine();

            JSONObject jsonObject = new JSONObject(json);

            return jsonObject;


        }catch (Exception ignored) {

        }

        return null;
    }


    private static String getClientIp(HttpServletRequest request) {

        String remoteAddr = "";

        if (request != null) {
            remoteAddr = request.getHeader("X-FORWARDED-FOR");
            if (remoteAddr == null || "".equals(remoteAddr)) {
                remoteAddr = request.getRemoteAddr();
            }
        }
        return remoteAddr;
    }

    public static void main(String[] args) throws MalformedURLException {
        GetIPDetails getIPDetails = new GetIPDetails();
        JSONObject json = getIPDetails.getIpInfo();
        IPInfo info = getIPDetails.generateMail(json);
        SendMail mail = new SendMail();
        mail.sendMail("grainmill@bisrat.tech", "Hi", "Sent From GM");

    }

}