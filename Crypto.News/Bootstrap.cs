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
using System;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Unity;

namespace Crypto.News
{

    /// <summary>
    /// Class Bootstrap.
    /// </summary>
    public class Bootstrap
    {
        public static readonly IUnityContainer Container = new UnityContainer();

        /// <summary>
        /// The interval
        /// </summary>
        public static int Interval = 1000 * 60 * 60 * 6;
        public static DateTime StartTime = DateTime.Now;
        public static DateTime LastScan = DateTime.Now;
        public static TimeSpan Duration
        {
            get
            {
                return new TimeSpan(DateTime.Now.Ticks - StartTime.Ticks);
            }
        }

        /// <summary>
        /// Initializes the mappings.
        /// </summary>
        public static void InitializeMappings()
        {
            AutoMapperConfig.RegisterMappings();

            Container.RegisterType<ICIK_Db, CIK_Lite>();
            Container.RegisterType<ICIK_Db, CIK_News>();           
        }
       
    }
}
