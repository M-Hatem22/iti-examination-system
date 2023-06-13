namespace Application
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Question")]
    public partial class Question
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Question()
        {
            Choices = new HashSet<Choice>();
            Std_Ques_Exam = new HashSet<Std_Ques_Exam>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Question_ID { get; set; }

        [StringLength(250)]
        public string Text { get; set; }

        [Required]
        [StringLength(10)]
        public string Type { get; set; }

        [Required]
        [StringLength(30)]
        public string Model_Answer { get; set; }

        public int Point { get; set; }

        public int? Course_ID { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Choice> Choices { get; set; }

        public virtual Course Course { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Std_Ques_Exam> Std_Ques_Exam { get; set; }
    }
}
