<%@ page import="java.io.IOException"
import ="java.util.ArrayList"
import ="java.util.Iterator"
import ="com.google.appengine.api.datastore.Entity"
import ="com.google.appengine.api.datastore.PreparedQuery"
import ="com.sun.xml.internal.bind.v2.schemagen.xmlschema.List"
import ="querymanager.Query_All"
%>
<html>
<head>
   <meta charset='utf-8'>
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
   <script src="script.js"></script>
<title>The Posts are...</title>
<!-- FOR RATING PART-->
<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link href="http://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">

<!-- END OF RATING PART-->

<script src="https://cdn.tinymce.com/4/tinymce.min.js" type="text/javascript"></script>

<script type="text/javascript">
      tinymce.init({
        selector: '#mytextarea'
      });
</script>

<script type="text/javascript">
  var timeout = setTimeout("location.reload(true);",30000);
  function resetTimeout() {
    clearTimeout(timeout);
    timeout = setTimeout("location.reload(true);",30000);
  }
</script>

<script type="text/javascript">
function addRating()
{
  var reExp = /rating=\\d+/;
  var url = window.location.toString();
  var newUrl = url.replace(reExp, "rating=" + getElementById("count").value);
  window.location.assign(newUrl);
}
function activate_new_post()
{
  document.getElementById("new_post").style.display="block";
}
function count_increment5()
{
  document.getElementById("count").value="5";
}
function count_increment4()
{
  document.getElementById("count").value="4";
}
function count_increment3()
{
  document.getElementById("count").value="3";
}
function count_increment2()
{
  document.getElementById("count").value="2";
}
function count_increment1()
{
  document.getElementById("count").value="1";
}
</script>

<script>
/* When the user clicks on the button, 
toggle between hiding and showing the dropdown content */
function myFunction1() {
    document.getElementById("myDropdown1").classList.toggle("show");
    document.getElementById("btn_count").value=1;
}
function myFunction2() {
    document.getElementById("myDropdown2").classList.toggle("show");
    document.getElementById("btn_count").value=2;
}
function myFunction3() {
    document.getElementById("myDropdown3").classList.toggle("show");
    document.getElementById("btn_count").value=3;
}

function myFunction4() {
    document.getElementById("myDropdown4").classList.toggle("show");
    document.getElementById("btn_count").value=4;
}

function myFunction5() {
    document.getElementById("myDropdown5").classList.toggle("show");
    document.getElementById("btn_count").value=5;
}

// Close the dropdown if the user clicks outside of it
window.onclick = function(event) {
  if (!event.target.matches('.dropbtn')) {
    var dropdowns = document.getElementsByClassName("dropdown-content");
    var i;
    for (i = 0; i < dropdowns.length; i++) {
      var openDropdown = dropdowns[i];
      if (openDropdown.classList.contains('show')) {
        openDropdown.classList.remove('show');
      }
    }
  }
}
</script>

