package com.jtspringproject.JtSpringProject.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.sql.*;
import java.util.Objects;

@Controller
public class AdminController {
    public static int adminlogcheck = 0;
    public static String usernameforclass = "";

    public static Buyer currentUser;
    static Product currentProduct = new Product();

    @RequestMapping(value = {"/","/error"})
    public String returnHome() {
        return "home";
    }

    @RequestMapping("/template")
    public String temp() {
        return "template";
    }

    @GetMapping(value = { "/home","/index"})
    public String index(Model model) {
        if (usernameforclass.equalsIgnoreCase("")) return "userLogin";
        else {
            model.addAttribute("username", currentUser.getUsername());
            return "home";
        }
    }

    @GetMapping(value = {"/error"})
    public String error(Model model) {
        if (usernameforclass.equalsIgnoreCase("")) return "userLogin";
        else {
            model.addAttribute("username", currentUser.getUsername());
            return "home";
        }
    }

    @GetMapping("/product")
    public String product(@RequestParam("pid") int pid, Model model)
    {
        try {
            String url = "jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway";
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();
            Statement stmt2 = con.createStatement();

            System.out.println("holla");
//            currentProduct.setId(pid);
            ResultSet rs = stmt.executeQuery("select * from products left  join categories c on c.category_id = products.category_id where id="+pid);
            if (rs.next()){

                mapProductDetail(pid, rs, currentUser);

                model.addAttribute("product", currentProduct);
            }

        } catch (Exception ex) {
            System.out.println("Exception Occurred:: " + ex.getMessage());
        }
        return "product";
    }

    @GetMapping("/addProduct/add")
    public String getAddProduct(Model model) {
        return "addProduct";
    }
    @RequestMapping(value = "sendData", method = RequestMethod.POST)
    public String addproducttodb(@RequestParam("pname") String name,
                                 @RequestParam("categoryid") String catid,
                                 @RequestParam("price") int price,
                                 @RequestParam("mprice") int mprice,
                                 @RequestParam("quantity") int quantity,
                                 @RequestParam("ldesc") String description,
                                 @RequestParam("sdesc") String info,
                                 @RequestParam("productImage") String image) {

        try {
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from categories where name = '" + catid + "';");
            if (rs.next()) {
                int categoryid = rs.getInt(1);
                System.out.println("Hi");
                PreparedStatement pst = con.prepareStatement("insert into products(name,price,mprice,category_id,quantity,image,info,description) values(?,?,?,?,?,?,?,?);");
                pst.setString(1, name);
                pst.setString(6, image);
                pst.setInt(4, categoryid);
                pst.setInt(5, quantity);
                pst.setInt(2, price);
                pst.setInt(3, mprice);
                pst.setString(7, info);
                pst.setString(8, description);
                int i = pst.executeUpdate();
            }
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "redirect:/addProduct";
    }

    @GetMapping(value = {"/idx"})
    public String getIndex(Model model) {
        return "index";
    }

    @GetMapping(value = {"/userloginvalidate", "/login"})
    public String userlog(Model model) {
        return "userLogin";
    }

    @RequestMapping(value = "userloginvalidate", method = RequestMethod.POST)
    public String userlogin(@RequestParam("username") String username,
                            @RequestParam("password") String pass,
                            Model model) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("select * from users where username = '" + username + "' and password = '" + pass + "' ;");
            if (rst.next()) {
                currentUser = new Buyer(rst.getInt(1));
                currentUser.setUsername(rst.getString(2));
                currentUser.setFirstName(rst.getString(2));
                usernameforclass = rst.getString(4);
                currentUser.setLastName(rst.getString(3));
                currentUser.setUsername(rst.getString(4));
                currentUser.setPassword(rst.getString(5));
                currentUser.setImage(rst.getString(8));
                currentUser.setEmail(rst.getString(9));
                currentUser.setPhone(rst.getString(10));
                currentUser.setAddress(rst.getString(11));
                currentUser.setCity(rst.getString(12));
                currentUser.setState(rst.getString(13));
                currentUser.setCountry(rst.getString(14));

                return "redirect:/index";
            } else {
                model.addAttribute("message", "Invalid Username or Password");
                return "userLogin";
            }

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "userLogin";
    }

    @GetMapping("/cart/remove")
    public String removeItem(@RequestParam("cid") int cid, Model model) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");

