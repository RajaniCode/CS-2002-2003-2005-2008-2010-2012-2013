#pragma checksum "D:\Mahesh_Practice\Silverlight_40\SILV4_ICommand_Application\Silverlight.Com.View.Client\MainPage.xaml" "{406ea660-64cf-4c82-b6f0-42d48172a799}" "A28E7ACD5434E1E33B9F23DDC8BA7CCE"
//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated by a tool.
//     Runtime Version:4.0.30128.1
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


namespace Silverlight.Com.View.Client {
    
    
    public partial class MainPage : System.Windows.Controls.UserControl {
        
        internal System.Windows.Controls.Grid LayoutRoot;
        
        internal System.Windows.Controls.Grid grdAllEmp;
        
        internal System.Windows.Controls.Button btnAllEmployees;
        
        internal System.Windows.Controls.Button btnCreateEmployee;
        
        internal System.Windows.Controls.Grid grdNewEmp;
        
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
            System.Windows.Application.LoadComponent(this, new System.Uri("/Silverlight.Com.View.Client;component/MainPage.xaml", System.UriKind.Relative));
            this.LayoutRoot = ((System.Windows.Controls.Grid)(this.FindName("LayoutRoot")));
            this.grdAllEmp = ((System.Windows.Controls.Grid)(this.FindName("grdAllEmp")));
            this.btnAllEmployees = ((System.Windows.Controls.Button)(this.FindName("btnAllEmployees")));
            this.btnCreateEmployee = ((System.Windows.Controls.Button)(this.FindName("btnCreateEmployee")));
            this.grdNewEmp = ((System.Windows.Controls.Grid)(this.FindName("grdNewEmp")));
        }
    }
}

