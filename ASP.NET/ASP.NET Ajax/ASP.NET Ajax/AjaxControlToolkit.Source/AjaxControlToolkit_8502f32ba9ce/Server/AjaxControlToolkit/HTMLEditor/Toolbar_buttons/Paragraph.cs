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

[assembly: WebResource("HTMLEditor.Images.ed_format_paragraph_n.gif", "image/gif")]
[assembly: WebResource("HTMLEditor.Images.ed_format_paragraph_a.gif", "image/gif")]
[assembly: System.Web.UI.WebResource("HTMLEditor.Toolbar_buttons.Paragraph.js", "application/x-javascript")]
[assembly: System.Web.UI.WebResource("HTMLEditor.Toolbar_buttons.Paragraph.debug.js", "application/x-javascript")]

#endregion

namespace AjaxControlToolkit.HTMLEditor.ToolbarButton
{
    [ToolboxItem(false)]
    [ParseChildren(true)]
    [PersistChildren(false)]
    [RequiredScript(typeof(CommonToolkitScripts))]
    [ClientScriptResource("Sys.Extended.UI.HTMLEditor.ToolbarButton.Paragraph", "HTMLEditor.Toolbar_buttons.Paragraph.js")]
    [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Maintainability", "CA1501:AvoidExcessiveInheritance")]
    public class Paragraph : EditorToggleButton
    {
        #region [ Methods ]

        protected override void OnPreRender(EventArgs e)
        {
            RegisterButtonImages("ed_format_paragraph");
            base.OnPreRender(e);
        }

        #endregion
    }
}
