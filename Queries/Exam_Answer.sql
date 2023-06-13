alter proc Student_Answer @Exam_No int, @First_Name varchar(20), @Last_Name varchar(20),
@ans1 nchar(30) , @ans2 nchar(30) , @ans3 nchar(30) , @ans4 nchar(30) ,@ans5 nchar(30),
@ans6 nchar(30),@ans7 nchar(30),@ans8 nchar(30),@ans9 nchar(30),@ans10 nchar(30) 
as 
if exists ( select Exam_ID from Std_Ques_Exam where Exam_ID = @Exam_No)
begin try
	if exists ( select F_Name , L_Name from Student where F_Name = @First_Name and L_Name = @Last_Name)
		begin
			declare @i int = 1 
			declare @Std_ID int
			Select @Std_ID = St_ID
			from Student
			where F_Name = @First_Name and L_Name = @Last_Name
			while @i <= 10 
			begin
				Update Std_Ques_Exam
				Set Std_Answer = (case @i 
					   when 1 then @ans1 
					   when 2 then @ans2
					   when 3 then @ans3
					   when 4 then @ans4
					   when 5 then @ans5
					   when 6 then @ans6
					   when 7 then @ans7
					   when 8 then @ans8
					   when 9 then @ans9
					   when 10 then @ans10
					   end)
					Where Exam_ID = @Exam_No and St_ID = @Std_ID
					set @i = @i + 1
			end
		select m.St_ID , F_Name , L_Name , Exam_ID , m.Quest_ID , Text ,Std_Answer 
		from  Student s inner join Std_Ques_Exam m 
		on s.St_ID = m.St_ID inner join Question q 
		on q.Question_ID = m.Quest_ID
		where F_Name = @First_Name and 
			  L_Name = @Last_Name  and
			  Exam_ID = @Exam_No
		end
end try
begin catch 
	select 'Invalid Data' ;
end catch
