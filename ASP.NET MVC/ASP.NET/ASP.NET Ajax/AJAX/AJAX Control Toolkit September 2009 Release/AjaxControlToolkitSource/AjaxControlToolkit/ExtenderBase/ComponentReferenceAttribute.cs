// (c) Copyright Microsoft Corporation.
// This source is subject to the Microsoft Public License.
// See http://www.microsoft.com/opensource/licenses.mspx#Ms-PL.
// All other rights reserved.

using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

namespace AjaxControlToolkit
{
    /// <summary>
    /// Signifies that this property references a ScriptComponent
    /// </summary>
    [AttributeUsage(AttributeTargets.Property)]
    public sealed class ComponentReferenceAttribute : Attribute
    {
        public ComponentReferenceAttribute()
        {
        }
    }
}
