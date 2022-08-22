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

namespace WPF_DaatGridEvents
{
    #region Contexts
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    public partial class CompanyEntities : ObjectContext
    {
        #region Constructors
    
        /// <summary>
        /// Initializes a new CompanyEntities object using the connection string found in the 'CompanyEntities' section of the application configuration file.
        /// </summary>
        public CompanyEntities() : base("name=CompanyEntities", "CompanyEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new CompanyEntities object.
        /// </summary>
        public CompanyEntities(string connectionString) : base(connectionString, "CompanyEntities")
        {
            this.ContextOptions.LazyLoadingEnabled = true;
            OnContextCreated();
        }
    
        /// <summary>
        /// Initialize a new CompanyEntities object.
        /// </summary>
        public CompanyEntities(EntityConnection connection) : base(connection, "CompanyEntities")
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
        public ObjectSet<Employee> Employee
        {
            get
            {
                if ((_Employee == null))
                {
                    _Employee = base.CreateObjectSet<Employee>("Employee");
                }
                return _Employee;
            }
        }
        private ObjectSet<Employee> _Employee;

        #endregion
        #region AddTo Methods
    
        /// <summary>
        /// Deprecated Method for adding a new object to the Employee EntitySet. Consider using the .Add method of the associated ObjectSet&lt;T&gt; property instead.
        /// </summary>
        public void AddToEmployee(Employee employee)
        {
            base.AddObject("Employee", employee);
        }

        #endregion
    }
    

    #endregion
    
    #region Entities
    
    /// <summary>
    /// No Metadata Documentation available.
    /// </summary>
    [EdmEntityTypeAttribute(NamespaceName="CompanyModel", Name="Employee")]
    [Serializable()]
    [DataContractAttribute(IsReference=true)]
    public partial class Employee : EntityObject
    {
        #region Factory Method
    
        /// <summary>
        /// Create a new Employee object.
        /// </summary>
        /// <param name="empNo">Initial value of the EmpNo property.</param>
        /// <param name="empName">Initial value of the EmpName property.</param>
        /// <param name="salary">Initial value of the Salary property.</param>
        /// <param name="deptNo">Initial value of the DeptNo property.</param>
        public static Employee CreateEmployee(global::System.Int32 empNo, global::System.String empName, global::System.Int32 salary, global::System.Int32 deptNo)
        {
            Employee employee = new Employee();
            employee.EmpNo = empNo;
            employee.EmpName = empName;
            employee.Salary = salary;
            employee.DeptNo = deptNo;
            return employee;
        }

        #endregion
        #region Primitive Properties
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=true, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 EmpNo
        {
            get
            {
                return _EmpNo;
            }
            set
            {
                if (_EmpNo != value)
                {
                    OnEmpNoChanging(value);
                    ReportPropertyChanging("EmpNo");
                    _EmpNo = StructuralObject.SetValidValue(value);
                    ReportPropertyChanged("EmpNo");
                    OnEmpNoChanged();
                }
            }
        }
        private global::System.Int32 _EmpNo;
        partial void OnEmpNoChanging(global::System.Int32 value);
        partial void OnEmpNoChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.String EmpName
        {
            get
            {
                return _EmpName;
            }
            set
            {
                OnEmpNameChanging(value);
                ReportPropertyChanging("EmpName");
                _EmpName = StructuralObject.SetValidValue(value, false);
                ReportPropertyChanged("EmpName");
                OnEmpNameChanged();
            }
        }
        private global::System.String _EmpName;
        partial void OnEmpNameChanging(global::System.String value);
        partial void OnEmpNameChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 Salary
        {
            get
            {
                return _Salary;
            }
            set
            {
                OnSalaryChanging(value);
                ReportPropertyChanging("Salary");
                _Salary = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("Salary");
                OnSalaryChanged();
            }
        }
        private global::System.Int32 _Salary;
        partial void OnSalaryChanging(global::System.Int32 value);
        partial void OnSalaryChanged();
    
        /// <summary>
        /// No Metadata Documentation available.
        /// </summary>
        [EdmScalarPropertyAttribute(EntityKeyProperty=false, IsNullable=false)]
        [DataMemberAttribute()]
        public global::System.Int32 DeptNo
        {
            get
            {
                return _DeptNo;
            }
            set
            {
                OnDeptNoChanging(value);
                ReportPropertyChanging("DeptNo");
                _DeptNo = StructuralObject.SetValidValue(value);
                ReportPropertyChanged("DeptNo");
                OnDeptNoChanged();
            }
        }
        private global::System.Int32 _DeptNo;
        partial void OnDeptNoChanging(global::System.Int32 value);
        partial void OnDeptNoChanged();

        #endregion
    
    }

    #endregion
    
}