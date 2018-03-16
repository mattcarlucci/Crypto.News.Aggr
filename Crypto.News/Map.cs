// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-13-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-13-2018
// ***********************************************************************
// <copyright file="Bootstrap.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************
using AutoMapper;
using Crypto.News.Models;
using Crypto.News.ViewModels;
using System.Collections.Generic;
namespace Crypto.News
{
    public static class Map
    {
        /// <summary>
        /// Maps the story view.
        /// </summary>
        /// <param name="publication">The publication.</param>
        /// <returns>StoryViewModel.</returns>
        public static StoryViewModel MapStoryView(Models.Publication publication)
        {
            return AutoMapper.Mapper.Map<ViewModels.StoryViewModel>(publication);
        }

        /// <summary>
        /// Maps the story view.
        /// </summary>
        /// <param name="publications">The publications.</param>
        /// <returns>List&lt;StoryViewModel&gt;.</returns>
        public static StoryViewModels MapStoryView(List<Models.Publication> publications)
        {
            IMapper mapper = AutoMapper.Mapper.Instance;
            var stories = mapper.Map<List<ViewModels.StoryViewModel>>(publications);

            StoryViewModels model = new StoryViewModels(stories);
            return model;
        }
        /// <summary>
        /// Maps the stories.
        /// </summary>
        /// <param name="stories">The stories.</param>
        /// <returns>List&lt;ItemContent&gt;.</returns>
        public static List<ItemContent> MapStories(List<Models.Publication> stories)
        {
            IMapper mapper = AutoMapper.Mapper.Instance;
            return mapper.Map<List<ItemContent>>(stories);
        }
        /// <summary>
        /// Maps the story.
        /// </summary>
        /// <param name="story">The story.</param>
        /// <returns>ItemContent.</returns>
        public static ItemContent MapStory(Models.Publication story)
        {
            return AutoMapper.Mapper.Map<ItemContent>(story);
        }

        /// <summary>
        /// Maps the provider.
        /// </summary>
        /// <param name="provider">The provider.</param>
        public static Category MapProvider(Provider provider)
        {
            return AutoMapper.Mapper.Map<Category>(provider);
        }

        /// <summary>
        /// Maps the providers.
        /// </summary>
        /// <param name="providers">The providers.</param>
        /// <returns>List&lt;Category&gt;.</returns>
        public static List<Category> MapProviders(List<Models.Provider> providers)
        {
            IMapper mapper = AutoMapper.Mapper.Instance;
            return mapper.Map<List<Category>>(providers);
        }

        /// <summary>
        /// Maps the item.
        /// </summary>
        /// <param name="category">The category.</param>
        /// <param name="content">The content.</param>
        /// <returns>Item.</returns>
        public static Item MapItem(Category category, ItemContent content)
        {
            var item = new Item(category, content);
            return AutoMapper.Mapper.Map<Item>(item).Reset();
        }
    }
}
