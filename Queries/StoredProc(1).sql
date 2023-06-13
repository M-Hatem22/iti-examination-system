-------------------------------------Malak--------------------------------------------
/****** Course Table ******/
--Select--
create Procedure SelectCourse @id int
as
begin try
	Select *
	from Course
	where Course_ID = @id
end try
begin catch
	select 'Try Again'
end catch
--Insert--
create Procedure InsCourse @id int, @name nchar(10), @Hours int
as
begin try
	Insert into Course (Course_ID, Course_Name, Duration)
	values (@id, @name, @Hours)
end try
begin catch
	select 'Try Again'
end catch
--Update--Name
create Procedure UpdCourseName @id int, @name nchar(10)
as
begin
	if exists (select Course_ID
				from Course
				where Course_ID = @id)
		update Course
		set Course_Name = @name
		where Course_ID = @id
	else
		select 'Course Do Not Exists'
end
--Update--Duration
create Procedure UpdCourseDur @id int, @Hours int
as
begin
	if exists (select Course_ID
				from Course
				where Course_ID = @id)
		update Course
		set Duration = @Hours
		where Course_ID = @id
	else
		select 'Course Do Not Exists'
end
--Delete--
create Procedure DltCourse @id int
as
begin
	if exists (select Course_ID
				from Course
				where Course_ID = @id)
				begin
					delete from Question where Course_ID = @id
					delete from Exam where Course_ID = @id
					delete from Std_Course where Course_ID = @id
					delete from Inst_Course where Course_ID = @id
					delete from Course where Course_ID = @id
				end
	else
		select 'Course Do Not Exists'
end
/****** Exam Table ******/
--Select--
create Procedure SelectExam @id int
as
begin try
	Select *
	from Exam
	where Exam_ID = @id
end try
begin catch
	select 'Try Again'
end catch
--Insert--
create Procedure InsExam @id int, @Dur int, @Date date, @C_ID int
as
begin try
	Insert into Exam (Exam_ID, Duartion, Taken_Date, Course_ID)
	values (@id, @Dur, @Date, @C_ID)
end try
begin catch
	select 'Try Again'
end catch
--Update--Duration
create Procedure UpdExamDur @id int, @Hours int
as
begin
	if exists (select Exam_ID
				from Exam
				where Exam_ID = @id)
		update Exam
		set Duartion = @Hours
		where Exam_ID = @id
	else
		select 'Exam Do Not Exists'
end
--Delete--
create Procedure DltExam @id int
as
begin
	if exists (select Exam_ID
				from Exam
				where Exam_ID = @id)
				begin
					delete from Std_Ques_Exam where Exam_ID = @id
					delete from Exam where Exam_ID = @id
				end
	else
		select 'Exam Do Not Exists'
end
/****** Questions Table ******/
--Select--
create Procedure SelectQuest @id int
as
begin try
	Select *
	from Question
	where Question_ID = @id
end try
begin catch
	select 'Try Again'
end catch
--Insert--
create Procedure InsQuest @id int, @Txt nchar(50), @type nchar(10), @MA nchar(30), @Marks int, @C_ID int
as
begin try
	Insert into Question(Question_ID, Text, Type, Model_Answer, Point, Course_ID)
	values (@id, @Txt, @type, @MA, @Marks, @C_ID)
end try
begin catch
	select 'Try Again'
end catch
--Update--Text
create Procedure UpdQuest_Txt @id int, @Txt nchar(50)
as
begin
	if exists (select Question_ID
				from Question
				where Question_ID = @id)
		update Question
		set Text = @Txt
		where Question_ID = @id
	else
		select 'Question Do Not Exists'
end
--Update--Model Answer
create Procedure UpdQuest_MA @id int, @MA nchar(30)
as
begin
	if exists (select Question_ID
				from Question
				where Question_ID = @id)
		update Question
		set Model_Answer = @MA
		where Question_ID = @id
	else
		select 'Question Do Not Exists'
end
--Update--Points
create Procedure UpdQuest_Points @id int, @Marks int
as
begin
	if exists (select Question_ID
				from Question
				where Question_ID = @id)
		update Question
		set Point = @Marks
		where Question_ID = @id
	else
		select 'Question Do Not Exists'
end
--Delete--
create Procedure DltQuest @id int
as
begin
	if exists (select Question_ID
				from Question
				where Question_ID = @id)
				begin
					delete from Choice where Ques_ID = @id
					delete from Std_Ques_Exam where Quest_ID = @id
					delete from Question where Question_ID = @id
				end
	else
		select 'Exam Do Not Exists'
end
