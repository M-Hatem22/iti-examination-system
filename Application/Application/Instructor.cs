namespace Application
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Instructor")]
    public partial class Instructor
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Instructor_ID { get; set; }

        [StringLength(50)]
        public string Inst_Name { get; set; }

        [StringLength(50)]
        public string Ins_UserName { get; set; }

        [Required]
        [StringLength(10)]
        public string Ins_Password { get; set; }

        [Required]
        [StringLength(10)]
        public string Salary { get; set; }

        public int Dept_ID { get; set; }

        public virtual Department Department { get; set; }
    }
}
