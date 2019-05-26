<%@page import = "java.sql.*"%>

<html>
<head>
<title>Intranet Mail Register</title>
<link rel ="stylesheet" type="text/css" href= "Bootstrap\css\bootstrap.min.css">
<style>
body{
color: white;
margin-top:100px;
}
form{
margin-left:250px;
}
table{
font size="10";
}
</style>
</head>

<body>
<form method= post>
<font size="1" face="Courier New" >
<table class="table">
<tr>
<th>User Name:</th>
<th><input type="text" class="form-control" name="username" placeholder="Enter your username"/></th>
</tr>
<tr>
<th>Password:</th>
<th><input type = "password" class="form-control" name ="password" placeholder="Enter your password"/></th>
</tr>
<tr>
<th></th>
<th>
<input type="submit" class="btn btn-primary btn-lg" value="Login" id="btn"></button>
<a href =mailForget.jsp>Forget password..?</a>
</th></tr>
</table>
</font>
</form> 
</body>
</html>


<%

if(request.getParameter("username")!=null && request.getParameter("password")!=null) 
{

String name = request.getParameter("username");
String word = request.getParameter("password");

     try
     {
           java.sql.Connection con;
           java.sql.PreparedStatement pst;
           java.sql.ResultSet rs;
                   

           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/intranet","root","");

         String selectReg = "select UserId,Username,Password,RoleId from register where Username =? and Password=?";

          pst = con.prepareStatement(selectReg);
          pst.setString(1,name);
          pst.setString(2,word);

          rs = pst.executeQuery();
          rs.next();
String usId = rs.getString(1);

          if(rs.getRow() > 0){


HttpSession mysession = request.getSession();

mysession.setAttribute("fName",name);
mysession.setAttribute("fId",usId);

response.sendRedirect("mailHome.jsp");

                	if(rs.getInt(3) == 1){
                    		//out.println("Login as Admin"+mysession.getAttribute("fName"));
                	}
                	else{
			out.println("Login as User");
                              }
            	}

else{
		out.println("Please enter valid credentials");
	}
        

     }
    catch(Exception ex)
    {
             out.println(ex);
    }
}

%>