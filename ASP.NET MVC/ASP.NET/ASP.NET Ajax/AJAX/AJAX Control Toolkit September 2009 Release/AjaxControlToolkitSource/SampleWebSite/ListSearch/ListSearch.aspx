<%@ Page
    Language="C#"
    MasterPageFile="~/DefaultMaster.master"
    AutoEventWireup="true"
    Inherits="CommonPage"
    Culture="auto"
    UICulture="auto"
    Title="ListSearch Sample"
    Theme="SampleSiteTheme" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<script runat="server">
    protected override void OnLoad(EventArgs e)
    {
        base.OnLoad(e);
        ListBox1.DataSource = GetWordListText();
        ListBox1.DataBind();
        DropDownList1.DataSource = GetWordListText();
        DropDownList1.DataBind();
    }
</script>

<asp:Content ID="Content1" ContentPlaceHolderID="SampleContent" Runat="Server">
    <ajaxToolkit:ToolkitScriptManager ID="ScriptManager1" EnablePartialRendering="true" EnableScriptGlobalization="true" EnableScriptLocalization="true" runat="Server" />
    <div class="demoarea">
        <div class="demoheading">ListSearchExtender Demonstration</div>
        <p>
            Click on this ListBox and start typing to search for an entry:
        </p>
            <br />
        <p>
            <asp:ListBox ID="ListBox1" runat="server" Width="100px" />
            <ajaxToolkit:ListSearchExtender ID="ListSearchExtender1" runat="server"
                TargetControlID="ListBox1" PromptCssClass="ListSearchExtenderPrompt" 
                IsSorted="true">
            </ajaxToolkit:ListSearchExtender>
        </p>
        <p>
            It works for a DropDownList too. In this case, instead of searching for a string that
            starts with the word we get words that contain the typed word. It resets the search 
            query after 2 seconds if no match is found.
        </p>
            <br />
        <p>
            <asp:DropDownList ID="DropDownList1" runat="server" Width="100px" />
            <ajaxToolkit:ListSearchExtender ID="ListSearchExtender2" runat="server"
                TargetControlID="DropDownList1" PromptCssClass="ListSearchExtenderPrompt"
                QueryPattern="Contains" QueryTimeout="2000">
            </ajaxToolkit:ListSearchExtender>
        </p>
    </div>
    <div class="demobottom"></div>

    <asp:Panel ID="Description_HeaderPanel" runat="server" style="cursor: pointer;">
        <div class="heading">
            <asp:ImageButton ID="Description_ToggleImage" runat="server" ImageUrl="~/images/collapse.jpg" AlternateText="collapse" />
            ListSearchExtender Description
        </div>
    </asp:Panel>
    <asp:Panel id="Description_ContentPanel" runat="server" style="overflow:hidden;">
        <p>
            The ListSearchExtender lets you search for items in a ListBox or DropDownList
            by typing. The extender performs an incremental search within the ListBox
            based on what has been typed so far. The prompt message that gets displayed
            when you click the list can be customized along with its CSS class and position.</p>
    </asp:Panel>

    <asp:Panel ID="Properties_HeaderPanel" runat="server" style="cursor: pointer;">
        <div class="heading">
            <asp:ImageButton ID="Properties_ToggleImage" runat="server" ImageUrl="~/images/expand.jpg" AlternateText="expand" />
            ListSearchExtender Properties
        </div>
    </asp:Panel>
    <asp:Panel id="Properties_ContentPanel" runat="server" style="overflow:hidden;" Height="0px">
        <p>
            The controls above are initialized with code like this. The <em>italic</em>
            properties are optional:</p>
        <pre>&lt;ajaxToolkit:ListSearchExtender id="LSE" runat="server"
    TargetControlID="ListBox1"
