<%@ page title="Access Rules" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.accessrules" codebehind="accessrules.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
     <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
   <%--      <a href="accessrules.aspx">accessrules.aspx</a>--%>  <AjaxSettings>
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
                               <asp:Label Font-Bold="true" ID="result" Font-Size="18px" ForeColor="Red" runat="server"></asp:Label>
    <fieldset>
        <legend>User Roles</legend>

        <telerik:RadTabStrip runat="server" Skin="Office2010Blue" SelectedIndex="0" MultiPageID="RadMultiPage1">
            <Tabs>
                <telerik:RadTab Text ="Add User Role" PageViewID="RadPageView1" Font-Size="Small"></telerik:RadTab>
                <telerik:RadTab Text="Update User Role" PageViewID="RadPageView2" Font-Size="Small"></telerik:RadTab>
            </Tabs>
        </telerik:RadTabStrip>
        <a href="accessrules.aspx">accessrules.aspx</a>
        
                              <telerik:RadMultiPage ID="RadMultiPage1" runat="server" SelectedIndex="0">
                                  <telerik:RadPageView ID="RadPageView1" runat="server">
                                      <br />
<div style="float:left;margin-right:13px">
                                  <asp:Label Text="Role Name" runat="server"></asp:Label><asp:TextBox ID="txtgroup" runat="server"></asp:TextBox><br />
                                  
                                  <asp:RequiredFieldValidator ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="txtgroup" ValidationGroup="group" runat="server"></asp:RequiredFieldValidator>
                              </div>
                               <div>
                                   <asp:Label Text="Access Rules" runat="server"></asp:Label>
                                   <asp:CheckBoxList ID="chk" RepeatColumns="2" CssClass="checkbox" RepeatDirection="Horizontal" runat="server" DataSourceID="SqlDataSource1" DataTextField="AccessRuleName" DataValueField="AccessRuleId"></asp:CheckBoxList>
                                   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [AccessRules]"></asp:SqlDataSource>
                               </div>

                             
                               <br />
                              
                               <div style="clear:both;text-align:right">
                               <asp:Button Text="Add Role" ID="btnadd" ValidationGroup="group" CssClass="btn btn-primary" runat="server" OnClick="btnadd_Click" />
                                   <br />
                                   <br />
        </div>
                                  </telerik:RadPageView>
                                  <telerik:RadPageView ID="RadPageView2" runat="server">
                                      <br />
                                    
                                   <asp:Label ID="lblresult" Font-Bold="true" Font-Size="20px" ForeColor="Red" runat="server"></asp:Label>
                                    <div style="float:left;margin-right:13px">
                                        <telerik:RadComboBox ID="cmb" runat="server" AutoPostBack="true" Width="200px" OnSelectedIndexChanged="cmb_SelectedIndexChanged" Skin="Bootstrap" EmptyMessage="Select A Role" DataSourceID="SqlDataSource2" DataTextField="GroupName" DataValueField="GroupId"></telerik:RadComboBox>
                                        
                                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [GroupId], [GroupName] FROM [UserGroups]"></asp:SqlDataSource>
                                        </div>

                                   <div style="float:left;margin-right:16px">
                                   <asp:Label ID="Label1" Text="Access Rules" runat="server"></asp:Label><br />
                                       <asp:CheckBoxList Enabled="false" ID="CheckBoxList1" RepeatColumns="2" CssClass="checkbox" RepeatDirection="Horizontal" runat="server" DataSourceID="SqlDataSource1" DataTextField="AccessRuleName" DataValueField="AccessRuleId"></asp:CheckBoxList>
                                       </div>
                                   <div style="clear:both;text-align:right">
                                       <asp:Button ID="btnupd" CssClass="btn btn-primary" Text="Save" OnClick="btnupd_Click" runat="server" />
                                   </div>
                                   
                            
                                  </telerik:RadPageView>
        </telerik:RadMultiPage>
        
                              
                            
                    </fieldset>    
                                   
        


                                </asp:Panel>
</asp:content>

