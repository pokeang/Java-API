package com.mcnc.students.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mcnc.students.service.api.IStudentService;
import com.mcnc.students.service.dto.StudentDTO;

@Controller
@RequestMapping(value = "/students")
public class StudentController {
	@Autowired
	private IStudentService studentService;
	
	@RequestMapping(value ="/test", method = RequestMethod.GET)
	public @ResponseBody String[] test() {
		String[] st = {"aa", "bb","ccc"};
		return st;
	}
	
	@RequestMapping(method = RequestMethod.GET)
	public @ResponseBody List<StudentDTO> listStudents() {
		List<StudentDTO> students = studentService.listStudent();
		return students;
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST, produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody boolean insertStudent(@RequestBody StudentDTO student) {
		return studentService.insertStudent(student);
	}

	@RequestMapping(value = "/editStudent/{id}", method = RequestMethod.PUT)
	public @ResponseBody boolean editStudent(@PathVariable int id,
			@RequestBody StudentDTO student) {
		return studentService.updateStudent(student);

	}

	@RequestMapping(value = "/delete/{id}", method = RequestMethod.DELETE)
	public @ResponseBody boolean deleteStudent(@PathVariable int id) {
		return studentService.deleteStudentById(id);
	}

	

	/*@RequestMapping(value = "/selectId/{id}", method = RequestMethod.GET)
	public @ResponseBody List<StudentDTO> getStudentById(@PathVariable int id) {
		StudentDTO stud = new StudentDTO();
		stud.setId(id);
		List<StudentDTO> students = studentService.getStudentById(stud);
		return students;
	}*/

	

}