<em>    PromptText="Type to search"</em>
<em>    PromptCssClass="ListSearchExtenderPrompt"</em>
<em>    PromptPosition="Top"</em>
<em>    AutoResetTimeout="0"</em>
<em>    IsSorted="true"</em>/&gt; </pre>
        <ul>
            <li><strong>PromptText</strong> - Message to display when the ListBox or DropDownList
                is given focus. Default is 'Type to search'. The PromptText is replaced
                by the search text typed by the user.</li>
            <li><strong>PromptCssClass</strong> - The name of the CSS class to apply to the prompt
                message.</li>
            <li><strong>PromptPosition</strong> - Indicates whether the message should appear at
                the Top or Bottom of the ListBox. The default
                is Top. </li>
            <li><strong>QueryPattern</strong> - Indicates how the typed characters should be used in the
                search query. The default pattern queries for results that start with the typed word. </li>
            <li><strong>IsSorted</strong> - Indicates if items added to the List are expected to be sorted.
                The default is false. If set to true it allows the code to perform a faster search instead 
                of having to determine the same before performing the search.</li>
            <li><strong>QueryTimeout</strong> - Indicates whether the search query should be reset after 
                the timeout if no match is found. The default is 0, meaning no auto
                reset behavior. </li>                
            <li><strong>Animations</strong> - Generic animations for the ListSearch extender.  See the
                <a href="../Walkthrough/UsingAnimations.aspx">Using Animations</a> walkthrough and
                <a href="../Walkthrough/AnimationReference.aspx">Animation Reference</a> for more details.
                <ul>
                    <li><strong>OnShow</strong> - The OnShow animation will be played each time the extender's
                        prompt is displayed.  The prompt will be positioned correctly but hidden.
                        The animation can use <span class="codeReference">&lt;HideAction Visible="true" /&gt;</span>
                        to display the prompt along with any other visual effects.</li>
                    <li><strong>OnHide</strong> - The OnHide animation will be played each time the extender's
                        prompt is hidden.</li>
                </ul>
            </li>
        </ul>
    </asp:Panel>
    <asp:Panel ID="KnownIssues_HeaderPanel" runat="server" style="cursor: pointer;">
        <div class="heading">
            <asp:ImageButton ID="KnownIssues_ToggleImage" runat="server" ImageUrl="~/images/collapse.jpg" AlternateText="collapse" />
            ListSearchExtender Known Issues
        </div>
    </asp:Panel>
    <asp:Panel id="KnownIssues_ContentPanel" runat="server" style="overflow:hidden;">
        <p>
            In Safari the ListSearchExtender only works with ListBoxes, not DropDownLists.
        </p>
        <br />
        <p>
            In Opera the backspace key moves back a page in the browser history by default when
            it is pressed on a ListBox or DropDownList. To change this behavior you can
            go to Tools|Preferences|Shortcuts, edit the Keyboard setup, search for ?back? and
            change the mapping for ?Platform Windows-Unix-MCE, Backspace? to ?Backspace? instead
            of ?Backspace | Back?
        </p>
    </asp:Panel>
    <ajaxToolkit:CollapsiblePanelExtender ID="cpeKnownIssues" runat="Server"
        TargetControlID="KnownIssues_ContentPanel"
        ExpandControlID="KnownIssues_HeaderPanel"
        CollapseControlID="KnownIssues_HeaderPanel"
        Collapsed="False"
        ImageControlID="KnownIssues_ToggleImage" />
    <ajaxToolkit:CollapsiblePanelExtender ID="cpeDescription" runat="Server"
        TargetControlID="description_ContentPanel"
        ExpandControlID="description_HeaderPanel"
        CollapseControlID="description_HeaderPanel"
        Collapsed="False"
        ImageControlID="description_ToggleImage" />
    <ajaxToolkit:CollapsiblePanelExtender ID="cpeProperties" runat="Server"
        TargetControlID="properties_ContentPanel"
        ExpandControlID="properties_HeaderPanel"
        CollapseControlID="properties_HeaderPanel"
        Collapsed="True"
        ImageControlID="properties_ToggleImage"/>
</asp:Content>
