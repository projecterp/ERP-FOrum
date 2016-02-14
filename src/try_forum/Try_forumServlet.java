package try_forum;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.apphosting.api.DatastorePb.DatastoreService;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

@SuppressWarnings("serial")
public class Try_forumServlet extends HttpServlet {
	private String text;

	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
		setText(req.getParameter("kk"));
		resp.setContentType("text/html");
		com.google.appengine.api.datastore.DatastoreService ds = DatastoreServiceFactory.getDatastoreService();
		Entity post = new Entity("Post");
		post.setProperty("str",getText());
		post.setProperty("no",1);
		ds.put(post);	/*	Query q = new Query("Post");
		q.setFilter(
		new Query.FilterPredicate(
		"no",
		Query.FilterOperator.LESS_THAN_OR_EQUAL,
		10));
		PreparedQuery pq = ds.prepare(q);
		ArrayList<String> postList=new ArrayList();
		for (Entity result : pq.asIterable()) {
			
			((ArrayList) postList).add(result.getProperty("str"));
		}
			
		req.setAttribute("kk",postList);
		*/
		RequestDispatcher jsp = req.getRequestDispatcher("/WEB-INF/home.jsp");
			jsp.forward(req, resp);
		}

/*		
		PrintWriter out = resp.getWriter();
		  String title = "Using GET Method to Read Form Data";
	      String docType =
	      "<!doctype html public \"-//w3c//dtd html 4.0 " +
	      "transitional//en\">\n";
	      out.println(docType +
	                "<html>\n" +
	                "<head><title>" + title + "</title></head>\n" +
	                "<body bgcolor=\"#f0f0f0\">\n" +
	                "<h1 align=\"center\">" + title + "</h1>\n" +
	                "<ul>\n" +
	                "  <li><b>text</b>: "
	                + req.getParameter("kk") + "\n" +
	                "</ul>\n" +
	                "</body></html>");
*/	                

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
}
