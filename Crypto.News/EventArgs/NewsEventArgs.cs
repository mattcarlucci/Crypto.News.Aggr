// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-13-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-13-2018
// ***********************************************************************
// <copyright file="NewsEventArgs.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************
using System;
using System.Collections.Generic;

namespace Crypto.News
{
    /// <summary>
    /// Class NewsEventArgs.
    /// </summary>
    /// <seealso cref="System.EventArgs" />
    public class NewsEventArgs : EventArgs
    {
        /// <summary>
        /// Gets or sets the providers.
        /// </summary>
        /// <value>The providers.</value>
        public List<Models.Provider> Providers { get; set; }
        /// <summary>
        /// Gets or sets the stories.
        /// </summary>
        /// <value>The stories.</value>
        public List<Models.Publication> Stories { get; set; }

        /// <summary>
        /// Gets or sets the last story stamp.
        /// </summary>
        /// <value>The last story stamp.</value>
        public DateTime LastStoryStamp { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="NewsEventArgs"/> class.
        /// </summary>
        /// <param name="stories">The stories.</param>
        /// <param name="providers">The providers.</param>
        public NewsEventArgs(List<Models.Publication> stories,List<Models.Provider> providers)
        {
            this.Stories = stories;
            this.Providers = providers;
        }
        /// <summary>
        /// Initializes a new instance of the <see cref="NewsEventArgs"/> class.
        /// </summary>
        /// <param name="lastStoryStamp">The last story stamp.</param>
        public NewsEventArgs(DateTime lastStoryStamp)
        {
            this.LastStoryStamp = lastStoryStamp;
        }
    }
}