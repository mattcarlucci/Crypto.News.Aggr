// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-15-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-15-2018
// ***********************************************************************
// <copyright file="EmailConfig.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************


using Newtonsoft.Json;
using System;
using System.IO;
using Unity;

namespace Crypto.News
{
    /// <summary>
    /// Class CryptoConfig.
    /// </summary>
    public class CryptoConfig
    {
        /// <summary>
        /// Gets or sets the interval.
        /// </summary>
        /// <value>The interval.</value>
        public int Interval { get; set; } = 60 * 60 * 24;
        /// <summary>
        /// Gets or sets a value indicating whether [save stories].
        /// </summary>
        /// <value><c>true</c> if [save stories]; otherwise, <c>false</c>.</value>
        public bool SaveStories { get; set; } = false;
        /// <summary>
        /// Gets or sets the database.
        /// </summary>
        /// <value>The database.</value>
        public string Database { get; set; } = "Sqlite";
        /// <summary>
        /// Gets or sets the email.
        /// </summary>
        /// <value>The email.</value>
        public EmailConfig Email { get; set; }

        /// <summary>
        /// Initializes a new instance of the <see cref="CryptoConfig"/> class.
        /// </summary>
        public CryptoConfig()
        {
            
        }

        /// <summary>
        /// Loads this instance.
        /// </summary>
        /// <returns>CryptoConfig.</returns>
        public static CryptoConfig Load()
        {
            if (File.Exists(".\\crypto.config.json") == false) return null;

            var json = File.ReadAllText(".\\crypto.config.json");
            var config = JsonConvert.DeserializeObject<CryptoConfig>(json);
            return config;
        }
        /// <summary>
        /// Saves this instance.
        /// </summary>
        public void Save()
        {
            var config = JsonConvert.SerializeObject(this, Formatting.Indented);
            File.WriteAllText(".\\crypto.config.json", config);
        }

        /// <summary>
        /// Gets the database instance.
        /// </summary>
        /// <returns>ICIK_Db.</returns>
        public ICIK_Db GetDbInstance()
        {
            Console.WriteLine("Requesting Db Instance {0}", Database); 
            
            return (ICIK_Db)Bootstrap.Container.
             Resolve(Type.GetType(Database));
        }

    }
}
