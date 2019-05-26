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
<th>To:</th>
<th><input type="text" class="form-control" name="rMail" /></th>
</tr>
<tr>
<th>Subject:</th>
<th><input type = "text" class="form-control" name ="subject" /></th>
</tr>
<tr>
<th>Message:</th>
<th><textarea class="form-control" rows="5" name ="message" ></textarea></th>
</tr>
<tr>
<th></th>
<th>
<input type="submit" class="btn btn-primary btn-lg" value="Send" id="btn"></button>
</th>
</tr>
</table>
</font>
</form> 
</body>
</html>

<%

if(request.getParameter("rMail")!=null && request.getParameter("subject")!=null && request.getParameter("message")!=null)
{

String mail = request.getParameter("rMail");
String sub = request.getParameter("subject");
String msg = request.getParameter("message");

//HttpSession session = request.getSession();
String userN = (String)session.getAttribute("fName");

    

 
        int temp1 = 0,temp2 = 0;
            try{

            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost/intranet","root","");
            Statement st = con.createStatement();
            PreparedStatement pst;
            String grocerysselect = "select UserId from register where Email='"+mail+"'";
            ResultSet rs = st.executeQuery(grocerysselect);
        
            while(rs.next()){

                temp1=rs.getInt(1);
                
            }
            
            String grocerysselect1 = "select UserId from register where UserName='"+userN+"'";
            ResultSet rs1 = st.executeQuery(grocerysselect1);
        
            while(rs1.next()){
                
                temp2=rs1.getInt(1);

            }
            
          String insertMail = "INSERT INTO `mails` VALUES (DEFAULT,?,?,?,?,?)";
          pst = con.prepareStatement(insertMail);

         pst.setInt(1,temp2);
         pst.setInt(2,temp1);
         pst.setTimestamp(3, java.sql.Timestamp.from(java.time.Instant.now()));
         pst.setString(4,sub);
         pst.setString(5,msg);

         
          pst.execute();
          out.println("Message sent");
        }
    catch(Exception ex)
    {
             out.println(ex);
    }
}

%>