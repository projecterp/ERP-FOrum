package querymanager;

import java.util.ArrayList;

import com.google.appengine.api.datastore.Entity;
import com.google.appengine.api.datastore.PreparedQuery;

import querymanager.QueryManager;

public class Query_All{

	QueryManager query=new QueryManager();
    
	public void addRating(String time,String sem,String rating)
	{
		if(!query.isRepeatedRating(rating)){
	      query.addRatingToPost(time,sem,rating);	
		}
	}
	public Entity getPostByTime(String time,String sem)
	{
		
		return query.getPostEntity(time, sem);
	}
	
	public void addPost(String user_id,String sub,String sem,String topic,String str,String tag)
    {
		if(!(query.isPostRepeat(user_id,str))){
    	  query.addPostToEntity(user_id,sem, sub, topic, str, tag);
		}
    }
	
    public void addComment(String user_id,String comment,String time,String sem)
    {
    	if(!(query.isCommentRepeat(user_id,time,comment))){
    	  Entity result=query.getPostEntity(time,sem);
          query.addCommentToEntity(result, comment,user_id);
    	}
    }
    
    public PreparedQuery getPosts(String sub,String sem,String topic)
    {
    	return query.getPostIterable(sub, sem, topic);
		
    }
    
    public ArrayList<String> getTopics(String sem,String sub)
    {
		Entity result=query.getTopicEntity(sem,sub);
		return ((ArrayList<String>)result.getProperty("topics"));
    }
    
    public void addTopic(String topic_str,String sem,String sub)
    {
    	if(!(query.isTopicRepeat(sem, sub, topic_str))){
    	 Entity result=query.getTopicEntity(sem,sub);
    	 query.addTopicToEntity(result, topic_str, sem, sub);
    	}
    }
    
}
