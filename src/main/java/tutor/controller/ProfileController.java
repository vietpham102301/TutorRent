package tutor.controller;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.transaction.Transactional;

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

import entities.Account;
import entities.Tutor;


@Transactional
@Controller
@RequestMapping(value = "tutor")
public class ProfileController {
	@Autowired
	SessionFactory factory;
	//public static Tutor currentTutor;
	public static Tutor tutorC;
	
	@RequestMapping(value="tutorProfile", method=RequestMethod.GET)
	public String getTutorProfile(ModelMap model, HttpServletRequest request, HttpSession se)
	{
		
		
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
		
		Tutor currentTutor  = (Tutor) se.getAttribute("tutorObject");
		if(se.getAttribute("tutorObject")!=null)
		tutorC = currentTutor;
		
		String[] bdate = tutorC.getBirthDate().split("-");
//		try {
			
//				System.out.println("run");
//				System.out.println(currentTutor.getTutorId() + " "+ currentTutor.getFirstName()+" this is is");
				
//				System.out.println(bdate[2]+"===============");
//				System.out.println(currentTutor.getBirthDate());
//		}catch(Exception e)
//		{
//			e.printStackTrace();
//		}
		
		
		
		//model.put("tutor", currentTutor);
		
		model.put("tutor", new Tutor());
		
		model.addAttribute("currentTutor", tutorC);
		
		//String[] bdate = currentTutor.getBirthDate().split("-");
		String bday = bdate[2];
		String bmonth = bdate[1];
		String byear = bdate[0];
		
		model.addAttribute("bday", bday);
		model.addAttribute("bmoth", bmonth);
		model.addAttribute("byear", byear);
		
		//System.out.println(se.getAttribute("userPhotoName"));se.getAttribute("userPhotoName")
		model.addAttribute("userPhotoName", tutorC.getPhotoName());
		model.addAttribute("fullName", tutorC.getLastName() +" " +tutorC.getFirstName());
		
		return "tutor/tutorProfile";
	}
	
	@RequestMapping(value="tutorProfile", method=RequestMethod.POST)
	public String postTutorProfile(ModelMap model, HttpSession se, @ModelAttribute("tutor") Tutor tutor, 
			@RequestParam("fullName") String fullName, @RequestParam("birthday") int bday, 
			@RequestParam("birthmonth") int bmonth, @RequestParam("birthyear") int byear, 
			@RequestParam("gender") String gender)
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
		
		
		
		Session session;
		
		session = factory.openSession();
		Transaction t = session.beginTransaction();
		try {
			Tutor currentTutor =(Tutor) se.getAttribute("tutorObject");
			System.out.println(currentTutor.getSchoolName());
			System.out.println(currentTutor.getTutorId());
			currentTutor.copy(tutor);
			System.out.println(currentTutor.getTutorId());
			System.out.println(currentTutor.getSchoolName());
			session.update(currentTutor);
			se.setAttribute("tutorObject", currentTutor);
			
		
			
			t.commit();
		}
		catch(Exception e)
		{
			t.rollback();
		}
		finally {
			session.close();
		}
		
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
		String[] bdate2= null;
		Tutor currentTutor  = (Tutor) se.getAttribute("tutorObject");
		try {
			
//				System.out.println("run");
//				System.out.println(currentTutor.getTutorId() + " "+ currentTutor.getFirstName()+" this is is");
				bdate2 = currentTutor.getBirthDate().split("-");
//				System.out.println(bdate2[2]+"===============");
//				System.out.println(currentTutor.getBirthDate());
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		if(se.getAttribute("tutorObject") != null)
			tutorC = (Tutor) se.getAttribute("tutorObject");
		
		
		model.addAttribute("currentTutor", tutorC);
		
		//String[] bdate = currentTutor.getBirthDate().split("-");
		String bday2 = bdate2[2];
		String bmonth2 = bdate2[1];
		String byear2 = bdate2[0];
		
		model.addAttribute("bday", bday2);
		model.addAttribute("bmoth", bmonth2);
		model.addAttribute("byear", byear2);
		
		//System.out.println(se.getAttribute("userPhotoName"));
		model.addAttribute("userPhotoName", tutorC.getPhotoName());
		model.addAttribute("fullName", tutorC.getLastName() +" " +tutorC.getFirstName());
		
		return "tutor/tutorProfile";
	}

}
