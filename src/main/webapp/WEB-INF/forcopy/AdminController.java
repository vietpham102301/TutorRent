package ptit.controller;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import ptit.entity.*;


@Transactional
@Controller
@RequestMapping("/QuanLy/")
public class AdminController {
	@Autowired
	SessionFactory factory;
	
	@RequestMapping("TrangChu")
	public String trangchu() {
		return "admin/trangchu";
	}
	
	public List<Tutor> dstt() {
		Session session = factory.getCurrentSession();
		String hql = "from Tutor";
		Query query = session.createQuery(hql);
		List<Tutor> list = query.list();
		return list;
	}
	
	public Tutor tutortheoid(int id) {
		Session session = factory.getCurrentSession();
		Tutor tutor = (Tutor) session.load(Tutor.class, id);
		return tutor;
	}
	
	public List<Student> user() {
		Session session = factory.getCurrentSession();
		String hql = "from Student";
		Query query = session.createQuery(hql);
		List<Student> list = query.list();
		return list;
	}
	
	public Student studenttheoid(int id) {
		Session session = factory.getCurrentSession();
		Student st = (Student) session.load(Student.class, id);
		return st;
	}
	
	public List<Account> TaiKhoan() {
		Session session = factory.getCurrentSession();
		String hql = "from Account";
		Query query = session.createQuery(hql);
		List<Account> list = query.list();
		return list;
	}
	
	public List<Post> PostNotApply() {
		Session session = factory.getCurrentSession();
		String hql = "from Post where applystatus = 0";
		Query query = session.createQuery(hql);
		List<Post> list = query.list();
		return list;
	}
	public List<Post> PostApply() {
		Session session = factory.getCurrentSession();
		String hql = "from Post where applystatus = 1";
		Query query = session.createQuery(hql);
		List<Post> list = query.list();
		return list;
	}
	public List<Subject> Subject() {
		Session session = factory.getCurrentSession();
		String hql = "from Subject";
		Query query = session.createQuery(hql);
		List<Subject> list = query.list();
		return list;
	}
	public List<Apply> Apply() {
		Session session = factory.getCurrentSession();
		String hql = "from Apply";
		Query query = session.createQuery(hql);
		List<Apply> list = query.list();
		return list;
	}
	public Subject subTheoId(int id) {
		Session session = factory.getCurrentSession();
		Subject sub = (Subject) session.load(Subject.class, id);
		return sub;
	}
	public Post PostTheoId(int id) {
		Session session = factory.getCurrentSession();
		Post post = (Post) session.load(Post.class, id);
		return post;
	}
	public Account TaiKhoan(int id) {
		Session session = factory.getCurrentSession();
		Account acc = (Account) session.load(Account.class, id);
		return acc;
	}
	
