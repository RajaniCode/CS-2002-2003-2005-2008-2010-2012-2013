﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3053
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::System.Data.Objects.DataClasses.EdmSchemaAttribute()]
[assembly: global::System.Data.Objects.DataClasses.EdmRelationshipAttribute("DelayLoadingModel", "ArticleArticleDetail", "Article", global::System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(NorthWind.Business.EF.Miscellaneos.Article), "ArticleDetail", global::System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(NorthWind.Business.EF.Miscellaneos.ArticleDetail))]

// Original file name:
// Generation date: 11/14/2008 2:41:15 PM
namespace NorthWind.Business.EF.Miscellaneos
{
    
    /// <summary>
    /// There are no comments for DelayLoadingEntities in the schema.
    /// </summary>
    public partial class DelayLoadingEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new DelayLoadingEntities object using the connection string found in the 'DelayLoadingEntities' section of the application configuration file.
        /// </summary>
        public DelayLoadingEntities() : 
                base("name=DelayLoadingEntities", "DelayLoadingEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new DelayLoadingEntities object.
        /// </summary>
        public DelayLoadingEntities(string connectionString) : 
                base(connectionString, "DelayLoadingEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new DelayLoadingEntities object.
        /// </summary>
        public DelayLoadingEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "DelayLoadingEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for Articles in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Article> Articles
        {
            get
            {
                if ((this._Articles == null))
                {
                    this._Articles = base.CreateQuery<Article>("[Articles]");
                }
                return this._Articles;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Article> _Articles;
        /// <summary>
        /// There are no comments for ArticleDetails in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<ArticleDetail> ArticleDetails
        {
            get
            {
                if ((this._ArticleDetails == null))
                {
                    this._ArticleDetails = base.CreateQuery<ArticleDetail>("[ArticleDetails]");
                }
                return this._ArticleDetails;
            }
        }
        private global::System.Data.Objects.ObjectQuery<ArticleDetail> _ArticleDetails;
        /// <summary>
        /// There are no comments for Articles in the schema.
        /// </summary>
        public void AddToArticles(Article article)
        {
            base.AddObject("Articles", article);
        }
        /// <summary>
        /// There are no comments for ArticleDetails in the schema.
        /// </summary>
        public void AddToArticleDetails(ArticleDetail articleDetail)
        {
            base.AddObject("ArticleDetails", articleDetail);
        }
    }
    /// <summary>
    /// There are no comments for DelayLoadingModel.Article in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ArticleId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="DelayLoadingModel", Name="Article")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Article : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Article object.
        /// </summary>
        /// <param name="articleId">Initial value of ArticleId.</param>
        /// <param name="title">Initial value of Title.</param>
        /// <param name="publishedDate">Initial value of PublishedDate.</param>
        public static Article CreateArticle(int articleId, string title, global::System.DateTime publishedDate)
        {
            Article article = new Article();
            article.ArticleId = articleId;
            article.Title = title;
            article.PublishedDate = publishedDate;
            return article;
        }
        /// <summary>
        /// There are no comments for Property ArticleId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int ArticleId
        {
            get
            {
                return this._ArticleId;
            }
            set
            {
                this.OnArticleIdChanging(value);
                this.ReportPropertyChanging("ArticleId");
                this._ArticleId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("ArticleId");
                this.OnArticleIdChanged();
            }
        }
        private int _ArticleId;
        partial void OnArticleIdChanging(int value);
        partial void OnArticleIdChanged();
        /// <summary>
        /// There are no comments for Property Title in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Title
        {
            get
            {
                return this._Title;
            }
            set
            {
                this.OnTitleChanging(value);
                this.ReportPropertyChanging("Title");
                this._Title = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Title");
                this.OnTitleChanged();
            }
        }
        private string _Title;
        partial void OnTitleChanging(string value);
        partial void OnTitleChanged();
        /// <summary>
        /// There are no comments for Property PublishedDate in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.DateTime PublishedDate
        {
            get
            {
                return this._PublishedDate;
            }
            set
            {
                this.OnPublishedDateChanging(value);
                this.ReportPropertyChanging("PublishedDate");
                this._PublishedDate = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("PublishedDate");
                this.OnPublishedDateChanged();
            }
        }
        private global::System.DateTime _PublishedDate;
        partial void OnPublishedDateChanging(global::System.DateTime value);
        partial void OnPublishedDateChanged();
        /// <summary>
        /// There are no comments for ArticleDetail in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("DelayLoadingModel", "ArticleArticleDetail", "ArticleDetail")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public ArticleDetail ArticleDetail
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<ArticleDetail>("DelayLoadingModel.ArticleArticleDetail", "ArticleDetail").Value;
            }
            set
            {
                ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<ArticleDetail>("DelayLoadingModel.ArticleArticleDetail", "ArticleDetail").Value = value;
            }
        }
        /// <summary>
        /// There are no comments for ArticleDetail in the schema.
        /// </summary>
        [global::System.ComponentModel.BrowsableAttribute(false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityReference<ArticleDetail> ArticleDetailReference
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<ArticleDetail>("DelayLoadingModel.ArticleArticleDetail", "ArticleDetail");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedReference<ArticleDetail>("DelayLoadingModel.ArticleArticleDetail", "ArticleDetail", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for DelayLoadingModel.ArticleDetail in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ArticleId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="DelayLoadingModel", Name="ArticleDetail")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class ArticleDetail : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new ArticleDetail object.
        /// </summary>
        /// <param name="articleId">Initial value of ArticleId.</param>
        /// <param name="authorInfo">Initial value of AuthorInfo.</param>
        /// <param name="summary">Initial value of Summary.</param>
        /// <param name="content">Initial value of Content.</param>
        public static ArticleDetail CreateArticleDetail(int articleId, string authorInfo, string summary, string content)
        {
            ArticleDetail articleDetail = new ArticleDetail();
            articleDetail.ArticleId = articleId;
            articleDetail.AuthorInfo = authorInfo;
            articleDetail.Summary = summary;
            articleDetail.Content = content;
            return articleDetail;
        }
        /// <summary>
        /// There are no comments for Property ArticleId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int ArticleId
        {
            get
            {
                return this._ArticleId;
            }
            set
            {
                this.OnArticleIdChanging(value);
                this.ReportPropertyChanging("ArticleId");
                this._ArticleId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("ArticleId");
                this.OnArticleIdChanged();
            }
        }
        private int _ArticleId;
        partial void OnArticleIdChanging(int value);
        partial void OnArticleIdChanged();
        /// <summary>
        /// There are no comments for Property AuthorInfo in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string AuthorInfo
        {
            get
            {
                return this._AuthorInfo;
            }
            set
            {
                this.OnAuthorInfoChanging(value);
                this.ReportPropertyChanging("AuthorInfo");
                this._AuthorInfo = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("AuthorInfo");
                this.OnAuthorInfoChanged();
            }
        }
        private string _AuthorInfo;
        partial void OnAuthorInfoChanging(string value);
        partial void OnAuthorInfoChanged();
        /// <summary>
        /// There are no comments for Property Summary in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Summary
        {
            get
            {
                return this._Summary;
            }
            set
            {
                this.OnSummaryChanging(value);
                this.ReportPropertyChanging("Summary");
                this._Summary = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Summary");
                this.OnSummaryChanged();
            }
        }
        private string _Summary;
        partial void OnSummaryChanging(string value);
        partial void OnSummaryChanged();
        /// <summary>
        /// There are no comments for Property Content in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Content
        {
            get
            {
                return this._Content;
            }
            set
            {
                this.OnContentChanging(value);
                this.ReportPropertyChanging("Content");
                this._Content = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Content");
                this.OnContentChanged();
            }
        }
        private string _Content;
        partial void OnContentChanging(string value);
        partial void OnContentChanged();
        /// <summary>
        /// There are no comments for Article in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("DelayLoadingModel", "ArticleArticleDetail", "Article")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public Article Article
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Article>("DelayLoadingModel.ArticleArticleDetail", "Article").Value;
            }
            set
            {
                ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Article>("DelayLoadingModel.ArticleArticleDetail", "Article").Value = value;
            }
        }
        /// <summary>
        /// There are no comments for Article in the schema.
        /// </summary>
        [global::System.ComponentModel.BrowsableAttribute(false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityReference<Article> ArticleReference
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Article>("DelayLoadingModel.ArticleArticleDetail", "Article");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedReference<Article>("DelayLoadingModel.ArticleArticleDetail", "Article", value);
                }
            }
        }
    }
}