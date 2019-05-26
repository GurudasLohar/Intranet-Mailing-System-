<html>
<head>
<title>Intranet Mail Register</title>
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
<h3 id="homeText">To recover your password</h3><br>
<%@ include file="mailForgetForm.jsp"%>
</th>
<th  width=400 height=400>
<%@ include file="mailLinks1.jsp"%>
</th>
</tr>
</table>


<footer>
<p>Copyright &copy; 2019-20 </p>
</footer>
</body>
</html>