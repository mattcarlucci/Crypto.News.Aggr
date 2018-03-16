// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-14-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-15-2018
// ***********************************************************************
// <copyright file="EmailRepository.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************

using System.Collections.Generic;
using System.Net.Mail;
using System.Linq;

namespace Crypto.News
{

    /// <summary>
    /// Class EmailRepository.
    /// </summary>
    public class EmailRepository
    {
        /// <summary>
        /// The email
        /// </summary>
        private EmailConfig email;

        /// <summary>
        /// Initializes a new instance of the <see cref="EmailRepository"/> class.
        /// </summary>
        /// <param name="email">The email.</param>
        public EmailRepository(EmailConfig email)
        {
            this.email = email;
        }

        /// <summary>
        /// Emails the stories.
        /// </summary>
        /// <param name="stories">The stories.</param>
        public void EmailStories(ViewModels.StoryViewModels stories)
        {
            EmailClient client = new EmailClient(email);
            client.SendMail("Crypto News Alert", stories.MailMessage());
        }
    }
       
}
