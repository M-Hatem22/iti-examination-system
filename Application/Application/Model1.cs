using System;
using System.ComponentModel.DataAnnotations.Schema;
using System.Data.Entity;
using System.Linq;

namespace Application
{
    public partial class Model1 : DbContext
    {
        public Model1()
            : base("name=ExSystemEntity")
        {
        }

        public virtual DbSet<Choice> Choices { get; set; }
        public virtual DbSet<Course> Courses { get; set; }
        public virtual DbSet<Department> Departments { get; set; }
        public virtual DbSet<Exam> Exams { get; set; }
        public virtual DbSet<Inst_Course> Inst_Course { get; set; }
        public virtual DbSet<Instructor> Instructors { get; set; }
        public virtual DbSet<Question> Questions { get; set; }
        public virtual DbSet<Std_Course> Std_Course { get; set; }
        public virtual DbSet<Std_Ques_Exam> Std_Ques_Exam { get; set; }
        public virtual DbSet<Student> Students { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<Topic> Topics { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Choice>()
                .Property(e => e.Choice_Text)
                .IsUnicode(false);

            modelBuilder.Entity<Course>()
                .Property(e => e.Course_Name)
                .IsFixedLength();

            modelBuilder.Entity<Course>()
                .HasMany(e => e.Inst_Course)
                .WithRequired(e => e.Course)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Course>()
                .HasMany(e => e.Std_Course)
                .WithRequired(e => e.Course)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Course>()
                .HasMany(e => e.Topics)
                .WithRequired(e => e.Course)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Department>()
                .Property(e => e.Dept_Name)
                .IsFixedLength();

            modelBuilder.Entity<Department>()
                .HasMany(e => e.Instructors)
                .WithRequired(e => e.Department)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Department>()
                .HasMany(e => e.Students)
                .WithOptional(e => e.Department)
                .HasForeignKey(e => e.Dep_ID);

            modelBuilder.Entity<Exam>()
                .HasMany(e => e.Std_Ques_Exam)
                .WithRequired(e => e.Exam)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Instructor>()
                .Property(e => e.Inst_Name)
                .IsUnicode(false);

            modelBuilder.Entity<Instructor>()
                .Property(e => e.Ins_UserName)
                .IsUnicode(false);

            modelBuilder.Entity<Instructor>()
                .Property(e => e.Ins_Password)
                .IsFixedLength();

            modelBuilder.Entity<Instructor>()
                .Property(e => e.Salary)
                .IsFixedLength();

            modelBuilder.Entity<Question>()
                .Property(e => e.Text)
                .IsUnicode(false);

            modelBuilder.Entity<Question>()
                .Property(e => e.Type)
                .IsFixedLength();

            modelBuilder.Entity<Question>()
                .Property(e => e.Model_Answer)
                .IsFixedLength();

            modelBuilder.Entity<Question>()
                .HasMany(e => e.Choices)
                .WithRequired(e => e.Question)
                .HasForeignKey(e => e.Ques_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Question>()
                .HasMany(e => e.Std_Ques_Exam)
                .WithRequired(e => e.Question)
                .HasForeignKey(e => e.Quest_ID)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Std_Ques_Exam>()
                .Property(e => e.Std_Answer)
                .IsFixedLength();

            modelBuilder.Entity<Student>()
                .Property(e => e.F_Name)
                .IsFixedLength();

            modelBuilder.Entity<Student>()
                .Property(e => e.L_Name)
                .IsFixedLength();

            modelBuilder.Entity<Student>()
                .Property(e => e.Std_UserName)
                .IsFixedLength();

            modelBuilder.Entity<Student>()
                .Property(e => e.Std_Password)
                .IsFixedLength();

            modelBuilder.Entity<Student>()
                .HasMany(e => e.Std_Course)
                .WithRequired(e => e.Student)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Student>()
                .HasMany(e => e.Std_Ques_Exam)
                .WithRequired(e => e.Student)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Topic>()
                .Property(e => e.Topic_Name)
                .IsFixedLength();
        }
    }
}
