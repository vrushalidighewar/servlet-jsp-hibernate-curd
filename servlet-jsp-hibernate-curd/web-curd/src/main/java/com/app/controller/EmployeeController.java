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

@WebServlet("/register")
public class EmployeeController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	EmployeeService employeeService = null;

	public EmployeeController() {
		employeeService = new EmployeeServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Employee> employees = employeeService.findAll();
		request.setAttribute("employees", employees);
        request.getRequestDispatcher("welcome.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Employee employee = new Employee();
		
		String eid=request.getParameter("id");
		
		if(eid!=null && eid!="") {
			employee.setId(Integer.parseInt(eid));
		}
		
		employee.setName(request.getParameter("name"));
		employee.setMobile(request.getParameter("mobile"));
		employee.setSalary(Double.parseDouble(request.getParameter("salary")));
		employee.setAge(Integer.parseInt(request.getParameter("age")));

		
		
		Boolean flag = employeeService.saveOrUpdateEmployee(employee);

		if (flag) {
			request.setAttribute("success", "employee saved successfully");
		} else {
			request.setAttribute("error", "employee saved successfully");
		}
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
}
