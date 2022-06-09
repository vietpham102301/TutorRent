package tutor.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entities.Account;
import entities.Tutor;
import object.Apply;
import object.PostInfor;

@Controller
@RequestMapping("tutor")
public class indexTutorController {
	
	@Autowired
	Mailer mailer;
	
    public static Connection establishCon()
  {
      
      try{
          String connectionUrl
          = "jdbc:sqlserver://localhost:1433;"
          + "databaseName=TutorRent;"
          + "encrypt=true;trustServerCertificate=true";
          //DriverManager.registerDriver(new com.microsoft.sqlserver.jdbc.SQLServerDriver());
          Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
          Connection con = DriverManager.getConnection(connectionUrl, "sa", "viet1234");
          return con;
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      return null;
  }
    
	
	
	@RequestMapping(value = "indexForTutor", method = RequestMethod.GET)
	public String index(ModelMap model, HttpSession se )
	{
		ArrayList<PostInfor> posts = new ArrayList<>();
        Connection con = establishCon();
        Statement st =null;
        try {
            
            String postQueryAll = "EXEC postInfor";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(postQueryAll);
            while(rs.next())
            {
            	PostInfor post = new PostInfor(rs.getInt("class_id"), rs.getString("subject_name"), rs.getString("subject_level"), rs.getString("description"), rs.getInt("num_of_lesson"), rs.getString("address"), rs.getString("sex"), rs.getFloat("fee"));
            	posts.add(post);
               
            }
            
        }
         catch (Exception e){
             e.printStackTrace();
         }
        finally{
            if(st !=null)
               {
                   try{
                       st.close();
                   }
                   catch (Exception e)
                   {
                       e.printStackTrace();
                   }
               }
               
              if(con !=null)
               {
                   try{
                       con.close();
                   }
                   catch (Exception e)
                   {
                       e.printStackTrace();
                   }
               }
        }
        
        Tutor currentTutor  = (Tutor) se.getAttribute("tutorObject");
        ArrayList<Apply> applys = new ArrayList<>();
        con = establishCon();
        st =null;
       try {
           
           String applyQueryAll = "Select * FROM APPLY WHERE tutor_id= "+ currentTutor.getTutorId();
           st = con.createStatement();
           ResultSet rs = st.executeQuery(applyQueryAll);
           while(rs.next())
           {
           	Apply app = new Apply(rs.getInt("post_id"), rs.getInt("tutor_id"));
           	applys.add(app);
              
           }
           
       }
        catch (Exception e){
            e.printStackTrace();
        }
       finally{
           if(st !=null)
              {
                  try{
                      st.close();
                  }
                  catch (Exception e)
                  {
                      e.printStackTrace();
                  }
              }
              
             if(con !=null)
              {
                  try{
                      con.close();
                  }
                  catch (Exception e)
                  {
                      e.printStackTrace();
                  }
              }
       }
        
		for(Apply app: applys)
		{
			for(PostInfor post: posts)
			{
				if(app.getPostId() == post.getPostId())
				{
					post.setCheckApply(1);
				}
			}
		}
		
        model.addAttribute("posts", posts);
        
      //  Tutor currentTutor = (Tutor) se.getAttribute("tutorObject");
        se.setAttribute("currentTutor", currentTutor);
		return "tutor/indexForTutor";
	}
	

	@RequestMapping(value = "/applied/{postId}", method = RequestMethod.GET)
	public String applied(ModelMap model, HttpSession se, @PathVariable("postId") int postId ) {
		
		
		
	
        
        
       
        
		Connection con = establishCon();
		Statement st =null;
        Tutor currentTutor  = (Tutor) se.getAttribute("tutorObject");
        try {
        	
            
            String cmd = "INSERT INTO APPLY"
            		+ " VALUES(" +postId+ ", " + currentTutor.getTutorId()+")";
            st = con.createStatement();
            st.executeUpdate(cmd);
           
            
        }
         catch (Exception e){
             e.printStackTrace();
         }
        finally{
            if(st !=null)
               {
                   try{
                       st.close();
                   }
                   catch (Exception e)
                   {
                       e.printStackTrace();
                   }
               }
               
              if(con !=null)
               {
                   try{
                       con.close();
                   }
                   catch (Exception e)
                   {
                       e.printStackTrace();
                   }
               }
        }
        
        
    	ArrayList<PostInfor> posts = new ArrayList<>();
         con = establishCon();
         st =null;
        try {
            
            String postQueryAll = "EXEC postInfor";
            st = con.createStatement();
            ResultSet rs = st.executeQuery(postQueryAll);
            while(rs.next())
            {
            	PostInfor post = new PostInfor(rs.getInt("class_id"), rs.getString("subject_name"), rs.getString("subject_level"), rs.getString("description"), rs.getInt("num_of_lesson"), rs.getString("address"), rs.getString("sex"), rs.getFloat("fee"));
            	posts.add(post);
               
            }
            
        }
         catch (Exception e){
             e.printStackTrace();
         }
        finally{
            if(st !=null)
               {
                   try{
                       st.close();
                   }
                   catch (Exception e)
                   {
                       e.printStackTrace();
                   }
               }
               
              if(con !=null)
               {
                   try{
                       con.close();
                   }
                   catch (Exception e)
                   {
                       e.printStackTrace();
                   }
               }
        }
        
        
    	ArrayList<Apply> applys = new ArrayList<>();
        con = establishCon();
        st =null;
       try {
           
           String applyQueryAll = "Select * FROM APPLY WHERE tutor_id= "+ currentTutor.getTutorId();
           st = con.createStatement();
           ResultSet rs = st.executeQuery(applyQueryAll);
           while(rs.next())
           {
           	Apply app = new Apply(rs.getInt("post_id"), rs.getInt("tutor_id"));
           	applys.add(app);
              
           }
           
       }
        catch (Exception e){
            e.printStackTrace();
        }
       finally{
           if(st !=null)
              {
                  try{
                      st.close();
                  }
                  catch (Exception e)
                  {
                      e.printStackTrace();
                  }
              }
              
             if(con !=null)
              {
                  try{
                      con.close();
                  }
                  catch (Exception e)
                  {
                      e.printStackTrace();
                  }
              }
       }
        
		for(Apply app: applys)
		{
			for(PostInfor post: posts)
			{
				if(app.getPostId() == post.getPostId())
				{
					post.setCheckApply(1);
				}
			}
		}
		
		try {
			String from = "vietpham102301@gmail.com";
			Account acc = (Account) se.getAttribute("accObject");
			String to = acc.getEmail();
			System.out.println(to+ " to this user");
			String subject = "Ứng tuyển mã lớp: " + postId;
			
			String body = "Ứng tuyển thành công cho mã lớp: "+postId +" \nBạn vui lòng gửi 25% học phí của lớp học vừa ứng tuyển vào số tài khoản: 1xxxxxxxxxx với cú phán Tên + Mã lớp ứng tuyển\n Chúng tôi sẽ hồi đáp bạn trong vòng 3h kể từ khi nhận được phí nhận lớp. \n Sau 3h nếu bạn không phản hồi người tiếp theo ứng tuyển sẽ được nhận lớp. \n Cảm ơn bạn đã chọn chúng tôi";
			
			mailer.send(from, to, subject, body);
		}catch (Exception e)
		{
			e.printStackTrace();
		}
		
		
        model.addAttribute("posts", posts);
        
        
		//System.out.println("id is: "+postId+"and tutor id is: " + currentTutor.getTutorId());
		return "tutor/indexForTutor";
	}

}
