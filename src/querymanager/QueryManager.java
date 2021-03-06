package querymanager;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.DatastoreServiceFactory;
import com.google.appengine.api.datastore.PreparedQuery;
import com.google.appengine.api.datastore.Query;
import com.google.appengine.api.datastore.Query.CompositeFilterOperator;
import com.google.appengine.api.datastore.Query.Filter;
import com.google.appengine.api.datastore.Query.FilterOperator;
import com.google.appengine.api.datastore.Query.FilterPredicate;
import com.google.appengine.api.datastore.Query.SortDirection;
import com.google.appengine.api.datastore.DatastoreService;
public class QueryManager {
    private DatastoreService ds;
	private static String rate="";
    
    public QueryManager(){
	  	ds = DatastoreServiceFactory.getDatastoreService();		
	}

    public boolean isPostRepeat(String user_id,String str)
    {
    	Filter strFilter = 
	  		      new FilterPredicate("str",
	  		                      FilterOperator.EQUAL,
	  		                      str);
		
		Filter idFilter = 
		      new FilterPredicate("user_id",
		                      FilterOperator.EQUAL,
		                      user_id);
 
	    Filter validFilter = CompositeFilterOperator.and(idFilter,strFilter);
	    Query q = new Query("Post").setFilter(validFilter).addSort("time", SortDirection.DESCENDING);
	    PreparedQuery pq = ds.prepare(q);
	    for(Entity result:pq.asIterable()){
	      if(result!=null){
	    	return true;
	      }
	    }
	    return false;
    }
    
    public boolean isCommentRepeat(String user_id,String time,String comment)
    {
    	comment=user_id+"@"+comment;
    	Filter timeFilter = 
	  		      new FilterPredicate("time",
	  		                      FilterOperator.EQUAL,
	  		                      time);
		
		Filter idFilter = 
		      new FilterPredicate("user_id",
		                      FilterOperator.EQUAL,
		                      user_id);

	    Filter validFilter = CompositeFilterOperator.and(idFilter,timeFilter);
	    Query q = new Query("Post").setFilter(validFilter).addSort("time", SortDirection.DESCENDING);
	    PreparedQuery pq = ds.prepare(q);
	    for(Entity result:pq.asIterable()){
    	  ArrayList<String> comments =(ArrayList<String>)result.getProperty("comment");
    	  for(String str:comments)
    	  {
    		if(str.equals(comment))
    		{
    			return true;
    		}
    	  }
	    }  
    	return false;
    }
    
    public boolean isTopicRepeat(String sem,String sub,String topic)
    {
    	Filter semFilter = 
	  		      new FilterPredicate("sem",
	  		                      FilterOperator.EQUAL,
	  		                      sem);
		
		Filter subFilter = 
		      new FilterPredicate("sub",
		                      FilterOperator.EQUAL,
		                      sub);
       
	    Filter validFilter = CompositeFilterOperator.and(subFilter,semFilter);
	    Query q = new Query("Topics").setFilter(validFilter).addSort("time", SortDirection.DESCENDING);
	    PreparedQuery pq = ds.prepare(q);
	    Entity result=pq.asSingleEntity();
  	    ArrayList<String> topics =(ArrayList<String>)result.getProperty("topics");
  	    for(String str:topics)
  	    {
  	    	
  		   if(str.equals(topic))
  		   {
  			 return true;
  		   }
  	    }
  	    return false;
    }
    
    public boolean isRepeatedRating(String rating)
    {
        if(QueryManager.rate.equals(""))
        {
           QueryManager.rate=rating;	
    	   return false;  
        }
	    if(QueryManager.rate.equals(rating))
	    {
	    	return true;
	    }
	    QueryManager.rate=rating;
	    return false;
    }
    
	public PreparedQuery getPostIterable(String sub,String sem,String topic)
	{
		Filter semFilter = 
  		      new FilterPredicate("sem",
  		                      FilterOperator.EQUAL,
  		                      sem);
  	    Filter subFilter =
  		      new FilterPredicate("sub",
  		                      FilterOperator.EQUAL,
  		                      sub);
  	    Filter topicFilter = 
  		      new FilterPredicate("topic",
  		                      FilterOperator.EQUAL,
  		                      topic);   
  	    Filter validFilter = CompositeFilterOperator.and(semFilter,subFilter,topicFilter);
	    Query q = new Query("Post").setFilter(validFilter).addSort("time", SortDirection.DESCENDING);
	    PreparedQuery pq = ds.prepare(q);
		return pq;
	}
	
	public Entity getPostEntity(String time,String sem)
	{
		Filter semFilter = 
	  		      new FilterPredicate("sem",
	  		                      FilterOperator.EQUAL,
	  		                      sem);
		
		Filter timeFilter = 
  		      new FilterPredicate("time",
  		                      FilterOperator.EQUAL,
  		                      time);
   
  	    Filter validFilter = CompositeFilterOperator.and(timeFilter,semFilter);
	    Query q = new Query("Post").setFilter(validFilter).addSort("time", SortDirection.DESCENDING);
	    PreparedQuery pq = ds.prepare(q);
	    Entity result=pq.asSingleEntity();
		return result;
	}
	
