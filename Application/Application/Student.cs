namespace Application
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Student")]
    public partial class Student
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Student()
        {
            Std_Course = new HashSet<Std_Course>();
            Std_Ques_Exam = new HashSet<Std_Ques_Exam>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int St_ID { get; set; }

        [Required]
        [StringLength(20)]
        public string F_Name { get; set; }

        [Required]
        [StringLength(20)]
        public string L_Name { get; set; }

        [Required]
        [StringLength(10)]
        public string Std_UserName { get; set; }

        [Required]
        [StringLength(10)]
        public string Std_Password { get; set; }

        public int? Dep_ID { get; set; }

        public virtual Department Department { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Std_Course> Std_Course { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Std_Ques_Exam> Std_Ques_Exam { get; set; }
    }
}
