#pragma checksum "C:\Users\Suprotim\Documents\Visual Studio 2008\Projects\ASPNETSilverlightInkDemo\InkXaml\Page.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "D693F88132BC2C3E607F107C2C0DD8FA"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:2.0.50727.3053
//
//     Changes to this file may cause incorrect behavior and will be lost if
//     the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

using System;
using System.Windows;
using System.Windows.Automation;
using System.Windows.Automation.Peers;
using System.Windows.Automation.Provider;
using System.Windows.Controls;
using System.Windows.Controls.Primitives;
using System.Windows.Data;
using System.Windows.Documents;
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


namespace InkXaml {
    
    
    public partial class Page : System.Windows.Controls.UserControl {
        
        internal System.Windows.Controls.Grid LayoutRoot;
        
        internal System.Windows.Controls.Border borderInk;
        
        internal System.Windows.Controls.InkPresenter inkP;
        
        internal System.Windows.Controls.Button btnErase;
        
        internal System.Windows.Controls.Button btnDraw;
        
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
            System.Windows.Application.LoadComponent(this, new System.Uri("/InkXaml;component/Page.xaml", System.UriKind.Relative));
            this.LayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("LayoutRoot")));
            this.borderInk = ((System.Windows.Controls.Border)(this.FindName("borderInk")));
            this.inkP = ((System.Windows.Controls.InkPresenter)(this.FindName("inkP")));
            this.btnErase = ((System.Windows.Controls.Button)(this.FindName("btnErase")));
            this.btnDraw = ((System.Windows.Controls.Button)(this.FindName("btnDraw")));
        }
    }
}
