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

@WebServlet("/delete")
public class DeleteController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	EmployeeService employeeService=null;
	
	public DeleteController(){
		employeeService=new EmployeeServiceImpl();
	}
  @Override
	protected void doGet(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		/*List<Employee> employees = employeeService.findAll();
		request.setAttribute("employees", employees);*/
		 Integer id=Integer.parseInt(request.getParameter("id"));
		 Boolean flag=employeeService.deleteEmployee(id);
		 if(flag) {
			 request.setAttribute("employees",employeeService.findAll());
			 request.setAttribute("success","employee deleted :" +id);
			 
		 }else {
			 request.setAttribute("error","employee does not deleted :" +id);
		 }
		 request.getRequestDispatcher("welcome.jsp").forward(request, response);
		 
	}
}
