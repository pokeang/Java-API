package StudentControllerTest;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mcnc.students.service.api.IStudentService;
import com.mcnc.students.service.dto.StudentDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:appcontext-root.xml")
public class StudentTest {
private IStudentService studentService;
	
	@RequestMapping(value = "/students")
	
	public @ResponseBody List<StudentDTO> getListStudents(){
		List<StudentDTO> student = studentService.listStudent();
		return student;
	}
	@Test
	public void Test(){
		System.out.println(getListStudents());
	}
}