	@RequestMapping("GiangVien")
	public String giangvien(ModelMap model) {
		List<Tutor> list = dstt();
		model.addAttribute("list", list);
		return "admin/tutor";
	}
	@RequestMapping(value = "GiangVien/{tutorid}", params = "info")
	public String giangvienInfo(ModelMap model, @PathVariable("tutorid") int id) {
		model.addAttribute("idModal", "modalShow");
		List<Tutor> list = dstt();
		Tutor tutor = tutortheoid(id);
		model.addAttribute("Tutor", tutor);
		model.addAttribute("list", list);
		return "admin/tutor";
	}
	@RequestMapping("User")
	public String Student(ModelMap model) {
		List<Student> list = user();
		model.addAttribute("list", list);
		model.addAttribute("student", new Student());
		return "admin/student";
	}
	@RequestMapping(value = "User/{studentID}", params = "info")
	public String studentInfo(ModelMap model, @PathVariable("studentID") int id,@ModelAttribute("student") Student st) {
		model.addAttribute("idModal", "modalShow");
		List<Student> list = user();
		st = studenttheoid(id);
		model.addAttribute("st", st);
		model.addAttribute("list", list);
		return "admin/student";
	}
	@RequestMapping(value = "User/insert", method = RequestMethod.GET)
	public String StudentInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<Student> list = user();
		model.addAttribute("list", list);
		model.addAttribute("student", new Student());
		return "admin/student";
	}
	@RequestMapping(value = "User/insert", method = RequestMethod.POST)
	public String StudentInsert(@ModelAttribute("student") Student st,BindingResult errors,HttpServletRequest request) {
		if(st.getfName().trim().length() == 0) {
			errors.rejectValue("fName", "st", "Vui lòng nhập họ!");
		}
		if(st.getlName().trim().length()==0) {
			errors.rejectValue("lName", "st", "Vui lòng nhập tên!");
		}
		if(st.getPhone().trim().length()==0) {
			errors.rejectValue("phone", "st", "Vui lòng nhập số điện thoại!");
		}else if(st.getPhone().matches("[0-9]+")) {
			errors.rejectValue("phone", "st", "Vui lòng chỉ nhập số!");
		}
		if(st.getAddress().trim().length()==0) {
			errors.rejectValue("address", "st", "Vui lòng nhập địa chỉ!");
		}
		if(errors.hasErrors()) {
			
		}else {
			Session session = factory.openSession();
			Transaction transaction = session.beginTransaction();
			try {
				SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
				Date parsed = format.parse(request.getParameter("date"));
				java.sql.Date sql = new java.sql.Date(parsed.getTime());
				st.setDescription(request.getParameter("descrip"));
				st.setBdate(sql);
				session.save(st);
				transaction.commit();
			} catch (Exception e) {
				transaction.rollback();
				System.out.println(e.toString());
			}finally {
				session.close();
			}
		}
		return "redirect: /CNPM/QuanLy/User.html";
	}
	
	@RequestMapping("Account")
	public String Account(ModelMap model) {
		List<Account> list = TaiKhoan();
		model.addAttribute("list", list);
		return "admin/account";
	}
	
	@RequestMapping("Post")
	public String PostMain(ModelMap model) {
		return "admin/postmain";
	}
	@RequestMapping("Post/PostNotApply")
	public String PostNotApply(ModelMap model) {
		List<Post> list = PostNotApply();
		model.addAttribute("list", list);
		return "admin/postchuaapply";
	}
	@RequestMapping(value = "Post/PostNotApply/{postid}", params = "info")
	public String PostNotApplyInfo(ModelMap model, @PathVariable("postid") int id) {
		model.addAttribute("idModal", "modalShow");
		List<Post> list = PostNotApply();
		Post post = PostTheoId(id);
		model.addAttribute("post", post);
		model.addAttribute("list", list);
		return "admin/postchuaapply";
	}
	
	@RequestMapping(value = "Post/PostNotApply/{postid}", params = "update", method = RequestMethod.GET)
	public String PostNotApplyUpdate(ModelMap model, @PathVariable("postid") int id) {
		model.addAttribute("idModal", "modalUpdate");
		List<Post> list = PostNotApply();
		Post post = PostTheoId(id);
		List<Subject> sub = Subject();
		model.addAttribute("post", post);
		model.addAttribute("list", list);
		model.addAttribute("Sub", sub);
		return "admin/postchuaapply";
	}
	
	@RequestMapping(value = "Post/PostNotApply/{postid}", params = "update", method = RequestMethod.POST)
	public String PostNotApplyUpdate(@PathVariable("postid") int id, HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Post post = PostTheoId(id);
			post.setNumOfLesson(Integer.parseInt(request.getParameter("numlesson")));
			post.setFee(Float.parseFloat(request.getParameter("fee")));
			session.update(post);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			System.out.println(e.toString());
		}finally {
			session.close();
		}
		return "redirect: /CNPM/QuanLy/Post/PostNotApply.html";
	}
	
	@RequestMapping("Post/PostApply")
	public String PostApply(ModelMap model) {
		List<Post> list = PostApply();
		model.addAttribute("lists", list);
		return "admin/postapply";
	}
	@RequestMapping(value = "Post/PostApply/{postid}", params = "info")
	public String PostApplyInfo(ModelMap model, @PathVariable("postid") int id) {
		model.addAttribute("idModal", "modalShow");
		List<Post> list = PostApply();
		Post post = PostTheoId(id);
		model.addAttribute("post", post);
		model.addAttribute("lists", list);
		return "admin/postapply";
	}
	
	@RequestMapping("MonHoc")
	public String Subject(ModelMap model) {
		List<Subject> list = Subject();
		model.addAttribute("list", list);
		model.addAttribute("sub", new Subject());
		return "admin/monhoc";
	}
	
	@RequestMapping(value = "MonHoc/insert",method = RequestMethod.GET)
	public String SubjectInsert(ModelMap model) {
		List<Subject> list = Subject();
		model.addAttribute("list", list);
		model.addAttribute("idModal", "modalCreate");
		model.addAttribute("sub", new Subject());
		return "admin/monhoc";
	}
	
	@RequestMapping(value = "MonHoc/insert",method = RequestMethod.POST)
	public String SubjectInsert(ModelMap model, @ModelAttribute("sub") Subject subject) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.save(subject);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			System.out.println(e.toString());
		}finally {
			session.close();
		}
		return "redirect: /CNPM/QuanLy/MonHoc.html";
	}
	
	@RequestMapping(value = "MonHoc/{postid}", params = "update", method = RequestMethod.GET)
	public String MonHocUpdate(ModelMap model, @PathVariable("postid") int id) {
		model.addAttribute("idModal", "modalUpdate");
		List<Subject> list = Subject();
		Subject subject = subTheoId(id);
		model.addAttribute("sub", subject);
		model.addAttribute("list", list);
		return "admin/monhoc";
	}
	
	@RequestMapping(value = "MonHoc/{postid}", params = "update", method = RequestMethod.POST)
	public String MonHocUpdate(@PathVariable("postid") int id, HttpServletRequest request) {
		Session session = factory.openSession();
		Transaction transaction = session.beginTransaction();
		try {
			Subject sub = subTheoId(id);
			sub.setName(request.getParameter("Name"));
			sub.setSubjectLevel(request.getParameter("level"));
			session.update(sub);
			transaction.commit();
		} catch (Exception e) {
			transaction.rollback();
			System.out.println(e.toString());
		}finally {
			session.close();
		}
		return "redirect: /CNPM/QuanLy/MonHoc.html";
	}
	
	@RequestMapping(value = "Post/PostNotApply/insert",method = RequestMethod.GET)
	public String PostNotApplyInsert(ModelMap model) {
		model.addAttribute("idModal", "modalCreate");
		List<Subject> sub = Subject();
		List<Post> list = PostNotApply();
		model.addAttribute("list", list);
		model.addAttribute("Sub", sub);
		return "admin/postchuaapply";
	}
	
	@RequestMapping(value = "Post/PostNotApply/insert",method = RequestMethod.POST)
	public String PostNotApplyInsert(ModelMap model, HttpServletRequest request) {
		Session session = factory.getCurrentSession();
		try {
			Student st = new Student();
			st.setfName(request.getParameter("fname"));
			st.setlName(request.getParameter("lname"));
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			Date parsed = format.parse(request.getParameter("date"));
			java.sql.Date sql = new java.sql.Date(parsed.getTime());
			st.setBdate(sql);
			st.setPhone(request.getParameter("phone"));
			session.save(st);
			Post post = new Post();
			post.setStudent(st);
			post.setSubject(subTheoId(Integer.parseInt(request.getParameter("subject"))));
			post.setNumOfLesson(Integer.parseInt(request.getParameter("numlesson")));
			post.setFee(Float.parseFloat(request.getParameter("fee")));
			session.save(post);
		} catch (Exception e) {
			System.out.println(e.toString());
		}
		return "redirect: /CNPM/QuanLy/Post/PostNotApply.html";
	}
}
