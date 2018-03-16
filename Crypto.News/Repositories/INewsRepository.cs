using System;
using System.Collections.Generic;
using Crypto.News.Models;

namespace Crypto.News
{
    public interface INewsRepository
    {
        Category AddUpdateCategory(Category category);
        Item AddUpdateItem(Item item);
        ItemContent AddUpdateStory(Category category, ItemContent content);
        DateTime GetLastContentDate();
        void SaveStories(List<Provider> providers, List<Publication> news);
    }
}