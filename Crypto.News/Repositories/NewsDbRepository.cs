// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-14-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-14-2018
// ***********************************************************************
// <copyright file="NewsRepository.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Crypto.News.Models;
using Newtonsoft.Json;

namespace Crypto.News
{
  
   
    /// <summary>
    /// Class NewsRepository.
    /// </summary>
    public class NewsDbRepository : INewsRepository
    {
        ICIK_Db db;
        //TODO: Pass in Ioc for Datasources. 
        //CIK_Sql | CIK_Lite
        
        public NewsDbRepository(ICIK_Db db)
        {
            this.db = db;
        }
        /// <summary>
        /// Gets the last content date.
        /// </summary>
        /// <returns>DateTime.</returns>
        public DateTime GetLastContentDate()
        {           
            if (db.ItemContents.Count() == 0) return DateTime.Now.AddDays(-2);
            return db.ItemContents.Max(m => m.CreatedDate);            
        }
        
        /// <summary>
        /// Adds the update item.
        /// </summary>
        /// <param name="item">The item.</param>
        /// <returns>Item.</returns>

        public Item AddUpdateItem(Item item)
        {
            var _item = db.Items.SingleOrDefault(s =>
            s.CategoryId == item.CategoryId && s.ItemContentId == item.ItemContentId);

            if (_item != null) return _item;
            db.Items.Add(item);
            db.SaveChanges();
            return item;            
        }
        /// <summary>
        /// Adds the update category.
        /// </summary>
        /// <param name="category">The category.</param>
        /// <returns>Category.</returns>

        public Category AddUpdateCategory(Category category)
        {            
            var _category = db.Categories.SingleOrDefault(s => s.Name == category.Name);
            if (_category != null) return _category;

            db.Categories.Add(category);
            db.SaveChanges();
            return category;           
        }
        /// <summary>
        /// Adds the update story.
        /// </summary>
        /// <param name="category">The category.</param>
        /// <param name="content">The content.</param>
        /// <returns>ItemContent.</returns>
        public ItemContent AddUpdateStory(Category category, ItemContent content)
        {            
            var _content = db.ItemContents.SingleOrDefault(s =>
            s.Title == content.Title && s.CreatedBy == content.CreatedBy);

            if (_content != null) return _content;
            db.ItemContents.Add(content);
            db.SaveChanges();
            return content;            
        }

        /// <summary>
        /// Saves the stories.
        /// </summary>
        /// <param name="providers">The providers.</param>
        /// <param name="news">The news.</param>
        public void SaveStories(List<Models.Provider> providers, List<Models.Publication> news)
        {
            foreach (var provider in providers)
            {
                var category = AddUpdateCategory(Map.MapProvider(provider));
                foreach (var story in news.Where(w => w.SourceInfo.Name == provider.Name))
                {                       
                    var content = AddUpdateStory(category, Map.MapStory(story));
                    AddUpdateItem(Map.MapItem(category, content));
                }
            }                  
        }
    }
}