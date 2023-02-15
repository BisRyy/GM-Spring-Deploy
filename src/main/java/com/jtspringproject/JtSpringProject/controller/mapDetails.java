package com.jtspringproject.JtSpringProject.controller;

import java.sql.ResultSet;
import java.sql.SQLException;

public interface mapDetails {
    void mapProductDetail(int uid, ResultSet rs, Product currentProduct)throws SQLException;

    void mapUserDetail(int uid, ResultSet rs, Buyer currentUser)throws SQLException;

}
