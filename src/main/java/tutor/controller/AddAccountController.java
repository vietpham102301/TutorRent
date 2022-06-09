package tutor.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.http.HttpSession;

//import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import entities.Account;
import entities.Student;
import entities.Tutor;



@Transactional
@Controller
@RequestMapping("tutor")
public class AddAccountController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping(value="signup", method = RequestMethod.GET)
	public String signUP(ModelMap model)
	{
		model.put("acc", new Account());
	
		
		return "Signup/signup";
		
	}
	
	@RequestMapping(value = "infor", method= RequestMethod.POST)
	public String addAccount(@ModelAttribute("acc") Account acc, BindingResult errors, ModelMap model, HttpSession se)
	{
		
		if(acc.getUsername().trim().length() == 0)
		{
			errors.rejectValue("username", "acc", "Vui lòng điền tên đăng nhập");
		
		}
		if(acc.getEmail().trim().length()==0)
		{
			errors.rejectValue("email", "acc", "Vui lòng nhập email");
		}
		if(acc.getPassword().trim().length()==0)
		{
			errors.rejectValue("password", "acc", "Vui lòng nhập mật khẩu");
		
		}
		else if(acc.getConfirmPass().trim().length()==0)
		{
			errors.rejectValue("confirmPass", "acc", "Vui lòng nhập lại mật khẩu");
		
		}
		else if(!acc.getPassword().equals(acc.getConfirmPass()))
		{
			errors.rejectValue("confirmPass", "acc", "Mật khẩu không trùng khớp, vui lòng kiểm tra lại");
		
		}
		else {
			
			Session session = factory.getCurrentSession();
			String hql = "FROM Account a WHERE a.username = :username";
			String hql2 = "FROM Account a WHERE a.email = :email";
			Query query = session.createQuery(hql);
			Query query2 = session.createQuery(hql2);
			query2.setParameter("email", acc.getEmail());
			query.setParameter("username", acc.getUsername());
//			String username = (String) query.uniqueResult();
			//List<Account> accs = query.list();
			if(query.uniqueResult() != null)
			{
				errors.rejectValue("username", "acc", "Tên tài khoản đã được sử dụng, vui lòng chọn tên tài khoản khác");
				return  "Signup/signup";
			}
			else if(query2.uniqueResult() != null)
			{
				errors.rejectValue("email", "acc", "Email đã được sử dụng, vui lòng nhập email khác");
			}else {
				session = factory.openSession();
				Transaction t = session.beginTransaction();
				try {
					session.save(acc);
					se.setAttribute("accObject", acc);
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
					model.put("tutor", new Tutor());
					
					return "Signup/TutorInfor";
			
					
			}
			
			
		}
		
		
		
		return "Signup/signup";
		
		
	}

}
