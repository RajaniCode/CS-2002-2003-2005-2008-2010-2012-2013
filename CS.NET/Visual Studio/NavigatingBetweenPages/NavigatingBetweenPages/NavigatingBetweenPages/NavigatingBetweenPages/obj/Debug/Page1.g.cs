#pragma checksum "C:\Users\Administrator.suprotim\Documents\Visual Studio 2008\Projects\Silverlight\NavigatingBetweenPages\NavigatingBetweenPages\Page1.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "BC6F82B21A632E17A37669824AC0B3B4"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.1433
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Hosting;
using System.Windows.Ink;
using System.Windows.Input;
using System.Windows.Interop;
using System.Windows.Markup;
using System.Windows.Media;
using System.Windows.Media.Animation;
using System.Windows.Media.Imaging;
using System.Windows.Resources;
using System.Windows.Shapes;
using System.Windows.Threading;


namespace NavigatingBetweenPages {
    
    
    public partial class Page1 : System.Windows.Controls.UserControl {
        
        internal System.Windows.Controls.Grid LayoutRoot;
        
        internal System.Windows.Controls.TextBox txtUser;
        
        internal System.Windows.Controls.Button btnPage2Go;
        
        private bool _contentLoaded;
        
        /// <summary>
        /// InitializeComponent
        /// </summary>
        [System.Diagnostics.DebuggerNonUserCodeAttribute()]
        public void InitializeComponent() {
            if (_contentLoaded) {
                return;
            }
            _contentLoaded = true;
            System.Windows.Application.LoadComponent(this, new System.Uri("/NavigatingBetweenPages;component/Page1.xaml", System.UriKind.Relative));
            this.LayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("LayoutRoot")));
            this.txtUser = ((System.Windows.Controls.TextBox)(this.FindName("txtUser")));
            this.btnPage2Go = ((System.Windows.Controls.Button)(this.FindName("btnPage2Go")));
        }
    }
}
