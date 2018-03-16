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
using System;
using System.Collections.Generic;
namespace Crypto.News
{
    /// <summary>
    /// Class AutoMapperConfig.
    /// </summary>
    public static class AutoMapperConfig
    {
        /// <summary>
        /// Registers the mappings.
        /// </summary>
        public static void RegisterMappings()
        {
            var anchor = "<a href=\"{0}/\"> Read More </a>";


            Mapper.Initialize(cfg => {
                cfg.CreateMap<Models.Publication, ItemContent>().
                ForMember(dst => dst.CreatedDate, opt => opt.MapFrom(src => src.publishedOn.FromUnixTime())).
                ForMember(dst => dst.Content, opt => opt.MapFrom(src => src.Body + string.Format(anchor, src.Url))).
                ForMember(dst => dst.CreatedBy, opt => opt.MapFrom(src => src.SourceInfo.Name)).
                ForMember(dst => dst.Title, opt => opt.MapFrom(src => src.Title)).
                ForMember(dst => dst.ModifiedDate, opt => opt.MapFrom(src => src.publishedOn.FromUnixTime())).
                ForMember(dst => dst.SortDescription, opt => opt.MapFrom(src => src.Body)).
                ForMember(dst => dst.SmallImage, opt => opt.MapFrom(src => src.ImageUrl)).
                ForMember(dst => dst.MediumImage, opt => opt.MapFrom(src => src.ImageUrl)).
                ForMember(dst => dst.BigImage, opt => opt.MapFrom(src => src.ImageUrl)).
                ForMember(dst => dst.NumOfView, opt => opt.MapFrom(src => 1)).
                ForMember(dst => dst.RawData, opt => opt.MapFrom(src => src.UrlData)).
                ForMember(dst => dst.Id, opt => opt.Ignore());

                cfg.CreateMap<Models.Provider, Category>().
                ForMember(dst => dst.Name, opt => opt.MapFrom(src => src.Name)).
                ForMember(dst => dst.CreatedDate, opt => opt.MapFrom(src => DateTime.Now.ToUniversalTime())).
                ForMember(dst => dst.CreatedBy, opt => opt.MapFrom(src => src.Name)).
                ForMember(dst => dst.ModifiedDate, opt => opt.MapFrom(src => DateTime.Now.ToUniversalTime()));

                cfg.CreateMap<Item, Item>().
                ForMember(dst => dst.CategoryId, opt => opt.MapFrom(src => src.Category.Id)).
                ForMember(dst => dst.ItemContentId, opt => opt.MapFrom(src => src.ItemContent.Id)).
                ForMember(dst => dst.CreatedBy, opt => opt.MapFrom(src => src.ItemContent.CreatedBy)).
                ForMember(dst => dst.CreatedDate, opt => opt.MapFrom(src => src.ItemContent.CreatedDate)).
                ForMember(dst => dst.ModifiedDate, opt => opt.MapFrom(src => src.ItemContent.ModifiedDate));

                cfg.CreateMap<Models.Publication, StoryViewModel>().
                ForMember(dst => dst.ImageUrl, opt => opt.MapFrom(src => src.SourceInfo.ImageUrl)).
                ForMember(dst => dst.Name, opt => opt.MapFrom(src => src.SourceInfo.Name)).
                ForMember(dst => dst.Elapsed, opt => opt.MapFrom(src => src.GetElapsedTime())).
                ForMember(dst => dst.Title, opt => opt.MapFrom(src => src.Title)).
                ForMember(dst => dst.Body, opt => opt.MapFrom(src => src.Body)).
                ForMember(dst => dst.Url, opt => opt.MapFrom(src => src.Url));
            });
        }
       
    }
}
