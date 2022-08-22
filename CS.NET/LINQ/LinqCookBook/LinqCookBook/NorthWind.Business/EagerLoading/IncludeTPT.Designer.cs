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
[assembly: global::System.Data.Objects.DataClasses.EdmRelationshipAttribute("IncludeTPTModel", "FK_GunSmith_Company", "Company", global::System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(NorthWind.Business.EF.EagerLoading.Company), "GunSmith", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(NorthWind.Business.EF.EagerLoading.GunSmith))]
[assembly: global::System.Data.Objects.DataClasses.EdmRelationshipAttribute("IncludeTPTModel", "FK_Location_Phone", "Phone", global::System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(NorthWind.Business.EF.EagerLoading.Phone), "Location", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(NorthWind.Business.EF.EagerLoading.Location))]
[assembly: global::System.Data.Objects.DataClasses.EdmRelationshipAttribute("IncludeTPTModel", "FK_Departments_Company", "Company", global::System.Data.Metadata.Edm.RelationshipMultiplicity.One, typeof(NorthWind.Business.EF.EagerLoading.Company), "Departments", global::System.Data.Metadata.Edm.RelationshipMultiplicity.Many, typeof(NorthWind.Business.EF.EagerLoading.Department))]

// Original file name:
// Generation date: 11/7/2008 6:48:06 PM
namespace NorthWind.Business.EF.EagerLoading
{
    
