<%@page import = "java.sql.*"%>

<html>
<head>
<title>Intranet Mail</title>
<link rel ="stylesheet" type="text/css" href= "Bootstrap\css\bootstrap.min.css">
<style>
body{
color: white;
background-image: url("Intranet11.jpg");
background-repeat: no-repeat;
background-size: cover;
margin-top:100px;
}
footer p {
text-align: center;
}
#title{
text-shadow: 2px 2px grey;
font-family: "MS Reference Sans Serif";
font-style: bold;
font-size: 40px;
}
#welcome{
margin-left: 900px;
}
#homeText{
font-size: 30px;
font-style: bold;
text-align:center;
}
#quote{
font-family:"Microsoft Tai Le";
font-size: 12px;
text-align:center;
}
footer p{
font-family:"Arial Rounded MT";
}
</style>
</head>

<body >
<header class=" container page-header">
<h1 id = "title">Intranet mail system</h1>
<h4 id = "welcome">

<%
//HttpSession session = request.getSession();
String uName = (String)session.getAttribute("fName");
if(session.getAttribute("fName")!=null){
%>
Welcome <%= uName%>
<%
}
else
{
%>
Welcome as guest
<%
}
%>

</h4>
</header>

<table class="container" width = 80%>
<tr>
<th>

<%
if(session.getAttribute("fName")!=null){
%>

<h3 id="homeText">Welcome to Inbox </h3>
<br><br>
<table border =6 align=center width=90%>
<tr>
<th height="40" >Send by</th>
<th height="40">Subject</th>
<th height="40">Time</th>
</tr>

<%
String uId = (String)session.getAttribute("fId");
     try
     {
          Connection con=null;
          PreparedStatement pst,pst1=null;
          ResultSet rs,rs1=null;

           Class.forName("com.mysql.jdbc.Driver");
           con = DriverManager.getConnection("jdbc:mysql://localhost/intranet","root","");

          String selectMail = "select SentById,Subject,Message,SentDate,MailId from mails where SentToId='"+uId+"'";
          pst = con.prepareStatement(selectMail);
          rs = pst.executeQuery();
          while(rs.next()){

String id = rs.getString(1);
String mail= rs.getString(5);
String selectId = "select UserName from register where UserId ='"+id+"'";
          pst = con.prepareStatement(selectId);
          rs1 = pst.executeQuery();
         while(rs1.next()){

%>
	<tr>
	<td><%=rs1.getString(1)%></td>
                   <td><a href =mailMessage.jsp?mailId=<%=mail%>><%=rs.getString(2)%></a></td>
	<td><%=rs.getString(4)%></td>
	</tr>
<%
	}
           }
     }
    catch(Exception ex)
    {
             out.println(ex);
}

%>
</table>

<%
}
else
{
%>
<h3 id="homeText">Welcome to Home </h3><br>
<h5 id="quote">Email has the virtue - sounds like a bad thing, but it's the virtue of being the lowest common denominator messaging protocol. Everyone can have it. It can cross organizational boundaries. No one owns it. It's not some particular company's platform----Stewart Butterfield</h5>
<%
}
%>

</th>
<th  width=400 height=400>
<%
//HttpSession session = request.getSession();
//String uName = (String)session.getAttribute("fName");
if(uName!=null)
{
%>
<%@ include file="mailLinks2.jsp"%>
<%
}
else
{
%>
<%@ include file="mailLinks1.jsp"%>
<%
}
%>
</th>
</tr>
</table>


<footer>
<p>Copyright &copy; 2019-20 </p>
</footer>
</body>
</html>