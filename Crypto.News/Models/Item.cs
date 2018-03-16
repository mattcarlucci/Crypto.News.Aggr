namespace Crypto.News.Models
{
    public class Item
    {
        public Category Category { get; set; }
        public ItemContent Content { get; set; }

        public Item(Category category, ItemContent content)
        {
            this.Category = category;
            this.Content = content;
        }
    }    
}
