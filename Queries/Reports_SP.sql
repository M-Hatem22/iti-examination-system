-----------------------------------------Malak--------------------------------------------------------
------1-SP that returns the students information according to Department No parameter------
create Procedure Std_Dept @Dep_ID int
as
begin try
	Select *
	From Student
	Where Dep_ID = @Dep_ID
end try
begin catch
	Select 'Try Again Later'
end catch
------2-SP that takes the student ID and returns the grades of the student in all courses. %------
create Procedure Std_Garde @Std_ID int
as
begin try
	Select C.Course_Name, (CAST(SC.Grade as decimal(4,2))/100) * 100 as Grade_Percentage
	from Course C, Std_Course SC
	where SC.Course_ID = C.Course_ID and SC.St_ID = @Std_ID
end try
begin catch
	Select 'Try Again Later'
end catch
------3-SP that takes the instructor ID and returns the name of the courses that he teaches and the number of student per course.------
create Procedure Ins_Crs @Ins_ID int
as
begin try
	Select C.Course_Name, COUNT(SC.St_ID) as Std_Count
	From Course C, Inst_Course IC, Std_Course SC
	Where IC.Course_ID = C.Course_ID and SC.Course_ID = C.Course_ID and IC.Ins_ID = @Ins_ID
	Group By C.Course_ID, C.Course_Name
end try
begin catch
	Select 'Try Again Later'
end catch
------4-SP that takes course ID and returns its topics.------
create Procedure Crs_Topics @Crs_ID int
as
begin try
	Select Topic_Name
	From Topics
	Where Course_ID = @Crs_ID
end try
begin catch
	Select 'Try Again Later'
end catch
------5-SP that takes exam number and returns the Questions in it and chocies.------
create Procedure Exam_Ques_Choices @Exam_Num int
as
begin try
	Select Q.Text as Question, C.Choice_Text
	From Question Q, Choice C, Std_Ques_Exam SQE
	Where Q.Question_ID = C.Ques_ID and Q.Question_ID = SQE.Quest_ID and SQE.Exam_ID = @Exam_Num
end try
begin catch
	Select 'Try Again Later'
end catch
------6-SP that takes exam number and the student ID then returns the Questions in this exam with the student answers.------
create Procedure Ques_StdAnswer @Exam_Num int, @Std_ID int
as
begin try
	Select Q.Text as Question, SQE.Std_Answer
	From Question Q, Std_Ques_Exam SQE
	Where Q.Question_ID = SQE.Quest_ID and SQE.St_ID = @Std_ID and SQE.Exam_ID = @Exam_Num
end try
begin catch
	Select 'Try Again Later'
end catch