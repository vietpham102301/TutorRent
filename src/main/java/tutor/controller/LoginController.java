package tutor.controller;

import entities.*;
import object.Apply;
import object.PostInfor;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@Transactional
@RequestMapping(value = "tutor")
public class LoginController {
	@Autowired
	SessionFactory factory;
	
	
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
	
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public String login(ModelMap model)
	{
		model.put("acc", new Account());
		return "Login/login";
	}
	
	@RequestMapping(value = "index", method = RequestMethod.POST)
	public String login(@ModelAttribute(value = "acc") Account acc, ModelMap model, HttpSession se)
	{
		
		Session session = factory.getCurrentSession();
		String hql = "FROM Account a WHERE a.username = :username and a.password = :password";
		Query query = session.createQuery(hql);
		query.setParameter("username", acc.getUsername());
		query.setParameter("password", acc.getPassword());

		if(query.uniqueResult() != null)
		{
			session = factory.getCurrentSession();
			String cmd = "FROM Tutor a WHERE a.tutorId = :tutorId";
			Query query2 = session.createQuery(cmd);
			Account currentAcc = (Account)query.uniqueResult();
			query2.setParameter("tutorId", currentAcc.getUserID());
			Tutor currentTutor = (Tutor) query2.uniqueResult();
			se.setAttribute("accObject", currentAcc);
			se.setAttribute("tutorObject", currentTutor);
			ProfileController.tutorC = currentTutor;
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
	        
			
			
			return "tutor/indexForTutor";
		}
		else 
		if(acc.getUsername().equals("admin101") && acc.getPassword().equals("1234")) {
			return "redirect: /TutorRent2/QuanLy/TrangChu.html";
		}
		
		else{
			model.addAttribute("message", "Tài khoản hoặc mật khẩu không đúng<br>");
			return "Login/login";
		}
	}
	@RequestMapping(value="logout", method=RequestMethod.GET)
	public String Logout(HttpSession session)
	{
		session.removeAttribute("username");
		return "redirect:/tutor/login.html";
	}
	
	@RequestMapping("welcome")
	public String welcome()
	{
		return "welcome/welcome";
	}
	
}
