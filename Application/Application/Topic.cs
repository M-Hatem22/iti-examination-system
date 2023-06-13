namespace Application
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    public partial class Topic
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.None)]
        public int Topic_ID { get; set; }

        [Required]
        [StringLength(10)]
        public string Topic_Name { get; set; }

        public int Course_ID { get; set; }

        public virtual Course Course { get; set; }
    }
}
