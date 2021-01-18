<%@ page title="Add Roles" language="C#" masterpagefile=
    "~/cbs.master" autoeventwireup="true" inherits="cbmsWA.addroles" codebehind="addroles.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
     <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                               <AjaxSettings>
                                   <telerik:AjaxSetting AjaxControlID="pnl">
                                       <UpdatedControls>
                                           <telerik:AjaxUpdatedControl ControlID="pnl" LoadingPanelID="ldp" />
                                           <telerik:AjaxUpdatedControl ControlID="grid" LoadingPanelID="ldp" />
                                       </UpdatedControls>
                                   </telerik:AjaxSetting>
                               </AjaxSettings>
                           </telerik:RadAjaxManager>
                           <telerik:RadAjaxLoadingPanel runat="server" Skin="Metro" ID="ldp" Transparency="30">

                           </telerik:RadAjaxLoadingPanel>

                           <asp:Panel ID="pnl" runat="server">
                              <asp:Label Font-Bold="true" ID="result" ForeColor="Red" runat="server"></asp:Label>
                               <asp:Label Font-Bold="true" ID="Label2" ForeColor="Red" runat="server"></asp:Label>
                               <fieldset>
                                   <legend>Create a New Role</legend>
<asp:TextBox ID="RoleName" runat="server"></asp:TextBox>
<br />
<asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" CssClass="btn btn-primary" OnClick="CreateRoleButton_Click" /><br /><br />

                                  <telerik:RadGrid runat="server" ID="grid" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" GroupPanelPosition="Top" Skin="Office2010Blue">
                                      <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                                      <MasterTableView DataKeyNames="RoleId" DataSourceID="SqlDataSource1" Font-Size="Small">
                                          <Columns>
                                              <telerik:GridBoundColumn DataField="ApplicationId" Visible="false" DataType="System.Guid" FilterControlAltText="Filter ApplicationId column" HeaderText="ApplicationId" SortExpression="ApplicationId" UniqueName="ApplicationId">
                                              </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="RoleId" Visible="false" DataType="System.Guid" FilterControlAltText="Filter RoleId column" HeaderText="RoleId" ReadOnly="True" SortExpression="RoleId" UniqueName="RoleId">
                                              </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="RoleName" FilterControlAltText="Filter RoleName column" HeaderText="Role Name" SortExpression="RoleName" UniqueName="RoleName">
                                              </telerik:GridBoundColumn>
                                              <telerik:GridBoundColumn DataField="Description" Visible="false" FilterControlAltText="Filter Description column" HeaderText="Description" SortExpression="Description" UniqueName="Description">
                                              </telerik:GridBoundColumn>
                                          </Columns>
                                      </MasterTableView>
                                   </telerik:RadGrid>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Roles] order by rolename asc"></asp:SqlDataSource>
                                   </fieldset>
                               </asp:Panel>
</asp:content>

