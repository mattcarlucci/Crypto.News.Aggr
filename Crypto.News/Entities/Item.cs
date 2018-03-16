namespace Crypto.News
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
   // using System.Data.Entity.Spatial;

    [Table("Item")]
    public partial class Item
    {
        public int Id { get; set; }

        public int CategoryId { get; set; }

        public int ItemContentId { get; set; }

        public DateTime CreatedDate { get; set; }

        [Required]
        [StringLength(50)]
        public string CreatedBy { get; set; }

        public DateTime? ModifiedDate { get; set; }

        public virtual Category Category { get; set; }

        public virtual ItemContent ItemContent { get; set; }
        public Item()
        {

        }
        
        /// <summary>
        /// Compares the specified item.
        /// </summary>
        /// <param name="item">The item.</param>
        /// <returns><c>true</c> if XXXX, <c>false</c> otherwise.</returns>
        public bool Compare(Item item)
        {
            return this.CategoryId == item.CategoryId && this.ItemContentId == item.ItemContentId;
        }
        /// <summary>
        /// Initializes a new instance of the <see cref="Item"/> class.
        /// </summary>
        /// <param name="category">The category.</param>
        /// <param name="content">The content.</param>
        public Item(Category category, ItemContent content)
        {
            this.Category = category;
            this.ItemContent = content;
        }

        /// <summary>
        /// Resets this instance.
        /// </summary>
        public Item Reset()
        {
            this.Category = null;
            this.ItemContent = null;
            return this;
        }
    }
}
