package com.app.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.app.entity.Employee;
import com.app.service.EmployeeService;
import com.app.service.impl.EmployeeServiceImpl;

@WebServlet("/edit")

public class EditController extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		
		EmployeeService employeeService=new EmployeeServiceImpl();
		Integer id=Integer.parseInt(request.getParameter("id"));
        
        request.setAttribute("employee",employeeService.findById(id));
		request.setAttribute("employees", employeeService.findAll());
		request.getRequestDispatcher("welcome.jsp").forward(request, response);
		
	}
}
