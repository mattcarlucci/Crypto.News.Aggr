// ***********************************************************************
// Assembly         : Crypto.News
// Author           : mcarlucci
// Created          : 03-14-2018
//
// Last Modified By : mcarlucci
// Last Modified On : 03-14-2018
// ***********************************************************************
// <copyright file="EmailClient.cs" company="">
//     Copyright ©  2018
// </copyright>
// <summary></summary>
// ***********************************************************************
using System.Net;
using System.Net.Mail;
using System.Linq;
using System;

namespace Crypto.News
{

    /// <summary>
    /// Class EmailClient.
    /// </summary>
    public class EmailClient
    {
        /// <summary>
        /// The CFG
        /// </summary>
        EmailConfig cfg = null;

        /// <summary>
        /// The client
        /// </summary>
        SmtpClient client = null;

        /// <summary>
        /// Initializes a new instance of the <see cref="EmailClient"/> class.
        /// </summary>
        public EmailClient(EmailConfig cfg)
        {
            this.cfg = cfg;

            client = new SmtpClient(cfg.SmtpHost, cfg.SmtpPort)
            {
                Credentials = new NetworkCredential(cfg.UserName, cfg.Password),
                DeliveryMethod = SmtpDeliveryMethod.Network,
                EnableSsl = cfg.UseSsl
            };
        }

        /// <summary>
        /// Sends the mail.
        /// </summary>
        /// <param name="subject">The subject.</param>
        /// <param name="body">The body.</param>
        public void SendMail(string subject, string body)
        {
            if (cfg.EnableEmail == false || cfg.To.Count() == 0) return;

            MailMessage mail = new MailMessage
            {
                From = new MailAddress(cfg.From.Email, cfg.From.Description),
                SubjectEncoding = System.Text.Encoding.UTF8,
                IsBodyHtml = true,
                Subject = subject,
                Body = body
            };
           
            foreach (var user in cfg.To.Where(w => w.Active))
            {
                mail.To.Add(user.Email);               
            }
            foreach (var user in cfg.Cc.Where(w => w.Active))
            {
                mail.CC.Add(user.Email);
            }
            foreach (var user in cfg.Bcc.Where(w => w.Active))
            {
                mail.Bcc.Add(user.Email);
            }

            Console.WriteLine("Sending email...");
            client.Send(mail);
            Console.Write("Success");
        }
    }
}
