<%@ page
import="java.io.IOException"
import ="java.io.PrintWriter"
import ="java.util.ArrayList"
import ="java.util.Iterator"
import ="com.google.appengine.api.datastore.Entity"
import ="java.util.Calendar"
import ="javax.servlet.RequestDispatcher"
import ="javax.servlet.ServletException"
import ="javax.servlet.http.*"
import ="com.google.appengine.api.datastore.DatastoreServiceFactory"
import ="java.text.SimpleDateFormat"
import ="com.google.appengine.api.datastore.PreparedQuery"
import ="com.google.appengine.api.datastore.Query"
import ="com.google.apphosting.api.DatastorePb.DatastoreService"
import ="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"
import ="com.google.appengine.api.datastore.Query.SortDirection"
import ="com.google.appengine.api.datastore.Query.Filter"
import ="com.google.appengine.api.datastore.Query.FilterPredicate"
import ="com.google.appengine.api.datastore.Query.FilterOperator"
import ="com.google.appengine.api.datastore.Query.CompositeFilter"
import ="com.google.appengine.api.datastore.Query.CompositeFilterOperator"
import ="com.google.appengine.api.users.User"
import ="com.google.appengine.api.users.UserService"
import ="com.google.appengine.api.users.UserServiceFactory"


%>
<html>
<head>
<title>CLASSES</title>
</head>
<style>
body { 
    background:  url("6918865-black-background-wood.jpg") no-repeat fixed center; 
    color :red;
}
.title{
    background-color: lightgrey;
    width: 300px;
    padding: 15px;
    border: 5px solid navy;
    margin: 15px;
}
</style>
<body>
<form action="topics.jsp" method="get">
<center>
<br><br>
<div id="title">
WELCOME TO VIRTUAL CLASS-ROOM
</div>
<br>
<br>
<%
		UserService userService = UserServiceFactory.getUserService();
		User user = userService.getCurrentUser();

%>
<input type="hidden" name="user_id" value="<%=user.getNickname()%>">
<font size="15">
<p>Welcome:<%=user.getNickname()%></p>
</font>
Semester:<select id="sem" name="sem" onchange="myFunction()">
            <option value="first">FIRST</option>
            <option value="second">SECOND</option>
            <option value="third">THIRD</option>
            <option value="fourth">FOURTH</option>
            <option value="fifth">FIFTH</option>
            <option value="sixth">SIXTH</option>
            <option value="seventh">SEVENTH</option>
            <option value="eigth">EIGTH</option>                        
         </select>
<!--<br>Subject:<select name='sub'>
            <option value='daa'>DESIGN & ANALYSIS OF ALGORITHM</option>
            <option value='comp'>COMPUTER ORGANIZATION & MICROPROCESSOR</option>
            <option value='flat'>FINETE LANGUAGES & AUTOMATA THEORY</option>
            <option value='dms'>DISCRETE MATHEMTICS</option>
            <option value='sp'>SYSTEM PROGRAMMING</option>
            <option value='eco'>ECONOMICS</option>          
        </select><br><br>
        <input type='Submit' name='btn'   value='ENTER THE CLASS'>         
-->
<script>
  function myFunction()
  {
         var x = document.getElementById("sem").value;
         document.getElementById("my_div").innerHTML=document.getElementById("my_div").innerHTML +
         "<br>Subject:<select name='sub'>"+
            "<option value='daa'>DESIGN & ANALYSIS OF ALGORITHM</option>" +
            "<option value='comp'>COMPUTER ORGANIZATION & MICROPROCESSOR</option>" +
            "<option value='flat'>FINETE LANGUAGES & AUTOMATA THEORY</option>" +
            "<option value='dms'>DISCRETE MATHEMTICS</option>" +
            "<option value='sp'>SYSTEM PROGRAMMING</option>" +
            "<option value='eco'>ECONOMICS</option>" +                       
        "</select><br><br>" +
        "<input type='Submit' name='btn'   value='ENTER THE CLASS'>";
  }
</script>
<div id="my_div">
</form>
</div>
</center>
</body>
</html>