namespace Crypto.News.Migrations
{
    using System;
    using System.Data.Entity;
  //  using System.Data.Entity.Core.Common;
    using System.Data.Entity.Migrations;
    using System.Linq;

    
    internal sealed class Configuration : DbMigrationsConfiguration<Crypto.News.CIK_News>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = true;
        }

        protected override void Seed(Crypto.News.CIK_News context)
        {
            //  This method will be called after migrating to the latest version.

            //  You can use the DbSet<T>.AddOrUpdate() helper extension method 
            //  to avoid creating duplicate seed data. E.g.
            //
            //    context.People.AddOrUpdate(
            //      p => p.FullName,
            //      new Person { FullName = "Andrew Peters" },
            //      new Person { FullName = "Brice Lambson" },
            //      new Person { FullName = "Rowan Miller" }
            //    );
            //
        }
    }
}
