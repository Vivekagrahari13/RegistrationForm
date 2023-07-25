package com.user;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
@MultipartConfig
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Register() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html; charset=ISO-8859-1");
		try (PrintWriter out = response.getWriter()) {

			// Getting all details from form while request

			String name = request.getParameter("user_name");
			String password = request.getParameter("user_password");
			String email = request.getParameter("user_email");
			Part part = request.getPart("image");
			String filename = part.getSubmittedFileName();
			out.println(filename);

			// Creating connection with database
			try {
				Thread.sleep(1200);
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/register", "root",
						"Agrahari$@13");
				PreparedStatement p = con
						.prepareStatement("insert into user (name, password, email,imageName) values (?, ?, ?,?)");

				p.setString(1, name);
				p.setString(2, password);
				p.setString(3, email);
				p.setString(4, filename);

				p.executeUpdate();
				InputStream is = part.getInputStream();
				byte[] data = new byte[is.available()];
				is.read(data);

				String path = request.getRealPath("/") + "images" + "/" + File.separator + filename;
				out.println(path);
				FileOutputStream fos = new FileOutputStream(path);
				fos.write(data);
				fos.close();
				
				
				out.print("success");

			} catch (Exception e) {
				e.printStackTrace();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