            PreparedStatement pst = con.prepareStatement("delete from cart where id = ? ;");
            pst.setInt(1, cid);
            int i = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }

        return "redirect:/cart";
    }


    @GetMapping("/cart/add")
    public String addToCart(@RequestParam("pid") int pid,
                            @RequestParam("qty") int qty, Model model) {

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            PreparedStatement pst = con.prepareStatement("INSERT INTO `cart` (`userId`, `productId`, `quantity`) VALUES (?, ?, ?)");

            pst.setInt(1, currentUser.getId());
            pst.setInt(2, pid);
            pst.setInt(3, qty);
            int i = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }

        return "redirect:/cart";
    }


    //    =========== A D M I N =================


    @GetMapping({"/admin","/adminhome"})
    public String adminlogin(Model model) {
        if(adminlogcheck == 1)
            return "adminHome";
        else
            return "redirect:/loginvalidate";
    }

    @GetMapping("/loginvalidate")
    public String adminlog(Model model) {
        return "adminlogin";
    }

    @RequestMapping(value = "loginvalidate", method = RequestMethod.POST)
    public String adminlogin(@RequestParam("username") String username, @RequestParam("password") String pass, Model model) {

        if (username.equalsIgnoreCase("admin") && pass.equalsIgnoreCase("123")) {
            adminlogcheck = 1;
            return "redirect:/adminhome";
        } else {
            model.addAttribute("message", "Invalid Username or Password");
            return "adminlogin";
        }
    }

    @GetMapping("/addCategory")
    public String addCategory() {
        return "addCategory";
    }

    @RequestMapping(value = "addCat", method = RequestMethod.POST)
    public String addCat(@RequestParam("cat_name") String catName){

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();

            PreparedStatement pst = con.prepareStatement("insert into categories(name) values(?);");
            pst.setString(1, catName);
            int i = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }

        return "redirect:/addCategory";
    }

    @RequestMapping(value = "addStk", method = RequestMethod.POST)
    public String addStk(@RequestParam("pqty") int quantity, @RequestParam("pname") int pid){

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();
            ResultSet rst = stmt.executeQuery("select * from products where id ="+ pid);
            PreparedStatement pst = con.prepareStatement("update products set quantity = ? where id="+ pid);
            rst.next();
            quantity += rst.getInt(6);
            pst.setInt(1, quantity);
            int i = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }

        return "redirect:/addStock";
    }


    //    ============================
    @RequestMapping(value = {"/logout"})
    public String returnIndex(Model model) {
        adminlogcheck = 0;
        usernameforclass = "";
        currentUser = new Buyer();
        model.addAttribute("message", "Logged out Successfully");
        return "userLogin";
    }

    @RequestMapping(value = {"/ulogout"})
    public String returnIndexUpdate(Model model,
                                    @RequestParam("s") String s) {
        adminlogcheck = 0;
        usernameforclass = "";
        currentUser = new Buyer();
        model.addAttribute("message", s);
        return "userLogin";
    }

    @GetMapping("/template")
    public String getTemplate(Model model) {
        return "template";
    }

    @GetMapping("/admin/categories")
    public String getcategory() {
        return "categories";
    }
    @GetMapping("/addProduct")
    public String addProduct() {
        return "addProduct";
    }
    @GetMapping("/addStock")
    public String addStock() {
        return "addStock";
    }
    @GetMapping("/users")
    public String getUsers() {
        return "users";
    }
    @GetMapping("/orders")
    public String getOrders() {
        return "orders";
    }

    @RequestMapping(value = "admin/sendcategory", method = RequestMethod.GET)
    public String addcategorytodb( @RequestParam("categoryname") String catname) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();

            PreparedStatement pst = con.prepareStatement("insert into categories(name) values(?);");
            pst.setString(1, catname);
            int i = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/categories/delete")
    public String removeCategoryDb(@RequestParam("id") int id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();

            PreparedStatement pst = con.prepareStatement("delete from categories where categoryid = ? ;");
            pst.setInt(1, id);
            int i = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/categories/update")
    public String updateCategoryDb(@RequestParam("categoryid") int id, @RequestParam("categoryname") String categoryname) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();

            PreparedStatement pst = con.prepareStatement("update categories set name = ? where categoryid = ?");
            pst.setString(1, categoryname);
            pst.setInt(2, id);
            int i = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "redirect:/admin/categories";
    }

    @GetMapping("/admin/products")
    public String getproduct(Model model) {
        return "products";
    }

    @GetMapping("/admin/products/add")
    public String addproduct(Model model) {
        return "productsAdd";
    }
    @GetMapping("/admin/products/update")
    public String updateproduct(@RequestParam("pid") int id, Model model) {
        String pname, pdescription, pimage;
        int pid, pprice, pweight, pquantity, pcategory;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();
            Statement stmt2 = con.createStatement();
            ResultSet rst = stmt.executeQuery("select * from products where id = " + id + ";");

            if (rst.next()) {
                pid = rst.getInt(1);
                pname = rst.getString(2);
                pimage = rst.getString(3);
                pcategory = rst.getInt(4);
                pquantity = rst.getInt(5);
                pprice = rst.getInt(6);
                pweight = rst.getInt(7);
                pdescription = rst.getString(8);
                model.addAttribute("pid", pid);
                model.addAttribute("pname", pname);
                model.addAttribute("pimage", pimage);
                ResultSet rst2 = stmt.executeQuery("select * from categories where categoryid = " + pcategory + ";");
                if (rst2.next()) {
                    model.addAttribute("pcategory", rst2.getString(2));
                }
                model.addAttribute("pquantity", pquantity);
                model.addAttribute("pprice", pprice);
                model.addAttribute("pweight", pweight);
                model.addAttribute("pdescription", pdescription);
            }
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "productsUpdate";
    }

    @RequestMapping(value = "admin/products/updateData", method = RequestMethod.POST)
    public String updateproducttodb(@RequestParam("id") int id, @RequestParam("name") String name, @RequestParam("price") int price, @RequestParam("weight") int weight, @RequestParam("quantity") int quantity, @RequestParam("description") String description, @RequestParam("productImage") String picture) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");

            PreparedStatement pst = con.prepareStatement("update products set name= ?,image = ?,quantity = ?, price = ?, weight = ?,description = ? where id = ?;");
            pst.setString(1, name);
            pst.setString(2, picture);
            pst.setInt(3, quantity);
            pst.setInt(4, price);
            pst.setInt(5, weight);
            pst.setString(6, description);
            pst.setInt(7, id);
            int i = pst.executeUpdate();
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "redirect:/admin/products";
    }

    @GetMapping("/admin/products/delete")
    public String removeProductDb(@RequestParam("id") int id) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");


            PreparedStatement pst = con.prepareStatement("delete from products where id = ? ;");
            pst.setInt(1, id);
            int i = pst.executeUpdate();

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "redirect:/admin/products";
    }

    @PostMapping("/admin/products")
    public String postproduct() {
        return "redirect:/admin/categories";
    }


    @GetMapping("/admin/customers")
    public String getCustomerDetail() {
        return "displayCustomers";
    }

    @GetMapping("profileDisplay")
    public String profileDisplay(Model model) {
//        String displayusername, displaypassword, displayemail, displayaddress;
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
//            Statement stmt = con.createStatement();
//            ResultSet rst = stmt.executeQuery("select * from users where username = '" + usernameforclass + "';");
//
//            if (rst.next()) {
//                int userid = rst.getInt(1);
//                displayusername = rst.getString(2);
//                displayemail = rst.getString(3);
//                displaypassword = rst.getString(4);
//                displayaddress = rst.getString(5);
//                model.addAttribute("userid", userid);
//                model.addAttribute("username", displayusername);
//                model.addAttribute("email", displayemail);
//                model.addAttribute("password", displaypassword);
//                model.addAttribute("address", displayaddress);
//            }
//        } catch (Exception e) {
//            System.out.println("Exception:" + e);
//        }
        model.addAttribute("user", currentUser);
        System.out.println("Hello");
        return "updateProfile";
    }

    @RequestMapping(value = "updateuser", method = RequestMethod.POST)
    public String updateUserProfile(
            @RequestParam("username") String username,
            @RequestParam("fname") String f_name,
            @RequestParam("lname") String l_name,
            @RequestParam("email") String email,
            @RequestParam("image") String image,
            @RequestParam("phone") String phone,
            @RequestParam("address") String address) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");

            PreparedStatement pst = con.prepareStatement("update users set username= ?,email = ?,f_name= ?,l_name=?, image=?, address= ? , phone=? where user_id = ?;");
            pst.setString(1, username);
            pst.setString(2, email);
            pst.setString(3, f_name);
            pst.setString(4, l_name);
            pst.setString(5, image);
            pst.setString(6, address);
            pst.setString(7, phone);
            pst.setInt(8, currentUser.getId());

            int i = pst.executeUpdate();
            usernameforclass = username;

            return "redirect:/ulogout?s=Updated. Please Log in to confirm.";
        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "redirect:/ulogout?s=Unable to update.";
    }

    @RequestMapping(value = "changepass", method = RequestMethod.POST)
    public String updateUserProfile(
            @RequestParam("old_password") String oPass,
            @RequestParam("new_password") String nPass,
            @RequestParam("confirm_password") String cPass) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway", "root","LK0nTR9wwyRwBq6qflc0");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery("select * from users where user_id ="+currentUser.getId());
            rs.next();
            if (Objects.equals(nPass, cPass) && Objects.equals(oPass, rs.getString(5))){
                PreparedStatement pst = con.prepareStatement("update users set password= ? where user_id = ?;");
                pst.setString(1, nPass);
                pst.setInt(2, currentUser.getId());
                int i = pst.executeUpdate();

                return "redirect:/ulogout?s=Password Changed. Please Log in.";
            }

        } catch (Exception e) {
            System.out.println("Exception:" + e);
        }
        return "redirect:/ulogout?s=Incorrect Password.";
    }
    public static void mapProductDetail(int uid, ResultSet rs, Person currentUser) throws SQLException {
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

}