	public void addPostToEntity(String user_id,String sem,String sub,String topic,String str,String tag)
	{
		  ArrayList<String> tags=new ArrayList();
		  for (String retval:tag.split(",")){
			tags.add(retval);
	      }
		  ArrayList<String> temp=new ArrayList();
	      temp.add("");
          int a=0;
          float b=0;
		  Calendar cal = Calendar.getInstance();
		  SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
		  Entity xyz = new Entity("Post");
		  xyz.setProperty("user_id",user_id);
          xyz.setProperty("sem",sem);
          xyz.setProperty("sub",sub);
          xyz.setProperty("topic",topic);
          xyz.setProperty("time",sdf.format(cal.getTime()));
          xyz.setProperty("str",str);
          xyz.setProperty("tag",tags);
          xyz.setProperty("comment",temp);
		  xyz.setProperty("comment_count",a);
		  xyz.setProperty("rating",b);
		  xyz.setProperty("rating_count",a);
          ds.put(xyz);
	    
	}
	
	public void addCommentToEntity(Entity result,String comment,String user_id)
	{
		  long comment_count=(long)result.getProperty("comment_count");
		  ArrayList<String>comments=new ArrayList<String>();
		  comments=(ArrayList<String>)result.getProperty("comment");
	      if(!comment.equals(""))
	      {  
	    	  comment=user_id + "@" +comment;
	    	  comments.add(comment);
	    	  result.setProperty("comment",comments);
	    	  comment_count++;
	    	  result.setProperty("comment_count",comment_count);
	    	  
	      }
          ds.put(result);
	}
	
	public void addTopicToEntity(Entity topic,String topic_str,String sem,String sub)
	{
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
        ArrayList<String> topics = new ArrayList<String>();
        if(topic==null){
        	if(!(topic_str.equals("")))
        	{
            	final Entity xyz = new Entity("Topics");
        		topics.add(topic_str);
        		xyz.setProperty("topics",topics);
        		xyz.setProperty("sem",sem);
        		xyz.setProperty("sub",sub);
        		xyz.setProperty("time",sdf.format(cal.getTime()));
                ds.put(xyz);
        	}

        }
        else{
            if(!(topic_str.equals("")))
            {
               topics=(ArrayList<String>)topic.getProperty("topics");	
        	   topics.add(topic_str);
        	   topic.setProperty("topics",topics);
            }
            ds.put(topic);
        }
        
	}
	
	public Entity getTopicEntity(String sem,String sub)
	{
     		Filter semFilter = 
	  		      new FilterPredicate("sem",
	  		                      FilterOperator.EQUAL,
	  		                      sem);
	  	    Filter subFilter =
	  		      new FilterPredicate("sub",
	  		                      FilterOperator.EQUAL,
	  		                      sub);
	  	    Filter validFilter = CompositeFilterOperator.and(semFilter,subFilter);
		    Query q = new Query("Topics").setFilter(validFilter).addSort("time", SortDirection.DESCENDING);
		    PreparedQuery pq = ds.prepare(q);
			Entity result=pq.asSingleEntity();
			if(result==null)
			{
				ArrayList<String> topics = new ArrayList<String>();
				Calendar cal = Calendar.getInstance();
				SimpleDateFormat sdf = new SimpleDateFormat("HH:mm:ss");
				Entity xyz=new Entity("Topic");
				xyz.setProperty("sem",sem);
				xyz.setProperty("sub",sub);
				xyz.setProperty("time",sdf.format(cal.getTime()));
				xyz.setProperty("topics",topics);
				ds.put(xyz);
				return xyz;
			}
			return result;
	}
	
	public void addRatingToPost(String time,String sem,String rating)
	{
		Filter semFilter = 
	  		      new FilterPredicate("sem",
	  		                      FilterOperator.EQUAL,
	  		                      sem);
		
		Filter timeFilter = 
		      new FilterPredicate("time",
		                      FilterOperator.EQUAL,
		                      time);
 
	    Filter validFilter = CompositeFilterOperator.and(timeFilter,semFilter);
	    Query q = new Query("Post").setFilter(validFilter).addSort("time", SortDirection.DESCENDING);
	    PreparedQuery pq = ds.prepare(q);
	    Entity result=pq.asSingleEntity();
		double r=(double) result.getProperty("rating");
		long c=(long)result.getProperty("rating_count");
		long a=Long.parseLong(rating,10);
		r=(r*c+a)/(c+1);
		result.setProperty("rating",r);
		result.setProperty("rating_count",c+1);
		ds.put(result);
	}
	
}