// (c) Copyright Microsoft Corporation.
// This source is subject to the Microsoft Permissive License.
// See http://www.microsoft.com/resources/sharedsource/licensingbasics/sharedsourcelicenses.mspx.
// All other rights reserved.


using System;
using System.Threading;

public partial class UpdatePanelAnimation_UpdatePanelAnimation : CommonPage
{
    /// <summary>
    /// Change the label everytime we update
    /// </summary>
    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        Thread.Sleep(2000);
        lblUpdate.Text = DateTime.Now.ToString();
    }
}