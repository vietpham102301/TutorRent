package tutor.controller;


import java.io.File;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import entities.Account;
import entities.Tutor;
import object.PostInfor;

@Controller
@RequestMapping("tutor")
public class InforControllerForPost {
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
	     
	
	@RequestMapping(value="infor", method = RequestMethod.GET)
	public String signUP(ModelMap model)
	{
		model.put("tutor", new Tutor());
		
		Map<Integer, Integer> days = new HashMap<>();
		for(int i=0; i<31; i++)
		{
			days.put(i+1, i+1);
		}
		model.addAttribute("day", days);
		
		Map<Integer, Integer> months = new HashMap<>();
		for(int i=0; i<12; i++)
		{
			months.put(i+1, i+1);
		}
		model.addAttribute("month", months);
		
		Map<Integer, Integer> years = new HashMap<>();
		for(int i=0; i<24; i++)
		{
			years.put(1980+i+1, 1980+i+1);
		}
		TreeMap<Integer, Integer> sorted = new TreeMap<>(years);
		model.addAttribute("year", sorted);
		
		
		
		return "Signup/TutorInfor";
		
	}
	
	@Autowired
	ServletContext context;
	
	@RequestMapping(value="indexForTutor", method = RequestMethod.POST)
	public String submitSignup (@ModelAttribute("tutor") Tutor tutor, ModelMap model, @RequestParam("name") String fullName, 
			@RequestParam("birthday") int bday, @RequestParam("birthmonth") int bmonth, @RequestParam("birthyear") int byear,
			@RequestParam("photo") MultipartFile photo, @RequestParam("gender") String gender, HttpSession se)
	{
		String arr[] = fullName.split(" ");
		String sub[] = Arrays.copyOfRange(arr, 0, arr.length-1);
		String lName ="";
		for(int i=0; i<sub.length;i++)
		{
			lName = lName+" "+ sub[i];
		}
		tutor.setLastName(lName);
		tutor.setFirstName(arr[arr.length-1]);
		LocalDate bdate = LocalDate.of(byear, bmonth, bday);
		tutor.setBirthDate(bdate.toString());
		tutor.setSex(gender);
		System.out.println(tutor.getBirthDate());
		
		try {
			String userPhotoPath = "C:\\Users\\Admin\\eclipse-workspace\\TutorRent2\\src\\main\\webapp\\resources\\image\\"+photo.getOriginalFilename();
			photo.transferTo(new File(userPhotoPath));
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		se.setAttribute("userPhotoName", photo.getOriginalFilename());
		
		tutor.setPhotoName(photo.getOriginalFilename());
		 //byte[] photoBytes = null;
	
		//tutor.setSelfPic(photoBytes);
		
//		System.out.println(tutor.getFirstName());
//		System.out.println(tutor.getLastName());
//		System.out.println(tutor.getAddress());
//		System.out.println(tutor.getDescription());
//		System.out.println(tutor.getIdentityNum());
//		System.out.println(tutor.getMajor());
//		System.out.println(tutor.getPhone());
//		System.out.println(tutor.getSchoolName());
//		System.out.println(tutor.getSex());
//		System.out.println(tutor.getTutorId());
//		System.out.println(tutor.getBirthDate());
//		System.out.println(tutor.getSelfPic());
		
		
		
		Session session;
		
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			session.save(tutor);
			System.out.println(tutor.getTutorId());
			se.setAttribute("tutorObject", tutor);
			Account  acc = (Account) se.getAttribute("accObject");
			System.out.println(acc.getUsername());
			acc.setUserID(tutor.getTutorId());
			session.update(acc);
			
			t.commit();
		}
		catch(Exception e)
		{
			t.rollback();
		}
		finally {
			session.close();
		}
		
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
		
        model.addAttribute("posts", posts);
		
		
		return "tutor/indexForTutor";
	}
}