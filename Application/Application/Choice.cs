namespace Application
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("Choice")]
    public partial class Choice
    {
        [Key]
        [Column(Order = 0)]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Ques_ID { get; set; }

        [Key]
        [Column(Order = 1)]
        [StringLength(100)]
        public string Choice_Text { get; set; }

        public virtual Question Question { get; set; }
    }
}