<style>
#cssmenu,
#cssmenu ul,
#cssmenu li,
#cssmenu a {
  border: none;
  line-height: 1;
  margin: 0;
  padding: 0;
}
#cssmenu {
  height: 37px;
  display: block;
  border: 1px solid;
  border-radius: 5px;
  width: auto;
  border-color: #080808;
  margin: 0;
  padding: 0;
}
#cssmenu > ul {
  list-style: inside none;
  margin: 0;
  padding: 0;
}
#cssmenu > ul > li {
  list-style: inside none;
  float: left;
  display: inline-block;
  position: relative;
  margin: 0;
  padding: 0;
}
#cssmenu.align-center > ul {
  text-align: center;
}
#cssmenu.align-center > ul > li {
  float: none;
  margin-left: -3px;
}
#cssmenu.align-center ul ul {
  text-align: left;
}
#cssmenu.align-center > ul > li:first-child > a {
  border-radius: 0;
}
#cssmenu > ul > li > a {
  outline: none;
  display: block;
  position: relative;
  text-align: center;
  text-decoration: none;
  text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.4);
  font-weight: 700;
  font-size: 13px;
  font-family: Arial, Helvetica, sans-serif;
  border-right: 1px solid #080808;
  color: #ffffff;
  padding: 12px 20px;
}
#cssmenu > ul > li:first-child > a {
  border-radius: 5px 0 0 5px;
}
#cssmenu > ul > li > a:after {
  content: "";
  position: absolute;
  border-right: 1px solid;
  top: -1px;
  bottom: -1px;
  right: -2px;
  z-index: 99;
  border-color: #3c3c3c;
}
#cssmenu ul li.has-sub:hover > a:after {
  top: 0;
  bottom: 0;
}
#cssmenu > ul > li.has-sub > a:before {
  content: "";
  position: absolute;
  top: 18px;
  right: 6px;
  border: 5px solid transparent;
  border-top: 5px solid #ffffff;
}
#cssmenu > ul > li.has-sub:hover > a:before {
  top: 19px;
}
#cssmenu > ul > li.has-sub:hover > a {
  padding-bottom: 14px;
  z-index: 999;
  border-color: #3f3f3f;
}
#cssmenu ul li.has-sub:hover > ul,
#cssmenu ul li.has-sub:hover > div {
  display: block;
}
#cssmenu > ul > li.has-sub > a:hover,
#cssmenu > ul > li.has-sub:hover > a {
  background: #3f3f3f;
  border-color: #3f3f3f;
}
#cssmenu ul li > ul,
#cssmenu ul li > div {
  display: none;
  width: auto;
  position: absolute;
  top: 38px;
  background: #3f3f3f;
  border-radius: 0 0 5px 5px;
  z-index: 999;
  padding: 10px 0;
}
#cssmenu ul li > ul {
  width: 200px;
}
#cssmenu ul ul ul {
  position: absolute;
}
#cssmenu ul ul li:hover > ul {
  left: 100%;
  top: -10px;
  border-radius: 5px;
}
#cssmenu ul li > ul li {
  display: block;
  list-style: inside none;
  position: relative;
  margin: 0;
  padding: 0;
}
#cssmenu ul li > ul li a {
  outline: none;
  display: block;
  position: relative;
  font: 10pt Arial, Helvetica, sans-serif;
  color: #ffffff;
  text-decoration: none;
  text-shadow: 1px 1px 0 rgba(0, 0, 0, 0.5);
  margin: 0;
  padding: 8px 20px;
}
#cssmenu,
#cssmenu ul ul > li:hover > a,
#cssmenu ul ul li a:hover {
  background: #3c3c3c;
  background: -moz-linear-gradient(top, #3c3c3c 0%, #222222 100%);
  background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #3c3c3c), color-stop(100%, #222222));
  background: -webkit-linear-gradient(top, #3c3c3c 0%, #222222 100%);
  background: -o-linear-gradient(top, #3c3c3c 0%, #222222 100%);
  background: -ms-linear-gradient(top, #3c3c3c 0%, #222222 100%);
  background: linear-gradient(top, #3c3c3c 0%, #222222 100%);
}
#cssmenu > ul > li > a:hover {
  background: #080808;
  color: #ffffff;
}
#cssmenu ul ul a:hover {
  color: #ffffff;
}
#cssmenu > ul > li.has-sub > a:hover:before {
  border-top: 5px solid #ffffff;
}

</style>




<style>
@import url(http://fonts.googleapis.com/css?family=Roboto:500,100,300,700,400);

.dropbtn {
    background-color: #4CAF50;
    color: white;
    padding: 16px;
    font-size: 12px;
    border: none;
    cursor: pointer;
    
}

.dropbtn:hover, .dropbtn:focus {
    background-color: #3e8e41;
}

.dropdown {
    position:realtive;
    padding: 0px;
    border: 0px solid navy;
}

.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    overflow: auto;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    width: 400px;
    padding: 15px;
    border: 0px solid navy;
    background-color:none;
    overflow:auto;  
    height:150px;
}

.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}

