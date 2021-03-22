<%@page import="com.app.entity.Employee"%>
<%@page import="java.util.List"%>
<head>
<title>Employee Management</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>

<form class="form-horizontal" action="register" method="post">
	<fieldset>

		<%
			String success = (String) request.getAttribute("success");
			String error = (String) request.getAttribute("error");
		%>
		<%
		
			if (success != null) {
		%>
		<div class="alert alert-success" style="width: 350px; margin: auto;">
			<strong>Success!</strong>
			<%=success%>
		</div>
		<%
			}
		%>

		<%
			if (error != null) {
		%>
		<div class="alert alert-danger" style="width: 350px; margin: auto;">
			<strong>Danger!</strong>
			<%=error%>
		</div>
		<%
			}
		%>
		<br>
		<!-- Form Name -->
		<legend>Employee Management</legend>

		<%
                   Employee employee=(Employee) request.getAttribute("employee");
        %>

		<!-- Text input-->
		
		<%
		          if(employee!=null){
		%>
		
		<input type="hidden" value="<%=employee.getId()%>" name="id">
		
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">Name</label>
			<div class="col-md-4">
				<input id="name" name="name" type="text" placeholder="Enter Name"
					class="form-control input-md" required="" value=<%= employee.getName()%>>

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">Mobile</label>
			<div class="col-md-4">
				<input id="mobile" name="mobile" type="text"
					placeholder="Enter Mobile" class="form-control input-md"
					required="" value=<%= employee.getMobile() %>>

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">Salary</label>
			<div class="col-md-4">
				<input id="salary" name="salary" type="text"
					placeholder="Enter Salary" class="form-control input-md"
					required="" value=<%= employee.getSalary() %>>

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="textinput">Age</label>
			<div class="col-md-4">
				<input id="age" name="age" type="text" placeholder="Enter Age"
					class="form-control input-md" required="" value=<%= employee.getAge() %>>

			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="singlebutton"></label>
			<div class="col-md-4">
				<button typr="submit" class="btn btn-success">Update</button>
			</div>
		</div>
		<%
		}else{
			
      %>
         <input type="hidden" value="" name="id">
		
		<div class="form-group">
			<label class="col-md-4 control-label" for="name">Enter Name</label>
			<div class="col-md-4">
				<input id="name" name="name" type="text" placeholder="Enter Name"
					class="form-control input-md" required="">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="mobile">Enter Mobile</label>
			<div class="col-md-4">
				<input id="mobile" name="mobile" type="text"
					placeholder="Enter Mobile" class="form-control input-md"
					required="">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="salary">Enter Salary</label>
			<div class="col-md-4">
				<input id="salary" name="salary" type="text"
					placeholder="Enter Salary" class="form-control input-md"
					required="">

			</div>
		</div>

		<!-- Text input-->
		<div class="form-group">
			<label class="col-md-4 control-label" for="age">Enter Age</label>
			<div class="col-md-4">
				<input id="age" name="age" type="text" placeholder="Enter Age"
					class="form-control input-md" required="">

			</div>
		</div>

		<!-- Button -->
		<div class="form-group">
			<label class="col-md-4 control-label" for="singlebutton"></label>
			<div class="col-md-4">
				<button type="submit" class="btn btn-primary">save</button>
			</div>
		</div> 
		<%
		}
      %>
      
      </fieldset>
</form>
      
		<div class="container">
			<h2>Employee</h2>

			<table class="table">
				<thead>
					<tr>
						<th>Id</th>
						<th>Name</th>
						<th>Mobile</th>
						<th>Salary</th>
						<th>Age</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>

					<%
				List<Employee> list=(List<Employee>) request.getAttribute("employees");
					if(!list.isEmpty()){
						for(Employee e:list){
				%>


					<tr>
						<td><%= e.getId()%></td>
						<td><%= e.getName()%></td>
						<td><%= e.getMobile()%></td>
						<td><%= e.getSalary()%></td>
						<td><%= e.getAge()%></td>
						<td><a href="edit?id=<%=e.getId() %>">Edit</a>|<a
							href="delete?id=<%=e.getId()%>">Delete</a></td>
					</tr>
					<%}}
					else{
				%>

					<%
				out.write("records not found");
				%>
					<%
					}
				%>

				</tbody>
			</table>
		</div>


	
