// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-13-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-13-2018
// ***********************************************************************
// <copyright file="Program.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Text;
using System.Threading.Tasks;

namespace Crypto.News
{
    /// <summary>
    /// Class Program.
    /// </summary>
    class Program
    {
        /// <summary>
        /// Defines the entry point of the application.
        /// </summary>
        /// <param name="args">The arguments.</param>
        static void Main(string[] args)
        {           
            Bootstrap.InitializeMappings();

            WebApiEvents.Start += (o, e) =>
            {
                Console.WriteLine("Last Story reported on {0}", e.LastStoryStamp.ToLocalTime());
            };

            WebApiEvents.NewsEvent += (o, s) =>
            {                
                var current =  s.Stories.
                    OrderByDescending(order => order.publishedOn.
                        FromUnixTime()).First();

                Console.Title = string.Format("Last Story: {0}. TotalStories: {1}.  Duration: {2}", 
                    current.publishedOn.FromUnixTime().ToLocalTime(),
                        s.Stories.Count(), Bootstrap.Duration);                
            };

            Anitmator.Start();
            WebClientApiService.Start();            
            Console.ReadLine();
        }
    }
}
