<%@ page import="java.sql.*" %>
<%
java.util.Date dt;
int dy,mn,yr;
String tdt,dist;
%>
<%
Connection con;
Statement stmt,stmt1;
ResultSet rs;
String cname;
%>

<%
try{
out.println("<TH>CITIZEN PROFILE<hr>");
cname=request.getParameter("cname");
Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
con=DriverManager.getConnection("Jdbc:Odbc:uiddsn");
stmt=con.createStatement();
rs=stmt.executeQuery("select * from cregn where ano=" + cname);
if(rs.next())
{
out.println("<html><body background='light_blue1.bmp'><form method=post action='czpro.jsp'><table><tr><td><font size=1>Citizen ID</td><td><input type=text size=15 name=cid value="+ cname + "></td></tr>");
out.println("<tr><td><font size=1>Citizen Name</td><td><input type=text size=15 name=cname value="+ rs.getString(4)+ "></td><td><font size=1>Address</td><td><input type=text size=15 name=addr value="+ rs.getString(5)+ "></td></tr>");
out.println("<tr><td><font size=1>Birth Date</td><td><input type=text size=15 name=dob value="+ rs.getString(6)+ "></td><td><font size=1>Fathers Name</td><td><input type=text size=15 name=fname value="+ rs.getString(7)+ "></td>");
out.println("<tr><td><font size=1>Contact No</td><td><input type=text size=15 name=cno value="+ rs.getString(8)+ "></td><td><font size=1>Occupation</td><td><input type=text size=15 name=occ value="+ rs.getString(9)+ " ></td></tr><tr><td><font size=1>Photo</td><td><img src='" + rs.getString(10) +"' width=50 height=50></td>");
out.println("<td><font size=1>Pincode</td>");
out.println("<td><input type=text size=10 name=pin value= " + rs.getString(11) +"></td><tr><td><font size=1>Gender</td><td><font size=1><input type=text size=10 value=" + rs.getString(12) +"></td>");
out.println("<td><font size=1>Vehicle Type </td><td><select name='utype'><option value='2'>2 Wheeler</option> <option value='4'>4 Wheeler</option><option value='HV'>Heavy Vehicle </option></select></td></tr></td></tr>");
out.println("</table>");
out.println("<hr><table><tr><td><font size=1>Apply Passport <input type=radio name='r2' value='1' checked></td><td><font size=1>Apply License<input type=radio name='r2' value='2'></td></tr>");
out.println("</table><hr>");

out.println("<input type=submit value=Process>");

out.println("</form></body></html>");

}
else
{
out.println("<font color=red size=2>No such Citizen.");
}
}
catch(Exception ee)
{
out.println("Invalid Data! All fields are mandatory..." + ee.getMessage());
}
%>