    /// <summary>
    /// There are no comments for IncludeTPTEntities in the schema.
    /// </summary>
    public partial class IncludeTPTEntities : global::System.Data.Objects.ObjectContext
    {
        /// <summary>
        /// Initializes a new IncludeTPTEntities object using the connection string found in the 'IncludeTPTEntities' section of the application configuration file.
        /// </summary>
        public IncludeTPTEntities() : 
                base("name=IncludeTPTEntities", "IncludeTPTEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new IncludeTPTEntities object.
        /// </summary>
        public IncludeTPTEntities(string connectionString) : 
                base(connectionString, "IncludeTPTEntities")
        {
            this.OnContextCreated();
        }
        /// <summary>
        /// Initialize a new IncludeTPTEntities object.
        /// </summary>
        public IncludeTPTEntities(global::System.Data.EntityClient.EntityConnection connection) : 
                base(connection, "IncludeTPTEntities")
        {
            this.OnContextCreated();
        }
        partial void OnContextCreated();
        /// <summary>
        /// There are no comments for Contacts in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Contact> Contacts
        {
            get
            {
                if ((this._Contacts == null))
                {
                    this._Contacts = base.CreateQuery<Contact>("[Contacts]");
                }
                return this._Contacts;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Contact> _Contacts;
        /// <summary>
        /// There are no comments for Location in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Location> Location
        {
            get
            {
                if ((this._Location == null))
                {
                    this._Location = base.CreateQuery<Location>("[Location]");
                }
                return this._Location;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Location> _Location;
        /// <summary>
        /// There are no comments for Phone in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Phone> Phone
        {
            get
            {
                if ((this._Phone == null))
                {
                    this._Phone = base.CreateQuery<Phone>("[Phone]");
                }
                return this._Phone;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Phone> _Phone;
        /// <summary>
        /// There are no comments for DepartmentSet in the schema.
        /// </summary>
        public global::System.Data.Objects.ObjectQuery<Department> DepartmentSet
        {
            get
            {
                if ((this._DepartmentSet == null))
                {
                    this._DepartmentSet = base.CreateQuery<Department>("[DepartmentSet]");
                }
                return this._DepartmentSet;
            }
        }
        private global::System.Data.Objects.ObjectQuery<Department> _DepartmentSet;
        /// <summary>
        /// There are no comments for Contacts in the schema.
        /// </summary>
        public void AddToContacts(Contact contact)
        {
            base.AddObject("Contacts", contact);
        }
        /// <summary>
        /// There are no comments for Location in the schema.
        /// </summary>
        public void AddToLocation(Location location)
        {
            base.AddObject("Location", location);
        }
        /// <summary>
        /// There are no comments for Phone in the schema.
        /// </summary>
        public void AddToPhone(Phone phone)
        {
            base.AddObject("Phone", phone);
        }
        /// <summary>
        /// There are no comments for DepartmentSet in the schema.
        /// </summary>
        public void AddToDepartmentSet(Department department)
        {
            base.AddObject("DepartmentSet", department);
        }
    }
    /// <summary>
    /// There are no comments for IncludeTPTModel.Company in the schema.
    /// </summary>
    /// <KeyProperties>
    /// LocationId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="IncludeTPTModel", Name="Company")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Company : Location
    {
        /// <summary>
        /// Create a new Company object.
        /// </summary>
        /// <param name="locationId">Initial value of LocationId.</param>
        /// <param name="address">Initial value of Address.</param>
        /// <param name="companyName">Initial value of CompanyName.</param>
        public static Company CreateCompany(int locationId, string address, string companyName)
        {
            Company company = new Company();
            company.LocationId = locationId;
            company.Address = address;
            company.CompanyName = companyName;
            return company;
        }
        /// <summary>
        /// There are no comments for Property CompanyName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string CompanyName
        {
            get
            {
                return this._CompanyName;
            }
            set
            {
                this.OnCompanyNameChanging(value);
                this.ReportPropertyChanging("CompanyName");
                this._CompanyName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("CompanyName");
                this.OnCompanyNameChanged();
            }
        }
        private string _CompanyName;
        partial void OnCompanyNameChanging(string value);
        partial void OnCompanyNameChanged();
        /// <summary>
        /// There are no comments for GunSmith in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("IncludeTPTModel", "FK_GunSmith_Company", "GunSmith")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityCollection<GunSmith> GunSmith
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<GunSmith>("IncludeTPTModel.FK_GunSmith_Company", "GunSmith");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedCollection<GunSmith>("IncludeTPTModel.FK_GunSmith_Company", "GunSmith", value);
                }
            }
        }
        /// <summary>
        /// There are no comments for Departments in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("IncludeTPTModel", "FK_Departments_Company", "Departments")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityCollection<Department> Departments
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<Department>("IncludeTPTModel.FK_Departments_Company", "Departments");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedCollection<Department>("IncludeTPTModel.FK_Departments_Company", "Departments", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for IncludeTPTModel.Contact in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ContactId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="IncludeTPTModel", Name="Contact")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    [global::System.Runtime.Serialization.KnownTypeAttribute(typeof(global::NorthWind.Business.EF.EagerLoading.GunSmith))]
    public partial class Contact : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Contact object.
        /// </summary>
        /// <param name="contactId">Initial value of ContactId.</param>
        /// <param name="contactName">Initial value of ContactName.</param>
        /// <param name="email">Initial value of Email.</param>
        public static Contact CreateContact(int contactId, string contactName, string email)
        {
            Contact contact = new Contact();
            contact.ContactId = contactId;
            contact.ContactName = contactName;
            contact.Email = email;
            return contact;
        }
        /// <summary>
        /// There are no comments for Property ContactId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int ContactId
        {
            get
            {
                return this._ContactId;
            }
            set
            {
                this.OnContactIdChanging(value);
                this.ReportPropertyChanging("ContactId");
                this._ContactId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("ContactId");
                this.OnContactIdChanged();
            }
        }
        private int _ContactId;
        partial void OnContactIdChanging(int value);
        partial void OnContactIdChanged();
        /// <summary>
        /// There are no comments for Property ContactName in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string ContactName
        {
            get
            {
                return this._ContactName;
            }
            set
            {
                this.OnContactNameChanging(value);
                this.ReportPropertyChanging("ContactName");
                this._ContactName = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("ContactName");
                this.OnContactNameChanged();
            }
        }
        private string _ContactName;
        partial void OnContactNameChanging(string value);
        partial void OnContactNameChanged();
        /// <summary>
        /// There are no comments for Property Email in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Email
        {
            get
            {
                return this._Email;
            }
            set
            {
                this.OnEmailChanging(value);
                this.ReportPropertyChanging("Email");
                this._Email = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Email");
                this.OnEmailChanged();
            }
        }
        private string _Email;
        partial void OnEmailChanging(string value);
        partial void OnEmailChanged();
    }
    /// <summary>
    /// There are no comments for IncludeTPTModel.GunSmith in the schema.
    /// </summary>
    /// <KeyProperties>
    /// ContactId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="IncludeTPTModel", Name="GunSmith")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class GunSmith : Contact
    {
        /// <summary>
        /// Create a new GunSmith object.
        /// </summary>
        /// <param name="contactId">Initial value of ContactId.</param>
        /// <param name="contactName">Initial value of ContactName.</param>
        /// <param name="email">Initial value of Email.</param>
        /// <param name="isCertified">Initial value of IsCertified.</param>
        public static GunSmith CreateGunSmith(int contactId, string contactName, string email, bool isCertified)
        {
            GunSmith gunSmith = new GunSmith();
            gunSmith.ContactId = contactId;
            gunSmith.ContactName = contactName;
            gunSmith.Email = email;
            gunSmith.IsCertified = isCertified;
            return gunSmith;
        }
        /// <summary>
        /// There are no comments for Property IsCertified in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public bool IsCertified
        {
            get
            {
                return this._IsCertified;
            }
            set
            {
                this.OnIsCertifiedChanging(value);
                this.ReportPropertyChanging("IsCertified");
                this._IsCertified = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("IsCertified");
                this.OnIsCertifiedChanged();
            }
        }
        private bool _IsCertified;
        partial void OnIsCertifiedChanging(bool value);
        partial void OnIsCertifiedChanged();
        /// <summary>
        /// There are no comments for Company in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("IncludeTPTModel", "FK_GunSmith_Company", "Company")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public Company Company
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("IncludeTPTModel.FK_GunSmith_Company", "Company").Value;
            }
            set
            {
                ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("IncludeTPTModel.FK_GunSmith_Company", "Company").Value = value;
            }
        }
        /// <summary>
        /// There are no comments for Company in the schema.
        /// </summary>
        [global::System.ComponentModel.BrowsableAttribute(false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityReference<Company> CompanyReference
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("IncludeTPTModel.FK_GunSmith_Company", "Company");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedReference<Company>("IncludeTPTModel.FK_GunSmith_Company", "Company", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for IncludeTPTModel.Location in the schema.
    /// </summary>
    /// <KeyProperties>
    /// LocationId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="IncludeTPTModel", Name="Location")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    [global::System.Runtime.Serialization.KnownTypeAttribute(typeof(global::NorthWind.Business.EF.EagerLoading.Company))]
    public partial class Location : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Location object.
        /// </summary>
        /// <param name="locationId">Initial value of LocationId.</param>
        /// <param name="address">Initial value of Address.</param>
        public static Location CreateLocation(int locationId, string address)
        {
            Location location = new Location();
            location.LocationId = locationId;
            location.Address = address;
            return location;
        }
        /// <summary>
        /// There are no comments for Property LocationId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int LocationId
        {
            get
            {
                return this._LocationId;
            }
            set
            {
                this.OnLocationIdChanging(value);
                this.ReportPropertyChanging("LocationId");
                this._LocationId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("LocationId");
                this.OnLocationIdChanged();
            }
        }
        private int _LocationId;
        partial void OnLocationIdChanging(int value);
        partial void OnLocationIdChanged();
        /// <summary>
        /// There are no comments for Property Address in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Address
        {
            get
            {
                return this._Address;
            }
            set
            {
                this.OnAddressChanging(value);
                this.ReportPropertyChanging("Address");
                this._Address = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Address");
                this.OnAddressChanged();
            }
        }
        private string _Address;
        partial void OnAddressChanging(string value);
        partial void OnAddressChanged();
        /// <summary>
        /// There are no comments for Phone in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("IncludeTPTModel", "FK_Location_Phone", "Phone")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public Phone Phone
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Phone>("IncludeTPTModel.FK_Location_Phone", "Phone").Value;
            }
            set
            {
                ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Phone>("IncludeTPTModel.FK_Location_Phone", "Phone").Value = value;
            }
        }
        /// <summary>
        /// There are no comments for Phone in the schema.
        /// </summary>
        [global::System.ComponentModel.BrowsableAttribute(false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityReference<Phone> PhoneReference
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Phone>("IncludeTPTModel.FK_Location_Phone", "Phone");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedReference<Phone>("IncludeTPTModel.FK_Location_Phone", "Phone", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for IncludeTPTModel.Phone in the schema.
    /// </summary>
    /// <KeyProperties>
    /// PhoneId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="IncludeTPTModel", Name="Phone")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Phone : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Phone object.
        /// </summary>
        /// <param name="phoneId">Initial value of PhoneId.</param>
        /// <param name="number">Initial value of Number.</param>
        public static Phone CreatePhone(int phoneId, string number)
        {
            Phone phone = new Phone();
            phone.PhoneId = phoneId;
            phone.Number = number;
            return phone;
        }
        /// <summary>
        /// There are no comments for Property PhoneId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int PhoneId
        {
            get
            {
                return this._PhoneId;
            }
            set
            {
                this.OnPhoneIdChanging(value);
                this.ReportPropertyChanging("PhoneId");
                this._PhoneId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("PhoneId");
                this.OnPhoneIdChanged();
            }
        }
        private int _PhoneId;
        partial void OnPhoneIdChanging(int value);
        partial void OnPhoneIdChanged();
        /// <summary>
        /// There are no comments for Property Number in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public string Number
        {
            get
            {
                return this._Number;
            }
            set
            {
                this.OnNumberChanging(value);
                this.ReportPropertyChanging("Number");
                this._Number = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value, false);
                this.ReportPropertyChanged("Number");
                this.OnNumberChanged();
            }
        }
        private string _Number;
        partial void OnNumberChanging(string value);
        partial void OnNumberChanged();
        /// <summary>
        /// There are no comments for Location in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("IncludeTPTModel", "FK_Location_Phone", "Location")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityCollection<Location> Location
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedCollection<Location>("IncludeTPTModel.FK_Location_Phone", "Location");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedCollection<Location>("IncludeTPTModel.FK_Location_Phone", "Location", value);
                }
            }
        }
    }
    /// <summary>
    /// There are no comments for IncludeTPTModel.Department in the schema.
    /// </summary>
    /// <KeyProperties>
    /// DepartmentId
    /// </KeyProperties>
    [global::System.Data.Objects.DataClasses.EdmEntityTypeAttribute(NamespaceName="IncludeTPTModel", Name="Department")]
    [global::System.Runtime.Serialization.DataContractAttribute(IsReference=true)]
    [global::System.Serializable()]
    public partial class Department : global::System.Data.Objects.DataClasses.EntityObject
    {
        /// <summary>
        /// Create a new Department object.
        /// </summary>
        /// <param name="departmentId">Initial value of DepartmentId.</param>
        /// <param name="name">Initial value of Name.</param>
        public static Department CreateDepartment(int departmentId, string name)
        {
            Department department = new Department();
            department.DepartmentId = departmentId;
            department.Name = name;
            return department;
        }
        /// <summary>
        /// There are no comments for Property DepartmentId in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public int DepartmentId
        {
            get
            {
                return this._DepartmentId;
            }
            set
            {
                this.OnDepartmentIdChanging(value);
                this.ReportPropertyChanging("DepartmentId");
                this._DepartmentId = global::System.Data.Objects.DataClasses.StructuralObject.SetValidValue(value);
                this.ReportPropertyChanged("DepartmentId");
                this.OnDepartmentIdChanged();
            }
        }
        private int _DepartmentId;
        partial void OnDepartmentIdChanging(int value);
        partial void OnDepartmentIdChanged();
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
        /// There are no comments for Company in the schema.
        /// </summary>
        [global::System.Data.Objects.DataClasses.EdmRelationshipNavigationPropertyAttribute("IncludeTPTModel", "FK_Departments_Company", "Company")]
        [global::System.Xml.Serialization.XmlIgnoreAttribute()]
        [global::System.Xml.Serialization.SoapIgnoreAttribute()]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public Company Company
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("IncludeTPTModel.FK_Departments_Company", "Company").Value;
            }
            set
            {
                ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("IncludeTPTModel.FK_Departments_Company", "Company").Value = value;
            }
        }
        /// <summary>
        /// There are no comments for Company in the schema.
        /// </summary>
        [global::System.ComponentModel.BrowsableAttribute(false)]
        [global::System.Runtime.Serialization.DataMemberAttribute()]
        public global::System.Data.Objects.DataClasses.EntityReference<Company> CompanyReference
        {
            get
            {
                return ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.GetRelatedReference<Company>("IncludeTPTModel.FK_Departments_Company", "Company");
            }
            set
            {
                if ((value != null))
                {
                    ((global::System.Data.Objects.DataClasses.IEntityWithRelationships)(this)).RelationshipManager.InitializeRelatedReference<Company>("IncludeTPTModel.FK_Departments_Company", "Company", value);
                }
            }
        }
    }
}