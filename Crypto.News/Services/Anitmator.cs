// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-14-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-14-2018
// ***********************************************************************
// <copyright file="Anitmator.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************

using System;
using System.Linq;
using System.Threading.Tasks;

namespace Crypto.News
{
    /// <summary>
    /// Class Anitmator.
    /// </summary>
    public class Anitmator
    {
        /// <summary>
        /// Starts this instance.
        /// </summary>
        public static void Start()
        {
            int index = 1;
            char[] spinner = { '|','\\','-','/' };
           
            Task.Factory.StartNew(() =>
            {
                while (true)
                {
                    var mod = index++ % 4;
                    if (mod == 0) spinner = spinner.Reverse().ToArray();
                    
                    Console.Write("{0}\b", spinner[mod]);
                    System.Threading.Thread.Sleep(100);
                }
            });
        }
    }
}
