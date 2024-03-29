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

// Original file name:
// Generation date: 4/6/2009 9:18:35 AM
namespace UnleashedBlog.Models.EntityFramework
{
    
    /// <summary>
    /// There are no comments for BlogDBEntities in the schema.
    /// </summary>
    public partial class BlogDBEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new BlogDBEntities object using the connection string found in the 'BlogDBEntities' section of the application configuration file.
        /// </summary>
        public BlogDBEntities() : 
                base("name=BlogDBEntities", "BlogDBEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new BlogDBEntities object.
        /// </summary>
        public BlogDBEntities(string connectionString) : 
                base(connectionString, "BlogDBEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new BlogDBEntities object.
        /// </summary>
        public BlogDBEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "BlogDBEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for BlogEntryEntitySet in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<BlogEntryEntity> BlogEntryEntitySet
        {
            get
            {
                if ((this._BlogEntryEntitySet == null))
                {
                    this._BlogEntryEntitySet = base.CreateQuery<BlogEntryEntity>("[BlogEntryEntitySet]");
                }
                return this._BlogEntryEntitySet;
            }
        }
        private global::System.Data.Objects.ObjectQuery<BlogEntryEntity> _BlogEntryEntitySet;
        /// <summary>
        /// There are no comments for BlogEntryEntitySet in the schema.
        /// </summary>
        public void AddToBlogEntryEntitySet(BlogEntryEntity blogEntryEntity)
        {
            base.AddObject("BlogEntryEntitySet", blogEntryEntity);
        }
    }
    /// <summary>
    /// There are no comments for UnleashedBlog.Models.EntityFramework.BlogEntryEntity in the schema.
    /// </summary>
    /// <KeyProperties>
    /// Id
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="UnleashedBlog.Models.EntityFramework", Name="BlogEntryEntity")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class BlogEntryEntity : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new BlogEntryEntity object.
        /// </summary>
        /// <param name="id">Initial value of Id.</param>
        /// <param name="name">Initial value of Name.</param>
        /// <param name="author">Initial value of Author.</param>
        /// <param name="datePublished">Initial value of DatePublished.</param>
        /// <param name="title">Initial value of Title.</param>
        /// <param name="text">Initial value of Text.</param>
        public static BlogEntryEntity CreateBlogEntryEntity(int id, string name, string author, global::System.DateTime datePublished, string title, string text)
        {
            BlogEntryEntity blogEntryEntity = new BlogEntryEntity();
            blogEntryEntity.Id = id;
            blogEntryEntity.Name = name;
            blogEntryEntity.Author = author;
            blogEntryEntity.DatePublished = datePublished;
            blogEntryEntity.Title = title;
            blogEntryEntity.Text = text;
            return blogEntryEntity;
        }
        /// <summary>
        /// There are no comments for Property Id in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int Id
        {
            get
            {
                return this._Id;
            }
            set
            {
                this.OnIdChanging(value);
                this.ReportPropertyChanging("Id");
                this._Id = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("Id");
                this.OnIdChanged();
            }
        }
        private int _Id;
        partial void OnIdChanging(int value);
        partial void OnIdChanged();
        /// <summary>
        /// There are no comments for Property Name in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Name
        {
            get
            {
                return this._Name;
            }
            set
            {
                this.OnNameChanging(value);
                this.ReportPropertyChanging("Name");
                this._Name = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Name");
                this.OnNameChanged();
            }
        }
        private string _Name;
        partial void OnNameChanging(string value);
        partial void OnNameChanged();
        /// <summary>
        /// There are no comments for Property Author in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Author
        {
            get
            {
                return this._Author;
            }
            set
            {
                this.OnAuthorChanging(value);
                this.ReportPropertyChanging("Author");
                this._Author = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Author");
                this.OnAuthorChanged();
            }
        }
        private string _Author;
        partial void OnAuthorChanging(string value);
        partial void OnAuthorChanged();
        /// <summary>
        /// There are no comments for Property DatePublished in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.DateTime DatePublished
        {
            get
            {
                return this._DatePublished;
            }
            set
            {
                this.OnDatePublishedChanging(value);
                this.ReportPropertyChanging("DatePublished");
                this._DatePublished = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("DatePublished");
                this.OnDatePublishedChanged();
            }
        }
        private global::System.DateTime _DatePublished;
        partial void OnDatePublishedChanging(global::System.DateTime value);
        partial void OnDatePublishedChanged();
        /// <summary>
        /// There are no comments for Property DateModified in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Nullable<global::System.DateTime> DateModified
        {
            get
            {
                return this._DateModified;
            }
            set
            {
                this.OnDateModifiedChanging(value);
                this.ReportPropertyChanging("DateModified");
                this._DateModified = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("DateModified");
                this.OnDateModifiedChanged();
            }
        }
        private global::System.Nullable<global::System.DateTime> _DateModified;
        partial void OnDateModifiedChanging(global::System.Nullable<global::System.DateTime> value);
        partial void OnDateModifiedChanged();
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
        /// There are no comments for Property Description in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Description
        {
            get
            {
                return this._Description;
            }
            set
            {
                this.OnDescriptionChanging(value);
                this.ReportPropertyChanging("Description");
                this._Description = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, true);
                this.ReportPropertyChanged("Description");
                this.OnDescriptionChanged();
            }
        }
        private string _Description;
        partial void OnDescriptionChanging(string value);
        partial void OnDescriptionChanged();
        /// <summary>
        /// There are no comments for Property Text in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Text
        {
            get
            {
                return this._Text;
            }
            set
            {
                this.OnTextChanging(value);
                this.ReportPropertyChanging("Text");
                this._Text = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Text");
                this.OnTextChanged();
            }
        }
        private string _Text;
        partial void OnTextChanging(string value);
        partial void OnTextChanged();
    }
}
