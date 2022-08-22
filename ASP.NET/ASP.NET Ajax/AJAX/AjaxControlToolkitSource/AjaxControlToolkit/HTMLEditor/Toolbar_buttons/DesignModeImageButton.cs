using System;
using System.ComponentModel;
using System.ComponentModel.Design;
using System.ComponentModel.Design.Serialization;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Drawing.Design;
using System.Security.Permissions;
using System.Collections;
using System.Collections.ObjectModel;
using System.Text;
using System.Text.RegularExpressions;
using System.Xml;
using System.Xml.Schema;
using System.Globalization;
using System.CodeDom;
using System.Drawing;
using System.IO;
using AjaxControlToolkit;

#region [ Resources ]

[assembly: WebResource("AjaxControlToolkit.HTMLEditor.Toolbar_buttons.DesignModeImageButton.js", "application/x-javascript")]
[assembly: WebResource("AjaxControlToolkit.HTMLEditor.Toolbar_buttons.DesignModeImageButton.debug.js", "application/x-javascript")]

#endregion

namespace AjaxControlToolkit.HTMLEditor.ToolbarButton
{
    [ParseChildren(true)]
    [PersistChildren(false)]
    [RequiredScript(typeof(CommonToolkitScripts))]
    [ClientScriptResource("AjaxControlToolkit.HTMLEditor.ToolbarButton.DesignModeImageButton", "AjaxControlToolkit.HTMLEditor.Toolbar_buttons.DesignModeImageButton.js")]
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Design", "CA1012:AbstractTypesShouldNotHaveConstructors")]
    public abstract class DesignModeImageButton : ImageButton
    {
        #region [ Constructors ]

        protected DesignModeImageButton()
            : base()
        {
            ActiveModes.Add(ActiveModeType.Design);
        }

        #endregion
    }
}
