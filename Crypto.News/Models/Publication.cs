// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-12-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-14-2018
// ***********************************************************************
// <copyright file="Publication.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Crypto.News.Models
{
    /// <summary>
    /// Class Publication.
    /// </summary>
    public class Publication
    {
        /// <summary>
        /// Gets or sets the published on.
        /// </summary>
        /// <value>The published on.</value>
        [JsonProperty("published_on")]
        public string publishedOn { get; set; }
        /// <summary>
        /// Gets or sets the identifier.
        /// </summary>
        /// <value>The identifier.</value>
        public string Id { get; set; }
        /// <summary>
        /// Gets or sets the unique identifier.
        /// </summary>
        /// <value>The unique identifier.</value>
        public string Guid { get; set; }
        /// <summary>
        /// Gets or sets the image URL.
        /// </summary>
        /// <value>The image URL.</value>
        public string ImageUrl { get; set; }
        /// <summary>
        /// Gets or sets the title.
        /// </summary>
        /// <value>The title.</value>
        public string Title { get; set; }
        /// <summary>
        /// Gets or sets the URL.
        /// </summary>
        /// <value>The URL.</value>
        public string Url { get; set; }

        /// <summary>
        /// Gets or sets the URL data.
        /// </summary>
        /// <value>The URL data.</value>
        public string UrlData { get; set; }
        /// <summary>
        /// Gets or sets the source.
        /// </summary>
        /// <value>The source.</value>
        public string Source { get; set; }
        /// <summary>
        /// Gets or sets the body.
        /// </summary>
        /// <value>The body.</value>
        public string Body { get; set; }
        /// <summary>
        /// Gets or sets the tags.
        /// </summary>
        /// <value>The tags.</value>
        public string Tags { get; set; }
        /// <summary>
        /// Gets or sets the categories.
        /// </summary>
        /// <value>The categories.</value>
        public string Categories { get; set; }
        /// <summary>
        /// Gets or sets the language.
        /// </summary>
        /// <value>The language.</value>
        [JsonProperty("lang")]
        public string Language { get; set; }
        /// <summary>
        /// Gets or sets the source information.
        /// </summary>
        /// <value>The source information.</value>
        [JsonProperty("source_info")]
        public virtual SourceInfo SourceInfo { get; set; }
        /// <summary>
        /// Initializes a new instance of the <see cref="Publication"/> class.
        /// </summary>
        public Publication()
        {
            SourceInfo = new SourceInfo();
        }

        /// <summary>
        /// Gets the story time.
        /// </summary>
        /// <returns>System.String.</returns>
        public string GetElapsedTime()
        {
            TimeSpan span = new TimeSpan(
                DateTime.Now.ToUniversalTime().Ticks - 
                publishedOn.FromUnixTime().Ticks);

            int elapse = (int)span.TotalHours == 0
                ? (int)span.TotalMinutes : (int)span.TotalHours;

            string sp = (int)span.TotalHours == 0 
                ? "minutes" : "hours";

            return string.Format("{0} {1} ago", elapse, sp);
        }
    }
}
