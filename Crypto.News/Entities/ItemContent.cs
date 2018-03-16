namespace Crypto.News
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
 //   using System.Data.Entity.Spatial;

    [Table("ItemContent")]
    public partial class ItemContent
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public ItemContent()
        {
            Items = new HashSet<Item>();
        }

        public int Id { get; set; }

        [Required]
        [StringLength(500)]
        public string Title { get; set; }
               
        [Required]
        public string SortDescription { get; set; }
      
        [Required]
        public string Content { get; set; }
       
        public string RawData { get; set; }

        [Required]
        [StringLength(200)]
        public string SmallImage { get; set; }

        [Required]
        [StringLength(200)]
        public string MediumImage { get; set; }

        [Required]
        [StringLength(200)]
        public string BigImage { get; set; }

        public long? NumOfView { get; set; }

        public DateTime CreatedDate { get; set; }

        [Required]
        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Item> Items { get; set; }
    }
}
