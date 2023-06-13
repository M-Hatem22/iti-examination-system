-----------------------------------Exam Generation Procedure------------------------------------------
create Procedure ExamGeneration @Crs_Name nchar(10), @T_F_Q int, @MCQ_Q int
as
begin
	if (@T_F_Q + @MCQ_Q <> 10)
	begin
		select 'Questions Must be 10'
	end
	else
	begin try
		declare @Crs_ID int, @ExamID int
		--Getting Course ID from Course Name
		Select @Crs_ID = Course_ID
		from Course
		where Course_Name = @Crs_Name
		--Insert Record Fe El Exam
		Insert into Exam (Duartion, Taken_Date, Course_ID)
		values (2, GETDATE(), @Crs_ID)
		--Law 3amalna el exam id identity so ha3mel select lel exam id elly lesa 3amlalo insert da
		select @ExamID = SCOPE_IDENTITY();
		--Me7taga delwa2ty a3mel insert lel questions T/F----fe el table beta3 el ternanry
		Insert into Std_Ques_Exam(St_ID, Quest_ID, Exam_ID, Std_Answer)
		Select Top (@T_F_Q) S.St_ID, Question_ID, @ExamID, null
		from Question Q, Student S, Std_Course SC
		where S.St_ID = SC.St_ID and SC.Course_ID = Q.Course_ID and Q.Type = 'T/F' and Q.Course_ID = @Crs_ID
		order by NEWID();
		--Me7taga delwa2ty a3mel insert lel questions MCQ----fe el table beta3 el ternanry
		Insert into Std_Ques_Exam(St_ID, Quest_ID, Exam_ID, Std_Answer)
		Select Top (@MCQ_Q) S.St_ID, Question_ID, @ExamID, null
		from Question Q, Student S, Std_Course SC
		where S.St_ID = SC.St_ID and SC.Course_ID = Q.Course_ID and Q.Type = 'choice' and Q.Course_ID = @Crs_ID
		order by NEWID();
		--Delwa2ty Me7taga b2a a3mel generating lel Exam da-----Me7taga el Questions bel choices beta3eteha
		Select Q.Text as Question, C.Choice_Text
		from Question Q, Choice C, Std_Ques_Exam SQE
		where Q.Question_ID = C.Ques_ID and SQE.Quest_ID = Q.Question_ID and SQE.Exam_ID = @ExamID
	end try
	begin catch
		Select 'ERROR'
	end catch
end