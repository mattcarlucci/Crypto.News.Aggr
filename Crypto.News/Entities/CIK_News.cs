namespace Crypto.News
{
    using System;
    using System.Data.Entity;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Linq;
    public partial class CIK_News : DbContext, ICIK_Db
    {
        public CIK_News()
            : base("name=CIK_News")
        {
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Item> Items { get; set; }
        public virtual DbSet<ItemContent> ItemContents { get; set; }

        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Category>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<Category>()
                .HasMany(e => e.Items)
                .WithRequired(e => e.Category)
                .HasForeignKey(e => e.CategoryId)
                .WillCascadeOnDelete(false);

            modelBuilder.Entity<Item>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ItemContent>()
                .Property(e => e.SortDescription)
                .IsUnicode(false);

            modelBuilder.Entity<ItemContent>()
                .Property(e => e.Content)
                .IsUnicode(false);

            modelBuilder.Entity<ItemContent>()
                .Property(e => e.SmallImage)
                .IsUnicode(false);

            modelBuilder.Entity<ItemContent>()
                .Property(e => e.MediumImage)
                .IsUnicode(false);

            modelBuilder.Entity<ItemContent>()
                .Property(e => e.BigImage)
                .IsUnicode(false);

            modelBuilder.Entity<ItemContent>()
                .Property(e => e.CreatedBy)
                .IsUnicode(false);

            modelBuilder.Entity<ItemContent>()
                .HasMany(e => e.Items)
                .WithRequired(e => e.ItemContent)
                .WillCascadeOnDelete(false);
        }

        public override int SaveChanges()
        {
            return base.SaveChanges();
        }
    }
}
