package com.jtspringproject.JtSpringProject.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import com.jtspringproject.JtSpringProject.mail.GetIPDetails;
import com.jtspringproject.JtSpringProject.mail.IPInfo;
import com.jtspringproject.JtSpringProject.mail.SendMail;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;

import static com.jtspringproject.JtSpringProject.controller.AdminController.currentUser;

@Controller
public class UserController {
//	Buyer currentUser = new Buyer();

	private final String DBConnection = "jdbc:mysql://localhost:3306/grainmill"; // "jdbc:mysql://root:LK0nTR9wwyRwBq6qflc0@containers-us-west-122.railway.app:6285/railway";
	private final String DBPass = "password"; // LK0nTR9wwyRwBq6qflc0;
	private final String DBUser = "bisry"; // "root";

	@RequestMapping(value = "newuserregister", method = RequestMethod.POST)
	public String newUseRegister(@RequestParam("username") String username,
								 @RequestParam("f_name") String f_name,
								 @RequestParam("l_name") String l_name,
								 @RequestParam("password") String password,
								 @RequestParam("email") String email) {
		try {
			Connection con = DriverManager.getConnection(DBConnection, DBUser,DBPass);
			PreparedStatement pst = con.prepareStatement("insert into users(username, f_name, l_name ,password,email) values(?,?,?,?,?);");
			pst.setString(1, username);
			pst.setString(2, f_name);
			pst.setString(3, l_name);
			pst.setString(4, password);
			pst.setString(5, email);

			currentUser = new Buyer();
			currentUser.setUsername(username);
			currentUser.setFirstName(f_name);
			currentUser.setLastName(l_name);
			currentUser.setPassword(password);
			currentUser.setEmail(email);

			int i = pst.executeUpdate();
			System.out.println("data base updated" + i);

			try {
				GetIPDetails getIPDetails = new GetIPDetails();
				JSONObject json = getIPDetails.getIpInfo();
				IPInfo info = getIPDetails.generateMail(json);
				SendMail mail = new SendMail();
				mail.sendMail(currentUser.getEmail(), "Registration Successful.", "Dear " + currentUser.getFirstName() + "\nWelcome To Grain Mill Market and Delivery.");
			}catch (Exception e){
				System.out.println("Email Sending Failed");
			}
		} catch (Exception e) {
			String str1 = e.toString();
			String check = "Access denied";
			if (str1.contains(check)) {
				return "redirect:/";
			}
			System.out.println(str1);
			System.out.println("Exception:" + e);
		}
		return "redirect:/index";
	}


	@GetMapping("/landing")
	public String landing() {
		return "landing";
	}

	@GetMapping("/register")
	public String registerUser() {
		return "register";
	}

	@GetMapping("/shop")
	public String getShop() {
		if (AdminController.usernameforclass.equalsIgnoreCase("")) return "userLogin";
		else {
			return "shop";
		}
	}

	@GetMapping("/search")
	public String search(Model model, @RequestParam("val") String value) {
		if (AdminController.usernameforclass.equalsIgnoreCase("")) return "userLogin";
		else {
			model.addAttribute("value", value);
			return "search";
		}
	}

	@GetMapping("/about")
	public String getAbout() {
		return "about";
	}

	@GetMapping("/contact")
	public String contact() {
		return "contact";
	}

	@GetMapping("/account")
	public String account(Model model) {
		if (AdminController.usernameforclass.equalsIgnoreCase("")) return "userLogin";
		else {
			model.addAttribute("user", currentUser);
			return "updateProfile";
		}
	}

	@GetMapping("/changepassword")
	public String changePassword(Model model) {
		if (AdminController.usernameforclass.equalsIgnoreCase("")) return "userLogin";
		else {

			model.addAttribute("user", currentUser);
			return "changePassword";
		}
	}

	@GetMapping("/refund")
	public String refund() {
		return "refund";
	}

	@GetMapping("/terms")
	public String terms() {
		return "terms";
	}

	@GetMapping("/cart")
	public String cart(Model model) {
		if (AdminController.usernameforclass.equalsIgnoreCase("")) return "userLogin";
		else {
			model.addAttribute("userid", currentUser.getId());
			return "cart";
		}
	}

	@GetMapping("/buy")
	public String buy() {
		return "buy";
	}

	@GetMapping("/myOrders")
	public String orders(Model model) {
		if (AdminController.usernameforclass.equalsIgnoreCase("")) return "userLogin";
		else {
			model.addAttribute("user", currentUser);
			return "myOrders";
		}
	}

	@GetMapping("/products")
	public String products() {
		return "uproduct";
	}

	@GetMapping("/checkout")
	public String getCheckout(Model model,
							  @RequestParam("items") String item,
							  @RequestParam("total") String total,
							  @RequestParam("mtotal") String mtotal

		) {
		if (AdminController.usernameforclass.equalsIgnoreCase("")) return "userLogin";
		else {
			model.addAttribute("items", item);
			model.addAttribute("total", total);
			model.addAttribute("mtotal", mtotal);

			return "checkout";
		}
	}


	@RequestMapping(value = "check", method = RequestMethod.POST)
	public String checkOut(
			@RequestParam("items") int items,
			@RequestParam("price") float price,
			@RequestParam("pmode") int pmode

	){

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(DBConnection, DBUser,DBPass);
			PreparedStatement pst = con.prepareStatement("INSERT INTO `order` (`userId`, `items`, `price`, `pmode`,`status`) VALUES (?, ?, ?,?,?)");
			PreparedStatement pst1 = con.prepareStatement("DELETE FROM `cart` where userId=?");
			pst1.setInt(1, currentUser.getId());

			pst.setInt(1, currentUser.getId());
			pst.setInt(2, items);
			pst.setInt(3, (int) price);
			pst.setInt(4, pmode);
			pst.setInt(5, 0);
			int i = pst.executeUpdate();
			int j = pst1.executeUpdate();

			try {
				GetIPDetails getIPDetails = new GetIPDetails();
				JSONObject json = getIPDetails.getIpInfo();
				IPInfo info = getIPDetails.generateMail(json);
				SendMail mail = new SendMail();
				mail.sendMail(currentUser.getEmail(), "New Order from " + info.getCity() + " " +
						info.getRegion() + " " + info.getCountry(), "Dear " + currentUser.getFirstName() +
						"\nA new Order has Successfully been Added to your Account. \n" + items +
						" products \n Total Cost: " + price + "\n\n\n Your Order Will be delivered in two days. \n\n Happy to serve you.");

			}catch (Exception x){
				System.out.println("Unable to send Email");
			}

		} catch (Exception e) {
			System.out.println("Exception:" + e);
		}

		return "redirect:/myOrders";
	}
	@GetMapping("/user/products")
	public String getproduct(Model model) {
		return "uproduct";
	}
}