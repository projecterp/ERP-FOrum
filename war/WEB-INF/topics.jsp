<%@ page import="java.io.IOException"
import ="java.util.ArrayList"
import ="java.util.Iterator"
import ="com.google.appengine.api.datastore.Entity"
import ="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"
import ="querymanager.Query_All"
%>

<script type="text/javascript">
function activate_new_topic()
{
   document.getElementById("new_topic").style.display="block";
}
</script>
<html>
<head>
<title>The Topics are...</title>
<style>
body { 
    background:  url("6918865-black-background-wood.jpg") no-repeat fixed center; 
}
input[type=submit].view {
    margin: 0;
    border: 0;
    background: transparent;
    color: blue;
    text-decoration: underline;
    cursor: pointer;
    overflow: visible;
}
</style>
</head>
<body>
<strong>
<font color="red" size="15">
<p>TOPICS</p>
<p>Your Topics are:-</p>
</font>
<font color="white" size="5">
<form action="forum_v1" method="get">
<input type="hidden" name="flag" value="false">
<input type="hidden" name="rating" value="0">
<input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
<input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
<%
          Query_All query=new Query_All();
		  ArrayList<String> temp=new ArrayList();
		  temp=query.getTopics(request.getParameter("sem"),request.getParameter("sub"));		   
		  for(String str:temp)
		  {
%>
<p><input type="Submit" name="btn" height="10" class="view" value="<%=str%>"></p>
<%
} 
%>

<p>For adding new topic:<input type="button" value="NEW TOPIC" onClick="activate_new_topic()"></p>
<div id="new_topic" style="display:none">
<br><input type="text" name="topic" >
<input type="Submit" name="btn" value="ADD NEW TOPIC">
</div>
</font>
</form>
</body>
</html>