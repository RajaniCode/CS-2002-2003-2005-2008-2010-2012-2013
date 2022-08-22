﻿//------------------------------------------------------------------------------
// <auto-generated>
//    This code was generated from a template.
//
//    Manual changes to this file may cause unexpected behavior in your application.
//    Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Data.Objects;
using System.Data.Objects.DataClasses;
using System.Data.EntityClient;
using System.ComponentModel;
using System.Xml.Serialization;
using System.Runtime.Serialization;

[assembly: EdmSchemaAttribute()]
#region EDM Relationship Metadata

[assembly: EdmRelationshipAttribute("ZombiePediaModel", "FK_ZombieSighting_ZombieType", "ZombieType", System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(DynamicDataDemo.ZombieType), "ZombieSighting", System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(DynamicDataDemo.ZombieSighting), true)]

#endregion

namespace DynamicDataDemo
{
    #region Contexts
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    public partial class Entities : ObjectContext
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new Entities object using the connection string found in the 'Entities' section of the application configuration file.
        /// </summary>
        public Entities() : base("name=Entities", "Entities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new Entities object.
        /// </summary>
        public Entities(string connectionString) : base(connectionString, "Entities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new Entities object.
        /// </summary>
        public Entities(EntityConnection connection) : base(connection, "Entities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        #endregion
    
        #region Partial Methods
    
        partial void OnContextCreated();
    
        #endregion
    
        #region ObjectSet Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<ZombieSighting> ZombieSightings
        {
            get
            {
                if ((_ZombieSightings == null))
                {
                    _ZombieSightings = base.CreateObjectSet<ZombieSighting>("ZombieSightings");
                }
                return _ZombieSightings;
            }
        }
        private ObjectSet<ZombieSighting> _ZombieSightings;
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        public ObjectSet<ZombieType> ZombieTypes
        {
            get
            {
                if ((_ZombieTypes == null))
                {
                    _ZombieTypes = base.CreateObjectSet<ZombieType>("ZombieTypes");
                }
                return _ZombieTypes;
            }
        }
        private ObjectSet<ZombieType> _ZombieTypes;

        #endregion
        #region AddTo Methods
    
        /// <summary>
        /// Deprecated Method for adding a new object to the ZombieSightings EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToZombieSightings(ZombieSighting zombieSighting)
        {
            base.AddObject("ZombieSightings", zombieSighting);
        }
    
        /// <summary>
        /// Deprecated Method for adding a new object to the ZombieTypes EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToZombieTypes(ZombieType zombieType)
        {
            base.AddObject("ZombieTypes", zombieType);
        }

        #endregion
    }
    

    #endregion
    
    #region Entities
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="ZombiePediaModel", Name="ZombieSighting")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class ZombieSighting : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new ZombieSighting object.
        /// </summary>
        /// <param name="id">Initial value of the ID property.</param>
        /// <param name="nickname">Initial value of the Nickname property.</param>
        /// <param name="feeder">Initial value of the Feeder property.</param>
        /// <param name="ambulatory">Initial value of the Ambulatory property.</param>
        /// <param name="zombieTypeID">Initial value of the ZombieTypeID property.</param>
        /// <param name="latitude">Initial value of the Latitude property.</param>
        /// <param name="longitude">Initial value of the Longitude property.</param>
        public static ZombieSighting CreateZombieSighting(global::System.Int32 id, global::System.String nickname, global::System.Boolean feeder, global::System.Boolean ambulatory, global::System.Int32 zombieTypeID, global::System.Decimal latitude, global::System.Decimal longitude)
        {
            ZombieSighting zombieSighting = new ZombieSighting();
            zombieSighting.ID = id;
            zombieSighting.Nickname = nickname;
            zombieSighting.Feeder = feeder;
            zombieSighting.Ambulatory = ambulatory;
            zombieSighting.ZombieTypeID = zombieTypeID;
            zombieSighting.Latitude = latitude;
            zombieSighting.Longitude = longitude;
            return zombieSighting;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                if (_ID != value)
                {
                    OnIDChanging(value);
                    ReportPropertyChanging("ID");
                    _ID = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("ID");
                    OnIDChanged();
                }
            }
        }
        private global::System.Int32 _ID;
        partial void OnIDChanging(global::System.Int32 value);
        partial void OnIDChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String Nickname
        {
            get
            {
                return _Nickname;
            }
            set
            {
                OnNicknameChanging(value);
                ReportPropertyChanging("Nickname");
                _Nickname = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("Nickname");
                OnNicknameChanged();
            }
        }
        private global::System.String _Nickname;
        partial void OnNicknameChanging(global::System.String value);
        partial void OnNicknameChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Boolean Feeder
        {
            get
            {
                return _Feeder;
            }
            set
            {
                OnFeederChanging(value);
                ReportPropertyChanging("Feeder");
                _Feeder = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("Feeder");
                OnFeederChanged();
            }
        }
        private global::System.Boolean _Feeder;
        partial void OnFeederChanging(global::System.Boolean value);
        partial void OnFeederChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Boolean Ambulatory
        {
            get
            {
                return _Ambulatory;
            }
            set
            {
                OnAmbulatoryChanging(value);
                ReportPropertyChanging("Ambulatory");
                _Ambulatory = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("Ambulatory");
                OnAmbulatoryChanged();
            }
        }
        private global::System.Boolean _Ambulatory;
        partial void OnAmbulatoryChanging(global::System.Boolean value);
        partial void OnAmbulatoryChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=true)]
        [DataMemberAttribute()]
        public global::System.String Description
        {
            get
            {
                return _Description;
            }
            set
            {
                OnDescriptionChanging(value);
                ReportPropertyChanging("Description");
                _Description = StructuralObject.SetValidValue(value, true);
                ReportPropertyChanged("Description");
                OnDescriptionChanged();
            }
        }
        private global::System.String _Description;
        partial void OnDescriptionChanging(global::System.String value);
        partial void OnDescriptionChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 ZombieTypeID
        {
            get
            {
                return _ZombieTypeID;
            }
            set
            {
                OnZombieTypeIDChanging(value);
                ReportPropertyChanging("ZombieTypeID");
                _ZombieTypeID = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("ZombieTypeID");
                OnZombieTypeIDChanged();
            }
        }
        private global::System.Int32 _ZombieTypeID;
        partial void OnZombieTypeIDChanging(global::System.Int32 value);
        partial void OnZombieTypeIDChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Decimal Latitude
        {
            get
            {
                return _Latitude;
            }
            set
            {
                OnLatitudeChanging(value);
                ReportPropertyChanging("Latitude");
                _Latitude = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("Latitude");
                OnLatitudeChanged();
            }
        }
        private global::System.Decimal _Latitude;
        partial void OnLatitudeChanging(global::System.Decimal value);
        partial void OnLatitudeChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Decimal Longitude
        {
            get
            {
                return _Longitude;
            }
            set
            {
                OnLongitudeChanging(value);
                ReportPropertyChanging("Longitude");
                _Longitude = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("Longitude");
                OnLongitudeChanged();
            }
        }
        private global::System.Decimal _Longitude;
        partial void OnLongitudeChanging(global::System.Decimal value);
        partial void OnLongitudeChanged();

        #endregion
    
        #region Navigation Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("ZombiePediaModel", "FK_ZombieSighting_ZombieType", "ZombieType")]
        public ZombieType ZombieType
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<ZombieType>("ZombiePediaModel.FK_ZombieSighting_ZombieType", "ZombieType").Value;
            }
            set
            {
                ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<ZombieType>("ZombiePediaModel.FK_ZombieSighting_ZombieType", "ZombieType").Value = value;
            }
        }
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [BrowsableAttribute(false)]
        [DataMemberAttribute()]
        public EntityReference<ZombieType> ZombieTypeReference
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedReference<ZombieType>("ZombiePediaModel.FK_ZombieSighting_ZombieType", "ZombieType");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedReference<ZombieType>("ZombiePediaModel.FK_ZombieSighting_ZombieType", "ZombieType", value);
                }
            }
        }

        #endregion
    }
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="ZombiePediaModel", Name="ZombieType")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class ZombieType : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new ZombieType object.
        /// </summary>
        /// <param name="id">Initial value of the ID property.</param>
        /// <param name="name">Initial value of the Name property.</param>
        /// <param name="description">Initial value of the Description property.</param>
        public static ZombieType CreateZombieType(global::System.Int32 id, global::System.String name, global::System.String description)
        {
            ZombieType zombieType = new ZombieType();
            zombieType.ID = id;
            zombieType.Name = name;
            zombieType.Description = description;
            return zombieType;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 ID
        {
            get
            {
                return _ID;
            }
            set
            {
                if (_ID != value)
                {
                    OnIDChanging(value);
                    ReportPropertyChanging("ID");
                    _ID = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("ID");
                    OnIDChanged();
                }
            }
        }
        private global::System.Int32 _ID;
        partial void OnIDChanging(global::System.Int32 value);
        partial void OnIDChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String Name
        {
            get
            {
                return _Name;
            }
            set
            {
                OnNameChanging(value);
                ReportPropertyChanging("Name");
                _Name = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("Name");
                OnNameChanged();
            }
        }
        private global::System.String _Name;
        partial void OnNameChanging(global::System.String value);
        partial void OnNameChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String Description
        {
            get
            {
                return _Description;
            }
            set
            {
                OnDescriptionChanging(value);
                ReportPropertyChanging("Description");
                _Description = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("Description");
                OnDescriptionChanged();
            }
        }
        private global::System.String _Description;
        partial void OnDescriptionChanging(global::System.String value);
        partial void OnDescriptionChanged();

        #endregion
    
        #region Navigation Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [XmlIgnoreAttribute()]
        [SoapIgnoreAttribute()]
        [DataMemberAttribute()]
        [EdmRelationshipNavigationPropertyAttribute("ZombiePediaModel", "FK_ZombieSighting_ZombieType", "ZombieSighting")]
        public EntityCollection<ZombieSighting> ZombieSightings
        {
            get
            {
                return ((IEntityWithRelationships)this).RelationshipManager.GetRelatedCollection<ZombieSighting>("ZombiePediaModel.FK_ZombieSighting_ZombieType", "ZombieSighting");
            }
            set
            {
                if ((value != null))
                {
                    ((IEntityWithRelationships)this).RelationshipManager.InitializeRelatedCollection<ZombieSighting>("ZombiePediaModel.FK_ZombieSighting_ZombieType", "ZombieSighting", value);
                }
            }
        }

        #endregion
    }

    #endregion
    
}