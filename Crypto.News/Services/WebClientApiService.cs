// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-14-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-14-2018
// ***********************************************************************
// <copyright file="WebClientApiService.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************

using System;
using System.Threading.Tasks;
using Unity;

namespace Crypto.News
{
    /// <summary>
    /// Class WebClientApiService.
    /// </summary>
    public class WebClientApiService
    {
        /// <summary>
        /// Starts this instance.
        /// </summary>
        public static void Start()
        {
            var config = CryptoConfig.Load();
            Bootstrap.Interval = config.Interval;
            WebApiClient client = new WebApiClient(config);

            Task.Factory.StartNew(() =>
            {
                while (true)
                {
                    client.GetLatestNews();
                    Console.Title = ("Next Scan: " + DateTime.Now.AddMilliseconds(Bootstrap.Interval));
                    System.Threading.Thread.Sleep(Bootstrap.Interval);                                        
                }
            });
        }
    }
}
