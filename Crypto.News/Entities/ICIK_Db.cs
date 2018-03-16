using System.Data.Entity;

namespace Crypto.News
{
    public interface ICIK_Db
    {
        DbSet<Category> Categories { get; set; }
        DbSet<ItemContent> ItemContents { get; set; }
        DbSet<Item> Items { get; set; }

        int SaveChanges();
    }
}