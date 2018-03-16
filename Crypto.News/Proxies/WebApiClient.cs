// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-14-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-14-2018
// ***********************************************************************
// <copyright file="WebApiClient.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading.Tasks;
using System.Web;
using Unity;

namespace Crypto.News
{

    /// <summary>
    /// Class WebApiClient.
    /// </summary>
    /// <seealso cref="Crypto.News.WebApiEvents" />
    public class WebApiClient : WebApiEvents
    {
        /// <summary>
        /// The CFG
        /// </summary>
        CryptoConfig config;      
        /// <summary>
        /// Gets or sets the last time stamp.
        /// </summary>
        /// <value>The last time stamp.</value>
        private long LastTimeStamp { get; set; }
        /// <summary>
        /// The provider URL
        /// </summary>
        const string providerUrl = "https://min-api.cryptocompare.com/data/news/providers";
        /// <summary>
        /// The news URL
        /// </summary>
        const string newsUrl = "https://min-api.cryptocompare.com/data/news/?lang=EN";

        /// <summary>
        /// Gets or sets the story count.
        /// </summary>
        /// <value>The story count.</value>
        private int StoryCount { get; set; }

        /// <summary>
        /// The repo news
        /// </summary>
        NewsDbRepository repoNews;
        /// <summary>
        /// The repo mail
        /// </summary>
        EmailRepository repoMail;
        
        /// <summary>
        /// Initializes a new instance of the <see cref="WebApiClient"/> class.
        /// </summary>
        /// <param name="config">The configuration.</param>
        public WebApiClient(CryptoConfig config)
        {
            this.config = config;

            repoNews = new NewsDbRepository(config.GetDbInstance());
            repoMail = new EmailRepository(config.Email);
            Initialize();
        }

        /// <summary>
        /// Initializes this instance.
        /// </summary>
        private void Initialize()
        {
            if (LastTimeStamp == 0)
                SetLastTimeStamp();

            OnStart(this, new NewsEventArgs(LastTimeStamp.FromUnixTime()));
        }              

        /// <summary>
        /// Sets the last time stamp.
        /// </summary>
        private void SetLastTimeStamp()
        {
            if (config.SaveStories == false)
                LastTimeStamp = DateTime.Now.ToUniversalTime().ToUnixTime();

            LastTimeStamp = repoNews.GetLastContentDate().ToUniversalTime().ToUnixTime();            
        }

        /// <summary>
        /// Gets the providers.
        /// </summary>
        /// <param name="web">The web.</param>
        /// <returns>List&lt;Models.Provider&gt;.</returns>
        private List<Models.Provider> GetProviders(WebClient web)
        {
            var json = web.DownloadString(providerUrl);
            return JsonConvert.DeserializeObject<List<Crypto.News.Models.Provider>>(json);
        }
       
        /// <summary>
        /// Gets the stories.
        /// </summary>
        /// <param name="web">The web.</param>
        /// <returns>List&lt;Models.Publication&gt;.</returns>
        private List<Models.Publication> GetStories(WebClient web)
        {
            var json = web.DownloadString(newsUrl);
              var stories = JsonConvert.DeserializeObject<List<Crypto.News.Models.Publication>>(json).
                  Where(w=> int.Parse(w.publishedOn) > LastTimeStamp).ToList();

            //for debugging
            //stories = JsonConvert.DeserializeObject<List<Crypto.News.Models.Publication>>(json).Take(5).ToList();
            Parallel.ForEach(stories, story =>
            {
                using (WebClient cli = new WebClient())
                    story.UrlData = cli.DownloadString(story.Url);

                story.Title = story.Title.Ascii();
                story.Body = story.Body.Ascii();
                Console.WriteLine("{0}\t{1}", story.publishedOn.FromUnixTime().ToLocalTime(), story.Title);
            });           
            StoryCount += stories.Count();
            return stories;
        }
       
        /// <summary>
        /// Gets the latest news.
        /// </summary>
        public void GetLatestNews()
        {
            List<Models.Provider> providers;
            List<Models.Publication> news;

            using (WebClient web = new WebClient())
            {
                providers = GetProviders(web);
                news = GetStories(web);
            }     
            
            if (news.Count() == 0) return;
            LastTimeStamp = news.Max(m => int.Parse(m.publishedOn));                       
            SaveStories(providers, news);                      
            repoMail.EmailStories(Map.MapStoryView(news));
        }
       
        /// <summary>
        /// Saves the stories.
        /// </summary>
        /// <param name="providers">The providers.</param>
        /// <param name="news">The news.</param>
        private void SaveStories(List<Models.Provider> providers, List<Models.Publication> news)
        {
            if (config.SaveStories == true)
                repoNews.SaveStories(providers, news);    
            
            NewsEventArgs args = new NewsEventArgs(news, providers);
            OnNewsEvent(this, args);
            Console.Beep();
        }
        
    }
}
