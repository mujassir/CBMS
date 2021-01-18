<%@ page title="Reset Password" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.resetpass" codebehind="resetpass.aspx.cs" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                               <AjaxSettings>
                                   <telerik:AjaxSetting AjaxControlID="pnl">
                                       <UpdatedControls>
                                           <telerik:AjaxUpdatedControl ControlID="pnl" LoadingPanelID="ldp" />
                                           <telerik:AjaxUpdatedControl ControlID="grid" LoadingPanelID="ldp" />
                                            <telerik:AjaxUpdatedControl ControlID="pl" LoadingPanelID="ldp" />
                                       </UpdatedControls>
                                   </telerik:AjaxSetting>
                               </AjaxSettings>
                           </telerik:RadAjaxManager>
                           <telerik:RadAjaxLoadingPanel runat="server" Skin="Metro" ID="ldp" Transparency="50">

                           </telerik:RadAjaxLoadingPanel>

                           <asp:Panel ID="pnl" runat="server">
                                <asp:Label Font-Bold="true" ID="result" Font-Size="16px" ForeColor="Red" runat="server"></asp:Label>
     <fieldset>
         <legend>Reset Password</legend>

         <telerik:RadGrid runat="server" ID="grid" DataSourceID="SqlDataSource1" GroupPanelPosition="Top" al Skin="Office2010Blue" OnItemCommand="grid_ItemCommand">
             <GroupingSettings CollapseAllTooltip="Collapse all groups" />
             <MasterTableView AutoGenerateColumns="False" DataKeyNames="userid" AllowFilteringByColumn="true" DataSourceID="SqlDataSource1" Font-Size="Small">
                 <Columns>
                    <%-- <telerik:GridBoundColumn DataField="userid" DataType="System.Guid" FilterControlAltText="Filter userid column" HeaderText="userid" ReadOnly="True" SortExpression="userid" UniqueName="userid">
                     </telerik:GridBoundColumn>--%>
                     <telerik:GridButtonColumn HeaderText="Action" ButtonType="PushButton" Text="Reset" ItemStyle-Font-Bold="true" CommandName="reset" FilterControlAltText="Filter column column" UniqueName="column">
                     </telerik:GridButtonColumn>
                     <telerik:GridBoundColumn DataField="username" AllowFiltering="true" FilterControlAltText="Filter username column" HeaderText="Staff ID" SortExpression="username" UniqueName="username">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="EmployeeName" FilterControlAltText="Filter EmployeeName column" HeaderText="Employee Name" SortExpression="EmployeeName" UniqueName="EmployeeName">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="lastactivitydate" DataType="System.DateTime" FilterControlAltText="Filter Last activity date column" HeaderText="lastactivitydate" SortExpression="lastactivitydate" UniqueName="lastactivitydate">
                     </telerik:GridBoundColumn>
                    <%-- <telerik:GridCheckBoxColumn DataField="isapproved" DataType="System.Boolean" FilterControlAltText="Filter isapproved column" HeaderText="isapproved" SortExpression="isapproved" UniqueName="isapproved">
                     </telerik:GridCheckBoxColumn>--%>
                     <telerik:GridBoundColumn DataField="createdate" DataType="System.DateTime" FilterControlAltText="Filter createdate column" HeaderText="Creation ate" SortExpression="createdate" UniqueName="createdate">
                     </telerik:GridBoundColumn>
                     <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="Email" SortExpression="email" UniqueName="email">
                     </telerik:GridBoundColumn>
                     <%--<telerik:GridCheckBoxColumn DataField="islockedout" DataType="System.Boolean" FilterControlAltText="Filter islockedout column" HeaderText="islockedout" SortExpression="islockedout" UniqueName="islockedout">
                     </telerik:GridCheckBoxColumn>--%>
                     <telerik:GridBoundColumn DataField="lastlogindate" AllowFiltering="false" DataType="System.DateTime" FilterControlAltText="Filter lastlogindate column" HeaderText="Last login date" SortExpression="lastlogindate" UniqueName="lastlogindate">
                     </telerik:GridBoundColumn>
                 </Columns>
             </MasterTableView>
         </telerik:RadGrid>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [vw_Users]"></asp:SqlDataSource>
        <asp:Panel runat="server" ID="pl" style="display:none" CssClass="popup">
            <div>
                      <asp:Button ID="btnCancel" Text="Close" CssClass="btn btn-primary" Width="60px" Height="40px" runat="server" /><br />
                  </div><br />
       
          <table class="tbl">
            
               <tr>
                            <td>Username :</td><td><asp:TextBox ID="username" runat="server" Enabled="false"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="required" Font-Bold="true" ForeColor="red" ControlToValidate="username" Display="Dynamic" ValidationGroup="lgn" runat="server"></asp:RequiredFieldValidator>
                                               </td>
                        </tr>
             <tr>
                 <td>Password :</td>
                 <td>
                     <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="pass" Display="Dynamic" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ValidationGroup="lgn"></asp:RequiredFieldValidator>
                 </td>
             </tr>
             <tr>
                 <td>Confirm Password :</td>
                 <td>
                     <asp:TextBox ID="confirmpass" runat="server" TextMode="Password"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="confirmpass" Display="Dynamic" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ValidationGroup="lgn"></asp:RequiredFieldValidator>
                     <asp:CompareValidator runat="server" ControlToCompare="confirmpass" ControlToValidate="pass" Font-Bold="true" ForeColor="Red" Text="Password mismatch" ValidationGroup="lgn"></asp:CompareValidator>
                 </td>
             </tr>
             <tr>
                 <td colspan="4" style="text-align:right">
                     <asp:Button ID="btnreset" runat="server" CssClass="btn btn-primary" OnClick="btnreset_Click" Text="Reset" ValidationGroup="lgn" />
                     &nbsp; </td>
             </tr>
         </table>
 </asp:Panel>
          <ajaxToolkit:ModalPopupExtender Drag="true" CancelControlID="btnCancel" BackgroundCssClass="ModalBackground" ID="grid_ModalPopupExtender" runat="server" PopupControlID="pl" TargetControlID="dummy">
               </ajaxToolkit:ModalPopupExtender>

              <asp:Label ID="dummy" runat="server"></asp:Label>
                    </fieldset>
                               </asp:Panel>
</asp:content>

