<%@ page title="Users" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.users" codebehind="users.aspx.cs" %>

<%@ register src="UserControls/Users.ascx" tagname="Users" tagprefix="uc1" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
     <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                               <AjaxSettings>
                                   <telerik:AjaxSetting AjaxControlID="pnl">
                                       <UpdatedControls>
                                           <telerik:AjaxUpdatedControl ControlID="pnl" LoadingPanelID="ldp" />
                                           <telerik:AjaxUpdatedControl ControlID="grid" LoadingPanelID="ldp" />
                                           <telerik:AjaxUpdatedControl ControlID="txtareaid" LoadingPanelID="ldp" />
                                               <telerik:AjaxUpdatedControl ControlID="btnadd" LoadingPanelID="ldp" />
                                       </UpdatedControls>
                                   </telerik:AjaxSetting>
                               </AjaxSettings>
                           </telerik:RadAjaxManager>
                           <telerik:RadAjaxLoadingPanel runat="server" Skin="Metro" ID="ldp" Transparency="30">

                           </telerik:RadAjaxLoadingPanel>

                           <asp:Panel ID="pnl" runat="server">
                               <asp:Label Font-Bold="true" ID="result" Font-Size="18px" ForeColor="Red" runat="server"></asp:Label>
    <fieldset>
        <legend>All Users</legend>
    <uc1:Users ID="Users1" runat="server" />
</fieldset>
                               </asp:Panel>
</asp:content>

