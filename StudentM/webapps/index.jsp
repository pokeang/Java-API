<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title></title>
<script type="text/javascript"
	src="<c:url value="resources/js/jquery-1.9.1.js" />"></script>
<!-- <script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js"></script> -->
<script type="text/javascript">
var rootURL = "/StudentM/students";
	function showStudent() {
	
		$.ajax({
					url : "/StudentM/students/",
					type : 'GET',
					dataType : 'json',
					success : function(data) {
						var j=1;
						for (var i = 0; i < data.length; i++) {
							var stringtd = "<tr id='"+data[i].id+"'>";
							stringtd += "<td>" + j + "</td>";
							stringtd += "<td>" + data[i].name + "</td>";
							stringtd += "<td>" + data[i].total + "</td>";
							stringtd += "<td>" + data[i].total + "</td>";
							stringtd += "<td><a href='#' onClick='editStudent("+data[i].id+",\"select\")'>Edit</a> | <a href='#' onclick='deleteStudent("+data[i].id+")' >Delete</a></td>";
							stringtd += "</tr>";
							$("#datastudent").append(stringtd);
							j++;
						}
					},
					error : function(data, stutus, er) {
						alert("error:" + data + " stutus: " + status + " er:"
								+ er);
					}
				});
	}
	function selectByid(id){
		$.ajax({
			url:rootURL+"/selectId/"+id,
			type:"GET",
			dataType: 'json',
			success: function(data){
				$("txtname").val(data[0].name);
				$("txts1").val(data[0].s1);
			}
		});
	}
	function editStudent(id,select){
		if(select == "select"){
			selectByid(id);
		}
		else{
			$.ajax({
				url: rootURL+"/editStudent/"+id,
				type: 'PUT',
				dataType: 'json',
				success:function(data){
					
				}
			});
		}
	}
	function doAdd() {	
		var name = $('#txtname').val();
		var s1 = $('#txts1').val();
		var s2 = $('#txts2').val();
		console.log('addWine');
		$.ajax({
			type: 'POST',
			contentType: 'application/json',
			url: rootURL+"/add",
			dataType: "json",			
			data : formToJSON(),
			success: function(data){				
				$("#info").html(data);
				$('#txtname').val('');
				$('#txts1').val('');
				$('#txts2').val('');
				$("#datastudent").css("display",'none');
				$("#datastudent").css("display",'block');
				
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert('Add error: ' + textStatus);
			}
		});
		

	}
	function deleteStudent(id) {

		console.log('deleteStudent');
		//alert($("#"+id));
		$.ajax({
			type: 'DELETE',
			url: rootURL + '/delete/'+id,
			success: function(data, textStatus, jqXHR){
				alert('Student deleted successfully');
				$("#"+id).remove();
			},
			error: function(jqXHR, textStatus, errorThrown){
				alert('StudentWine error');
			}
		});
	}
	function formToJSON() {
		var wineId = $('#message').val();
		return JSON.stringify({
			"name": $('#txtname').val(), 
			"s1": $('#txts1').val(),
			"s2": $('#txts2').val(),
			});
	}
	
</script>
</head>
<body>
	<div style="margin: 0px auto; width: 400px;">
		<h1>List Student</h1>
		<p>
			<a href="#" onclick="Add()">Add New</a>
		</p>
		<div id="form_student" style="display:;">
			<div id="message"></div>
			<fieldset style="border: 1px solid #ccc">
				<legend>Student</legend>
				<form id="newStudent">
					<table>
						
						<tr>
							<td>Name :</td>
							<td><input type="text" name="txtname" id="txtname" /></td>
						</tr>
						<tr>
							<td>Score1 :</td>
							<td><input type="text" name="txts1" id="txts1" /></td>
						</tr>
						<tr>
							<td>Score2 :</td>
							<td><input type="text" name="txts2" id="txts2" /></td>
						</tr>
						<tr>
							<td colspan="2"><input type="button" value="Add"
								Onclick="doAdd()"></td>
						</tr>
						<tr>
							<td colspan="2"><div id="info" style="color: green;"></div></td>
						</tr>
					</table>
				</form>
			</fieldset>
		</div>
		<table border="1" colspan="0" rowspan="0" id="datastudent"
			style="text-align: center; border-collapse: collapse; margin-top: 20px; width: 100%">

			<th>Id</th>
			<th>Name</th>
			<th>Total</th>
			<th>Rank</th>
			<th>Action</th>
			<script type="text/javascript">
				$(document).ready(function() {
					showStudent();
				});
			</script>
		</table>
		
		
	</div>

</body>
</html>