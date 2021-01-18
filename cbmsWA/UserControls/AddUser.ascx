<%@ control language="C#" autoeventwireup="true" inherits="cbmsWA.UserControls.AddUser" codebehind="AddUser.ascx.cs" %>

<%@ register tagprefix="telerik" namespace="Telerik.Web.UI" assembly="Telerik.Web.UI" %>
<telerik:radajaxmanager id="RadAjaxManager1" runat="server">
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
                           </telerik:radajaxmanager>
<telerik:radajaxloadingpanel runat="server" skin="Metro" id="ldp" transparency="30">

                           </telerik:radajaxloadingpanel>

<asp:panel id="pnl" runat="server">
                               <asp:Label Font-Bold="true" ID="result" Font-Size="18px" ForeColor="Red" runat="server"></asp:Label>
<fieldset class="lg">
<legend>Add New User</legend><br />
    <asp:Label runat="server" ID="CreateAccountResults" Font-Size="18px" Font-Bold="True"></asp:Label><br />
<div style="float: left">
 &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="1.1em" 
    ForeColor="#034A81">Main Info:</asp:Label>
<br /><br />
 <table class="tbl">
     <tr>
         <td>Location :</td><td><telerik:RadComboBox ID="cmbloc" AutoPostBack="true" runat="server" Skin="Bootstrap" OnSelectedIndexChanged="cmbloc_SelectedIndexChanged">
         <Items>
             <telerik:RadComboBoxItem runat="server" Text="" Value="0" />
             <telerik:RadComboBoxItem runat="server" Text="Head Office" Value="1" />
             <telerik:RadComboBoxItem runat="server" Text="Region" Value="2" />
             <telerik:RadComboBoxItem runat="server" Text="Station" Value="3" />
         </Items>
         </telerik:RadComboBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="cmbloc" Display="Dynamic" ValidationGroup="user" runat="server"></asp:RequiredFieldValidator>
                            </td>
     </tr>
    <tr>
        <td><asp:Label ID="Label" CssClass="control-label" runat="server" Text="Staff ID : "></asp:Label></td> 
       <td> <asp:TextBox CssClass="form-control" ID="txtuser" runat="server"></asp:TextBox>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="txtuser" Display="Dynamic" ValidationGroup="user" runat="server"></asp:RequiredFieldValidator>
       </td>
        <td width="20px"></td>
</tr>
     <tr>
         <td>Employee Name :</td><td><asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="txtname" Display="Dynamic" ValidationGroup="user" runat="server"></asp:RequiredFieldValidator>
                                 </td>
     </tr>
     <tr>
         <td>
             Employee Position :
         </td>
         <td>
             <asp:TextBox runat="server" ID="txtpos" CssClass="form-control"></asp:TextBox>
             <asp:RequiredFieldValidator runat="server" ID="txtpostrequired" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="txtpos" Display="Dynamic" ValidationGroup="user"></asp:RequiredFieldValidator>
          </td>
     </tr>
<tr>

 <td><asp:Label ID="Label2" CssClass="control-label" runat="server" Text="Password : "></asp:Label></td>
        <td> <asp:TextBox ID="txtpass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
            <asp:Label ID="TextBox1_HelpLabel" runat="server" /><br />
           <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="txtpass" Display="Dynamic" ValidationGroup="user" runat="server"></asp:RequiredFieldValidator>
            <ajaxtoolkit:passwordstrength runat="server" CalculationWeightings="50;15;15;20" 
                MinimumLowerCaseCharacters="1" MinimumNumericCharacters="1" MinimumSymbolCharacters="1" 
                MinimumUpperCaseCharacters="1" PreferredPasswordLength="8" TargetControlID="txtpass" 
                TextStrengthDescriptions="Very Poor;Weak;Average;Strong" 
                HelpStatusLabelID="TextBox1_HelpLabel" TextStrengthDescriptionStyles="poor;weak;average;strong" RequiresUpperAndLowerCaseCharacters="True">

            </ajaxtoolkit:passwordstrength>
             </td>
</tr>
       <tr>
        <td><asp:Label ID="Label3" runat="server" Text="Email : "></asp:Label></td>
       
    
        <td><asp:TextBox ID="txtemail" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="txtemail" Display="Dynamic" ValidationGroup="user" runat="server"></asp:RequiredFieldValidator>
        </td>
       </tr>
          <tr><td>Bureau :</td><td><telerik:RadComboBox runat="server" EmptyMessage="Select Bureau" ID="cmbBureau" Width="300px" DataTextField="Location" DataValueField="BureauID" Skin="Bootstrap" DataSourceID="SqlDataSource5"></telerik:RadComboBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="cmbBureau" Display="Dynamic" ValidationGroup="u" runat="server"></asp:RequiredFieldValidator>
         <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [BureauID], [Location] FROM [Bureaus]"></asp:SqlDataSource>
         </td></tr>
       <tr>
     <tr><td>Region :</td><td><telerik:RadComboBox runat="server" EmptyMessage="Select Region" ID="cmbarea" Width="300px" DataTextField="AreaName" DataValueField="AreaID" Skin="Bootstrap" DataSourceID="SqlDataSource4"></telerik:RadComboBox>
         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="cmbarea" Display="Dynamic" ValidationGroup="u" runat="server"></asp:RequiredFieldValidator>
         <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [AreaID], [AreaName] FROM [Area]"></asp:SqlDataSource>
         </td></tr>
       <tr>
       <td>Station :</td>
           <td>
       <telerik:RadComboBox ID="cmbs" runat="server" Skin="Bootstrap" EmptyMessage="Select Station" DataSourceID="SqlDataSource2" DataTextField="StationName" Width="300px" DataValueField="StationID"></telerik:RadComboBox>
             <asp:RequiredFieldValidator ID="RequiredFieldValidator17" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="cmbs" Display="Dynamic" ValidationGroup="user" runat="server"></asp:RequiredFieldValidator>

               <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [StationID], [StationName] FROM [Station]"></asp:SqlDataSource>
<asp:RequiredFieldValidator ID="srfv" ErrorMessage="required" Font-Bold="true" ForeColor="Red" ControlToValidate="cmbs" Display="Dynamic" ValidationGroup="u" runat="server"></asp:RequiredFieldValidator>
       </td>
       </tr>
       <tr>
       <td>
       Department :
       </td>
           <td><telerik:RadComboBox runat="server" EmptyMessage="Select Department" DataSourceID="SqlDataSource3" ID="dept" Width="300px" DataTextField="DepartmentName" DataValueField="DepartmentId" Skin="Bootstrap"></telerik:RadComboBox>
               <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
           <asp:RequiredFieldValidator ErrorMessage="required" ControlToValidate="dept" ForeColor="Red" Font-Bold="true" ValidationGroup="user" runat="server"></asp:RequiredFieldValidator>
           </td>
       </tr>
    </table>
   </div>
  <br />

  <div style="float:left;">
      
  
        <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="1.1em" 
    ForeColor="#034A81">Roles:</asp:Label><br />
  <asp:CheckBoxList ID="UserRoles" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" RepeatLayout="Table" CssClass="checkbox"  /> 
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
           ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
           SelectCommand="SELECT [GroupId], [GroupName] FROM [UserGroups]">
       </asp:SqlDataSource>
           </div><br /><br />
          <%-- <div class="clear"></div>--%>
           <div style="width: 600px;margin-top:25px; clear:both;text-align:right">
              <br /><br />
            <asp:Button ID="btnUser" runat="server" Text="Create User" onclick="btnUser_Click" ValidationGroup="user" 
        CssClass="btn btn-primary" />
           </div>
           </fieldset>
</asp:panel>
