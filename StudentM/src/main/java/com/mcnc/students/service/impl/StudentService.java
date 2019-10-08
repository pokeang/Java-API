package com.mcnc.students.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.mcnc.students.dao.StudentDAO;
import com.mcnc.students.service.api.IStudentService;
import com.mcnc.students.service.dto.StudentDTO;

public class StudentService implements IStudentService {
	@Autowired
	private StudentDAO studentDao;
	
	@Override
	public boolean insertStudent(StudentDTO stud) {
		// TODO Auto-generated method stub
		return studentDao.insertStudent(stud);
	}

	
	/*public List<StudentDTO> getStudentById(StudentDTO st) {
		return studentDao.getStudentById(st);
	}*/

	

	@Override
	public List<StudentDTO> listStudent() {
		return studentDao.listStudents();
	}


	@Override
	public boolean updateStudent(StudentDTO stud) {
		// TODO Auto-generated method stub
		
		return studentDao.updateStudent(stud);
	}

	@Override
	public boolean deleteStudentById(Integer studId) {
		// TODO Auto-generated method stub
		return studentDao.deleteStudentById(studId);
	}

	




}