.dropdown a:hover {background-color: #f1f1f1}

.show {display:block;}


body { 
    background:  url("6918865-black-background-wood.jpg") no-repeat fixed center; 
}
p{
   height:21px;
}
div {
    padding: 15px;
}
#header {
    background-color:black;
    color:white;
    text-align:center;
    width:auto;
    height:60px;
}
#nav1 {
    height:300px;
    width:100px;
    float:left;	      
}
#section {
    width:852px;
    height:490px;
    content-align:center;
    float:left;	 	 
}
#footer {
    background-color:black;
    color:white;
    clear:both;
    width:auto;
    height:20px;
    text-align:center;
    padding:0px;	 	 
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

* {
  margin: 0;
  padding: 0;
  font-family: roboto;
}

div.stars {
  width: 150px;
  display: inline-block;
}

input.star { display: none; }

label.star {
  float: right;
  padding: 10px;
  font-size: 20px;
  color: #444;
  transition: all .2s;
}

input.star:checked ~ label.star:before {
  content: '\f005';
  color: #FD4;
  transition: all .25s;
}

input.star-5:checked ~ label.star:before {
  color: #FE7;
  text-shadow: 0 0 20px #952;
}

input.star-1:checked ~ label.star:before { color: #F62; }

label.star:hover { transform: rotate(-15deg) scale(1.3); }

label.star:before {
  content: '\f006';
  font-family: FontAwesome;
}

.btn {
  border-radius: 4px;
  cursor: pointer;
  display: inline-block;
  font-size: 10px;
  margin: 18px 0 0 0;
  padding: 5px 14px;
  text-decoration: none;
  background-color:lightblue;
}

textarea {
  border: 1px solid #BDBDBD;
  border-radius: 3px;
  box-shadow: 0 0 2px #d8d8d8;
  display: block;
  height: 100px;
  margin: 16px 0 0 0;
  padding: 10px;
  width: 280px;
}

.feed {
  background: #fff;
  border: 1px solid #BDBDBD;
  border-radius: 3px;
  box-shadow: 0 0 2px #d8d8d8;
  margin: 10px 0 10px 0;
}

</style>

</head>
<body>
<div id="header">
    WELCOME TO FORUM
    <br>


<div id='cssmenu'>
<ul>
   <li><a href='#'><span>Home</span></a></li>
   <li class='active has-sub'><a href='#'><span>Products</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>Product 1</span></a>
            <ul>
               <li><a href='#'><span>Sub Product</span></a></li>
               <li class='last'><a href='#'><span>Sub Product</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>Product 2</span></a>
            <ul>
               <li><a href='#'><span>Sub Product</span></a></li>
               <li class='last'><a href='#'><span>Sub Product</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li class='active has-sub'><a href='#'><span>Products</span></a>
      <ul>
         <li class='has-sub'><a href='#'><span>Product 1</span></a>
            <ul>
               <li><a href='#'><span>Sub Product</span></a></li>
               <li class='last'><a href='#'><span>Sub Product</span></a></li>
            </ul>
         </li>
         <li class='has-sub'><a href='#'><span>Product 2</span></a>
            <ul>
               <li><a href='#'><span>Sub Product</span></a></li>
               <li class='last'><a href='#'><span>Sub Product</span></a></li>
            </ul>
         </li>
      </ul>
   </li>
   <li><a href='#'><span>About</span></a></li>
   <li class='last'><a href='#'><span>Contact</span></a></li>
</ul>
</div>
</div>
<div id="nav1" style="width:400px;height:490px;overflow:auto;" class="feed">
<strong>
<font color="red">
<p>Hey welcome</p>
<p>Your posts are:-</p>
</font>
</strong>
<%
     Query_All query=new Query_All();
     String topic;
     if((request.getParameter("btn")).equals("ADD POST"))
     {
        topic=request.getParameter("topic");
     }
     else if((request.getParameter("btn")).equals("PostComment"))
     {
        topic=request.getParameter("topic");
     }
     else if(request.getParameter("btn").equals("view") || request.getParameter("btn").equals("rate"))
     {
        topic=request.getParameter("topic");
     }
     else
     {
        topic=request.getParameter("btn");
     }
     PreparedQuery pq =query.getPosts(request.getParameter("sub"),request.getParameter("sem"),topic);
     for (Entity result : pq.asIterable()) {	
%>			
<div id="my_div" class="feed">
<form action="tag" method="get">
tags:
<%
  ArrayList<String> tag=new ArrayList();
  tag=(ArrayList)result.getProperty("tag");
  for(String str:tag)
  {
%> 
<input type="Submit" class="btn" name="btn" class="view" value="<%=str%>">
<!-- </form> -->
<%
}
%>
<input type="hidden" name="time" height="0px" value="<%=result.getProperty("time")%>">
<input type="hidden" name="flag" height="0px" value="true">
<input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
<input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
<input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
<input type="hidden" name="topic" value="<%=topic%>">
<p><%=result.getProperty("str")%></p>
<input type="Submit" name="btn" class="btn" class="view" value="view">
<!-- <form action="COMMENT" method="get"> -->
</form>  
</div>
<%
}
%>
<br>    
</div>
<div id="section" style="overflow:auto" class="feed">
<form action="forum_v1" method="get">
<input type="hidden" name="flag"height="0px" value="false">
<input type="hidden" name="rating" height="0px" value="<%=request.getParameter("rating")%>">
<input type="hidden" name="sem" value="<%=request.getParameter("sem")%>">
<input type="hidden" name="sub" value="<%=request.getParameter("sub")%>">
<input type="hidden" name="topic" value="<%=topic%>">
<input type="button" class="btn" value="ADD NEW POST" onClick="activate_new_post()">

<div id="new_post" style="display:none;background-color:none;
    width: 800px; class="feed">
<p>NEW POST:-</p>
<p><textarea id="mytextarea" name="post">Hello World!</textarea></p>
<br><br><br><br><br><br><br><br><br><br>
<p>tags:<input type="text" name="tag"></p>
<p><input type="Submit" name="btn" class="btn" value="ADD POST"></p>
</form>
</div>

<% if(request.getParameter("flag").equals("true"))
  {
%>
<div id="post" style="background-color:none" class="feed"
<%
      Entity result=query.getPostByTime(request.getParameter("time"),request.getParameter("sem"));
      ArrayList<String> tag=new ArrayList();
      tag=(ArrayList)result.getProperty("tag");
      for(String str:tag)
      {
%>
         <form action="tag" method="get"><input type="Submit" class="btn" name="btn" value="<%=str%>">    
<%
      }
%>
   <p><%=result.getProperty("str")%></p>
<%
      ArrayList<String> comments =(ArrayList<String>)result.getProperty("comment");  
      for(String cmnt:comments)
      {
%>   
         <p><%=cmnt%></p>
<%
      }
   
%>
   
   <input type="hidden" id="count" name="rating" value="0">     
   <p><%=result.getProperty("comment_count")%>comments</p>   
   
      <input class="star star-5" id="star-5-2" type="radio" onclick="count_increment5()" name="star"/>
      <label class="star star-5" for="star-5-2"></label>
      <input class="star star-4" id="star-4-2" type="radio" onclick="count_increment4()" name="star"/>
      <label class="star star-4" for="star-4-2"></label>
      <input class="star star-3" id="star-3-2" type="radio" onclick="count_increment3()" name="star"/>
      <label class="star star-3" for="star-3-2"></label>
      <input class="star star-2" id="star-2-2" type="radio" onclick="count_increment2()" name="star"/>
      <label class="star star-2" for="star-2-2"></label>
      <input class="star star-1" id="star-1-2" type="radio" onclick="count_increment1()" name="star"/>
      <label class="star star-1" for="star-1-2"></label>
   <br>
   <p><input type="Submit" class="btn" name="btn" value="rate"></p>   
   <br>
   <textarea  name="comment"></textarea><br>
   <br>
   <input type="hidden" name="time" height="0px" value="<%=result.getProperty("time")%>">
   <input type="hidden" name="sem"  height="0px" value="<%=request.getParameter("sem")%>">
   <input type="hidden" name="sub"  height="0px" value="<%=request.getParameter("sub")%>">
   <input type="hidden" name="flag" height="0px" value="true">
   <input type="hidden" name="topic"  height="opx" value="<%=topic%>"> 
   <input type="Submit" name="btn" class="btn" value="PostComment">
</form>
</div>
<%
}
%>
</div>
<div id="footer">
Copyright © ProjectERP
</div>
</body>
</html>