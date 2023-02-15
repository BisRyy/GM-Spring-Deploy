package com.jtspringproject.JtSpringProject.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

public class mapDetail implements mapDetails {
    @Override
    public void mapProductDetail(int uid, ResultSet rs, Product currentProduct) throws SQLException {
        currentProduct.setId(uid);
        currentProduct.setName(rs.getString(2));
        currentProduct.setPrice(rs.getInt(3));
        currentProduct.setMprice(rs.getString(4));
        currentProduct.setCategoryId(rs.getInt(5));
        currentProduct.setQuantity(rs.getInt(6));
        currentProduct.setImage(rs.getString(7));
        currentProduct.setInfo(rs.getString(8));
        currentProduct.setDescription(rs.getString(9));
        currentProduct.setCategory(rs.getString(11));
    }

    public void mapUserDetail(int uid, ResultSet rs, Buyer currentUser) throws SQLException {
        currentUser.setId(uid);
        currentUser.setUsername(rs.getString(2));
        currentUser.setEmail(rs.getString(3));
        currentUser.setFirstName(rs.getString(4));
        currentUser.setLastName(rs.getString(5));
        currentUser.setPassword(rs.getString(6));
        currentUser.setImage(rs.getString(7));
        currentUser.setAddress(rs.getString(8));
        currentUser.setPhone(rs.getString(9));
    }
}
