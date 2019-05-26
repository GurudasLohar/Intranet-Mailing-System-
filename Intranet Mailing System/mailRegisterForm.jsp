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
<form method = post>
<font size="1" face="Courier New" >
<table class="table">
<tr>
<th>User Name:</th>
<th><input type="text" class="form-control" name="user" placeholder="Enter your user name"/></th>
</tr>
<tr>
<th>Password:</th>
<th><input type = "password" class="form-control" name ="pass" placeholder="Enter your password"/></th>
</tr>
<tr>
<th>E-mail:</th>
<th><input type = "text" class="form-control" name ="email" placeholder="Only write your name" /></th>
</tr>
<tr>
<th>Security question:</th>
<th class="form-group">
<select class="form-control" name="que">
    <option>Select your security question</option>
    <option>Favorite game...??</option>
    <option>Birth place...??</option>
    <option>School name...??</option>
    <option>Favorite book...??</option>
    <option>Favorite place...??</option>
</select>
</th>
</tr>
<tr>
<th>Security answer:</th>
<th><input type = "text" class="form-control" name ="ans" placeholder="Enter your answer"/></th>
</tr>
<tr>
<th></th>
<th>
<input type="submit" class="btn btn-primary btn-lg" value="Submit" id="btn"></button>
</th>
</tr>
</table>
</font>
</form> 
</body>
</html>

<%

if(request.getParameter("user")!=null && request.getParameter("pass")!=null && request.getParameter("email")!=null && request.getParameter("que")!=null && request.getParameter("ans")!=null)
{

String uName = request.getParameter("user");
String pWord = request.getParameter("pass");
String eMail = request.getParameter("email");
String Que = request.getParameter("que");
String Ans = request.getParameter("ans");


     try
     {
           java.sql.Connection con;
           java.sql.PreparedStatement pst;
                   

           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/intranet","root","");

         String insertReg = "insert into register values(default,?,?,?,?,?,?,?)";
          pst = con.prepareStatement(insertReg);

         pst.setString(1,uName);
         pst.setString(2,pWord);
         pst.setString(3,eMail+"@ecti.com");
         pst.setString(4,Que);
         pst.setString(5,Ans);
         pst.setTimestamp(6, java.sql.Timestamp.from(java.time.Instant.now()));
         pst.setInt(7,2);
         
          pst.execute();
out.println("Record Inserted successfully");         

     }
    catch(Exception ex)
    {
             out.println(ex);
    }
}

%>