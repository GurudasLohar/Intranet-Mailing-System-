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

<% String question,answ=""; %>

<form method= post>
<font size="1" face="Courier New" >
<table class="table">

<tr>
<th>User Name:</th>
<th><input type="text" class="form-control" name="user" placeholder="Enter user name" value=<%
if(request.getParameter("user")!=null)
{
  out.println(request.getParameter("user"));
}

%>
></th>
<th><input type="submit" class="btn btn-primary btn-sh" value="Search" id="btn"></button></th>
</tr>
<tr>
<th>Security Question:</th>
<th><input type="text" class="form-control" id="sQue"  value= <%
if(request.getParameter("q")!=null)
{
out.println("'" + request.getParameter("q") +"'");
}
 %>></th>
</tr>
<tr>
<th>Answer:</th>
<th><input type = "text" class="form-control" name ="sAns" placeholder="Enter your answer" value=<%
if(request.getParameter("ans")!=null)
{
  out.println(request.getParameter("ans"));
}

%>></th>
<th><input type="submit" class="btn btn-primary btn-sh" value="Submit" id="btn"></button></th>
</tr>
<tr><th></th><th></th></tr>
<tr>
<th>Your Password:</th>
<th><input type="text" class="form-control" name="pWord" value= <%
if(request.getParameter("a")!=null)
{
out.println("'" + request.getParameter("a") +"'");
}
 %>></th>
<th></th>
</tr>
</table>
</font>


<%

if(request.getParameter("user")!=null && request.getParameter("sAns")!=null) 
{

String name = request.getParameter("user");
String ans = request.getParameter("sAns");

     try
     {
           java.sql.Connection con;
           java.sql.PreparedStatement pst;
           java.sql.ResultSet rs;
                   
           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/intranet","root","");

         String selectReg = "select Question,Answer from register where Username = ? ";

          pst = con.prepareStatement(selectReg);
          pst.setString(1,name);

          rs = pst.executeQuery();
          rs.next();
          question  = rs.getString(1);
          answ = rs.getString(2);
          out.println("<input type=hidden name='q' value='" + question +"'>");	
          
	if(ans == answ){
          	out.println("<input type=hidden name='a' value='" + answ +"'>");
}
	     
}
    catch(Exception ex)
    {
             out.println(ex);
    }
}

%>

</form> 
</body>
</html>
