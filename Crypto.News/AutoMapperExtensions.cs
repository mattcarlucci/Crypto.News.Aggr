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
using System.Collections.Generic;
namespace Crypto.News
{
    /// <summary>
    /// Class AutoMapperExtensions.
    /// </summary>
    public static class AutoMapperExtensions
    {
        /// <summary>
        /// Maps the list.
        /// </summary>
        /// <typeparam name="TSource">The type of the t source.</typeparam>
        /// <typeparam name="TDestination">The type of the t destination.</typeparam>
        /// <param name="mapper">The mapper.</param>
        /// <param name="source">The source.</param>
        /// <returns>List&lt;TDestination&gt;.</returns>
        public static List<TDestination> MapList<TSource, TDestination>(this IMapper mapper, List<TSource> source)
        {
            return mapper.Map<List<TDestination>>(source);
        }
    }
}
