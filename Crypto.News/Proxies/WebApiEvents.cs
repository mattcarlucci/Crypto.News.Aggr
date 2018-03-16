using System;

namespace Crypto.News
{
    public class WebApiEvents
    {
        /// <summary>
        /// The news event
        /// </summary>
        public static EventHandler<NewsEventArgs> NewsEvent;

        /// <summary>
        /// The start
        /// </summary>
        public static EventHandler<NewsEventArgs> Start;

        /// <summary>
        /// Handles the <see cref="E:Start" /> event.
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="EventArgs"/> instance containing the event data.</param>
        protected virtual void OnStart(object sender, NewsEventArgs e)
        {
            if (Start != null)
                Start(sender, e);
        }

        /// <summary>
        /// Handles the <see cref="E:NewsEvent" /> event.
        /// </summary>
        /// <param name="sender">The sender.</param>
        /// <param name="e">The <see cref="NewsEventArgs"/> instance containing the event data.</param>
        protected virtual void OnNewsEvent(object sender, NewsEventArgs e)
        {
            if (NewsEvent != null)
                NewsEvent(sender, e);
        }

    }
}
