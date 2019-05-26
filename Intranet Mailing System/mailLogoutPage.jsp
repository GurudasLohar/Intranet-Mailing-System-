<%
HttpSession mySession = request.getSession();
 
String un = (String)mySession.getAttribute("fName");
mySession.setAttribute("fName",null);

if(mySession.getAttribute("fName")==null)
{
 response.sendRedirect("mailHome.jsp");
 }
else
{
response.sendRedirect("http://www.google.com");
}
%>