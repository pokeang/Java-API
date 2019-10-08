package com.mcnc.students.dao;

import java.util.List;

import com.mcnc.students.service.dto.StudentDTO;

public interface StudentDAO {
	public boolean insertStudent(StudentDTO st);
	public boolean updateStudent(StudentDTO st);
	/*public List<StudentDTO> getStudentById(StudentDTO st );*/
	public List<StudentDTO> listStudents();
	public boolean deleteStudentById(Integer studId);
}
