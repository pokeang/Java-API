package com.mcnc.students.service.api;

import java.util.List;

import com.mcnc.students.service.dto.StudentDTO;

public interface IStudentService {
	public boolean insertStudent(StudentDTO stud);
	/*public List<StudentDTO> getStudentById( StudentDTO st );*/
	public List<StudentDTO> listStudent();	
	public boolean updateStudent(StudentDTO stud);
	public boolean deleteStudentById(Integer studId);
}
