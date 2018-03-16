namespace Crypto.News
{
    using System.Data.Entity;
    using System.Data.SQLite;
    using System.Data.Entity.ModelConfiguration.Conventions;
    using System.Data.Entity.Infrastructure;

    public class CIK_Lite : DbContext, ICIK_Db
    {
        public CIK_Lite() :
            base(new SQLiteConnection()
            {
                ConnectionString = new 
                SQLiteConnectionStringBuilder() { DataSource = "News.db", ForeignKeys = true }.ConnectionString
            }, true)
        {

        }
        
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Conventions.Remove<PluralizingTableNameConvention>();
            //modelBuilder.Entity<Category>()
            //    .Property(e => e.CreatedBy)
            //    .IsUnicode(false);

            //modelBuilder.Entity<Category>()
            //    .HasMany(e => e.Items)
            //    .WithRequired(e => e.Category)
            //    .HasForeignKey(e => e.CategoryId)
            //    .WillCascadeOnDelete(false);

            //modelBuilder.Entity<Item>()
            //    .Property(e => e.CreatedBy)
            //    .IsUnicode(false);

            //modelBuilder.Entity<ItemContent>()
            //    .Property(e => e.SortDescription)
            //    .IsUnicode(false);

            //modelBuilder.Entity<ItemContent>()
            //    .Property(e => e.Content)
            //    .IsUnicode(false);

            //modelBuilder.Entity<ItemContent>()
            //    .Property(e => e.SmallImage)
            //    .IsUnicode(false);

            //modelBuilder.Entity<ItemContent>()
            //    .Property(e => e.MediumImage)
            //    .IsUnicode(false);

            //modelBuilder.Entity<ItemContent>()
            //    .Property(e => e.BigImage)
            //    .IsUnicode(false);

            //modelBuilder.Entity<ItemContent>()
            //    .Property(e => e.CreatedBy)
            //    .IsUnicode(false);

            //modelBuilder.Entity<ItemContent>()
            //    .HasMany(e => e.Items)
            //    .WithRequired(e => e.ItemContent)
            //    .WillCascadeOnDelete(false);
            base.OnModelCreating(modelBuilder);
        }

        public virtual DbSet<Category> Categories { get; set; }
        public virtual DbSet<Item> Items { get; set; }
        public virtual DbSet<ItemContent> ItemContents { get; set; }
    }
}
