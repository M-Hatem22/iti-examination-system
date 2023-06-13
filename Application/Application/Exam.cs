namespace Application
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Exam")]
    public partial class Exam
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Exam()
        {
            Std_Ques_Exam = new HashSet<Std_Ques_Exam>();
        }

        [Column(TypeName = "date")]
        public DateTime? Taken_Date { get; set; }

        public int? Course_ID { get; set; }

        [Key]
        public int Exam_ID { get; set; }

        public int? Duration { get; set; }

        public virtual Course Course { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Std_Ques_Exam> Std_Ques_Exam { get; set; }
    }
}
