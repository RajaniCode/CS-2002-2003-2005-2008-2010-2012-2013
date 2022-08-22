//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3053
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

[assembly: global::System.Data.Objects.DataClasses.EdmSchemaAttribute()]
[assembly: global::System.Data.Objects.DataClasses.EdmRelationshipAttribute("QueryViewWithManyToMany", "Gold", "Clubs", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(QueryViewWithManyToMany.Club), "Members", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(QueryViewWithManyToMany.Member))]
[assembly: global::System.Data.Objects.DataClasses.EdmRelationshipAttribute("QueryViewWithManyToMany", "Platinium", "Clubs", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(QueryViewWithManyToMany.Club), "Members", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(QueryViewWithManyToMany.Member))]

// Original file name:
// Generation date: 10/14/2008 4:55:06 PM
namespace QueryViewWithManyToMany
{
    
    /// <summary>
    /// There are no comments for QueryViewMM in the schema.
    /// </summary>
    public partial class QueryViewMM : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new QueryViewMM object using the connection string found in the 'QueryViewMM' section of the application configuration file.
        /// </summary>
        public QueryViewMM() : 
                base("name=QueryViewMM", "QueryViewMM")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new QueryViewMM object.
        /// </summary>
        public QueryViewMM(string connectionString) : 
                base(connectionString, "QueryViewMM")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new QueryViewMM object.
        /// </summary>
        public QueryViewMM(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "QueryViewMM")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for Clubs in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Club> Clubs
        {
            get
            {
                if ((this._Clubs == null))
                {
                    this._Clubs = base.CreateQuery<Club>("[Clubs]");
                }
                return this._Clubs;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Club> _Clubs;
        /// <summary>
        /// There are no comments for Members in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Member> Members
        {
            get
            {
                if ((this._Members == null))
                {
                    this._Members = base.CreateQuery<Member>("[Members]");
                }
                return this._Members;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Member> _Members;
        /// <summary>
        /// There are no comments for Actors in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Actors> Actors
        {
            get
            {
                if ((this._Actors == null))
                {
                    this._Actors = base.CreateQuery<Actors>("[Actors]");
                }
                return this._Actors;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Actors> _Actors;
        /// <summary>
        /// There are no comments for Clubs in the schema.
        /// </summary>
        public void AddToClubs(Club club)
        {
            base.AddObject("Clubs", club);
        }
        /// <summary>
        /// There are no comments for Members in the schema.
        /// </summary>
        public void AddToMembers(Member member)
        {
            base.AddObject("Members", member);
        }
        /// <summary>
        /// There are no comments for Actors in the schema.
        /// </summary>
        public void AddToActors(Actors actors)
        {
            base.AddObject("Actors", actors);
        }
    }
    /// <summary>
    /// There are no comments for QueryViewWithManyToMany.Club in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ClubId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="QueryViewWithManyToMany", Name="Club")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Club : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Club object.
        /// </summary>
        /// <param name="clubId">Initial value of ClubId.</param>
        /// <param name="clubName">Initial value of ClubName.</param>
        public static Club CreateClub(int clubId, string clubName)
        {
            Club club = new Club();
            club.ClubId = clubId;
            club.ClubName = clubName;
            return club;
        }
        /// <summary>
        /// There are no comments for Property ClubId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int ClubId
        {
            get
            {
                return this._ClubId;
            }
            set
            {
                this.OnClubIdChanging(value);
                this.ReportPropertyChanging("ClubId");
                this._ClubId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("ClubId");
                this.OnClubIdChanged();
            }
        }
        private int _ClubId;
        partial void OnClubIdChanging(int value);
        partial void OnClubIdChanged();
        /// <summary>
        /// There are no comments for Property ClubName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string ClubName
        {
            get
            {
                return this._ClubName;
            }
            set
            {
                this.OnClubNameChanging(value);
                this.ReportPropertyChanging("ClubName");
                this._ClubName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("ClubName");
                this.OnClubNameChanged();
            }
        }
        private string _ClubName;
        partial void OnClubNameChanging(string value);
        partial void OnClubNameChanged();
        /// <summary>
        /// There are no comments for GoldMembers in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("QueryViewWithManyToMany", "Gold", "Members")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityCollection<Member> GoldMembers
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<Member>("QueryViewWithManyToMany.Gold", "Members");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedCollection<Member>("QueryViewWithManyToMany.Gold", "Members", value);
                }
            }
        }
        /// <summary>
        /// There are no comments for PlatiniumMembers in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("QueryViewWithManyToMany", "Platinium", "Members")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityCollection<Member> PlatiniumMembers
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<Member>("QueryViewWithManyToMany.Platinium", "Members");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedCollection<Member>("QueryViewWithManyToMany.Platinium", "Members", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for QueryViewWithManyToMany.Member in the schema.
    /// </summary>
    /// <KeyProperties>
    /// MemberId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="QueryViewWithManyToMany", Name="Member")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Member : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Member object.
        /// </summary>
        /// <param name="memberId">Initial value of MemberId.</param>
        /// <param name="name">Initial value of Name.</param>
        public static Member CreateMember(int memberId, string name)
        {
            Member member = new Member();
            member.MemberId = memberId;
            member.Name = name;
            return member;
        }
        /// <summary>
        /// There are no comments for Property MemberId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int MemberId
        {
            get
            {
                return this._MemberId;
            }
            set
            {
                this.OnMemberIdChanging(value);
                this.ReportPropertyChanging("MemberId");
                this._MemberId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("MemberId");
                this.OnMemberIdChanged();
            }
        }
        private int _MemberId;
        partial void OnMemberIdChanging(int value);
        partial void OnMemberIdChanged();
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
        /// There are no comments for GoldClubs in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("QueryViewWithManyToMany", "Gold", "Clubs")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityCollection<Club> GoldClubs
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<Club>("QueryViewWithManyToMany.Gold", "Clubs");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedCollection<Club>("QueryViewWithManyToMany.Gold", "Clubs", value);
                }
            }
        }
        /// <summary>
        /// There are no comments for PlatiniumClubs in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("QueryViewWithManyToMany", "Platinium", "Clubs")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityCollection<Club> PlatiniumClubs
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<Club>("QueryViewWithManyToMany.Platinium", "Clubs");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedCollection<Club>("QueryViewWithManyToMany.Platinium", "Clubs", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for QueryViewWithManyToMany.Actors in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ActorId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="QueryViewWithManyToMany", Name="Actors")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Actors : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Actors object.
        /// </summary>
        /// <param name="actorId">Initial value of ActorId.</param>
        /// <param name="name">Initial value of Name.</param>
        public static Actors CreateActors(int actorId, string name)
        {
            Actors actors = new Actors();
            actors.ActorId = actorId;
            actors.Name = name;
            return actors;
        }
        /// <summary>
        /// There are no comments for Property ActorId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int ActorId
        {
            get
            {
                return this._ActorId;
            }
            set
            {
                this.OnActorIdChanging(value);
                this.ReportPropertyChanging("ActorId");
                this._ActorId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("ActorId");
                this.OnActorIdChanged();
            }
        }
        private int _ActorId;
        partial void OnActorIdChanging(int value);
        partial void OnActorIdChanged();
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
    }
}
