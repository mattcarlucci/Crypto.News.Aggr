namespace Crypto.News.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class InitialCreate : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.Category",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Name = c.String(nullable: false, maxLength: 200),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(nullable: false, maxLength: 50, unicode: false),
                        ModifiedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id);
            
            CreateTable(
                "dbo.Item",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        CategoryId = c.Int(nullable: false),
                        ItemContentId = c.Int(nullable: false),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(nullable: false, maxLength: 50, unicode: false),
                        ModifiedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id)
                .ForeignKey("dbo.ItemContent", t => t.ItemContentId)
                .ForeignKey("dbo.Category", t => t.CategoryId)
                .Index(t => t.CategoryId)
                .Index(t => t.ItemContentId);
            
            CreateTable(
                "dbo.ItemContent",
                c => new
                    {
                        Id = c.Int(nullable: false, identity: true),
                        Title = c.String(nullable: false, maxLength: 500),
                        SortDescription = c.String(nullable: false, unicode: false, storeType: "text"),
                        Content = c.String(nullable: false, unicode: false, storeType: "text"),
                        RawData = c.String(unicode: false, storeType: "text"),
                        SmallImage = c.String(nullable: false, maxLength: 200, unicode: false),
                        MediumImage = c.String(nullable: false, maxLength: 200, unicode: false),
                        BigImage = c.String(nullable: false, maxLength: 200, unicode: false),
                        NumOfView = c.Long(),
                        CreatedDate = c.DateTime(nullable: false),
                        CreatedBy = c.String(nullable: false, maxLength: 50, unicode: false),
                        ModifiedDate = c.DateTime(),
                    })
                .PrimaryKey(t => t.Id);
            
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.Item", "CategoryId", "dbo.Category");
            DropForeignKey("dbo.Item", "ItemContentId", "dbo.ItemContent");
            DropIndex("dbo.Item", new[] { "ItemContentId" });
            DropIndex("dbo.Item", new[] { "CategoryId" });
            DropTable("dbo.ItemContent");
            DropTable("dbo.Item");
            DropTable("dbo.Category");
        }
    }
}
