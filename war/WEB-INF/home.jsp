<%@ page import="java.io.IOException"
import="java.io.PrintWriter"
import="java.util.ArrayList"
import ="java.util.Iterator"
import ="com.google.appengine.api.datastore.Entity"

import ="javax.servlet.RequestDispatcher"
import ="javax.servlet.ServletException"
import ="javax.servlet.http.*"
import ="com.google.appengine.api.datastore.DatastoreServiceFactory"

import ="com.google.appengine.api.datastore.PreparedQuery"
import ="com.google.appengine.api.datastore.Query"
import ="com.google.apphosting.api.DatastorePb.DatastoreService"
import ="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"
%>
<html>
<head>
<title>The Time Is...</title>
<style>
div {
    background-color: lightgrey;
    width: 300px;
    padding: 15px;
    border: 5px solid navy;
    margin: 15px;
}
</style>
</head>
<body>
<p>Hey welcome</p>
<p>Your post is:-</p>
<%
    com.google.appengine.api.datastore.DatastoreService ds = DatastoreServiceFactory.getDatastoreService();  
    Query q = new Query("Post");
		q.setFilter(
		new Query.FilterPredicate(
		"no",
		Query.FilterOperator.LESS_THAN_OR_EQUAL,
		10));
		PreparedQuery pq = ds.prepare(q);
		ArrayList<String> postList=new ArrayList();
		for (Entity result : pq.asIterable()) {
%>			
<div><p><%=result.getProperty("str")%></p></div>
<%
}
%>
</body>
</html>