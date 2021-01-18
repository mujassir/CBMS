<%@ page title="Manage User" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.EditUser" codebehind="EditUser.aspx.cs" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <fieldset>
        <legend>Manage User</legend>
        <asp:Label ID="UserUpdateMessage" runat="server" Font-Size="Small" Font-Bold="True"></asp:Label>
<br />
    <h4>&nbsp;Roles:</h4>
   
    <asp:CheckBoxList ID="UserRoles" RepeatColumns="4" RepeatDirection="Horizontal" RepeatLayout="Table" CssClass="checkbox" runat="server" DataTextField="RoleName" />
   
    
    <h4>&nbsp;Main Info:</h4>
        <div style="float:left">
    <asp:DetailsView AutoGenerateRows="False" DataSourceID="MemberData"
  ID="UserInfo" runat="server" OnItemUpdating="UserInfo_ItemUpdating" 
        Font-Names="Calibri" Font-Size="14px" Height="312px" Width="297px" CssClass="dtview">
        <Fields><asp:BoundField DataField="UserName" HeaderStyle-CssClass="detailheader" 
             HeaderText="User Name" ItemStyle-CssClass="detailitem" ReadOnly="True"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:BoundField>
            <asp:TemplateField HeaderText="Email"><EditItemTemplate><asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>' 
                     Width="160px"></asp:TextBox></EditItemTemplate><InsertItemTemplate><asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox></InsertItemTemplate><ItemTemplate><asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label></ItemTemplate><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:TemplateField>
            <asp:TemplateField HeaderText="Comment"><EditItemTemplate><asp:TextBox ID="TextBox1" runat="server" Height="38px" 
                     Text='<%# Bind("Comment") %>' TextMode="MultiLine" Width="173px"></asp:TextBox></EditItemTemplate><InsertItemTemplate><asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Comment") %>'></asp:TextBox></InsertItemTemplate><ItemTemplate><asp:Label ID="Label1" runat="server" Text='<%# Bind("Comment") %>'></asp:Label></ItemTemplate><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:TemplateField>
            <asp:CheckBoxField DataField="IsApproved" HeaderStyle-CssClass="detailheader" 
             HeaderText="Active User" ItemStyle-CssClass="detailitem"><HeaderStyle CssClass="detailheader" />
                <ItemStyle CssClass="detailitem" /></asp:CheckBoxField>
          <%--  <asp:CheckBoxField DataField="IsLockedOut" HeaderStyle-CssClass="detailheader" 
             HeaderText="Is Locked Out" ItemStyle-CssClass="detailitem" ReadOnly="false"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:CheckBoxField>
           --%>
             <asp:CheckBoxField DataField="IsLockedOut" HeaderStyle-CssClass="detailheader" 
             HeaderText="Is Locked Out" ItemStyle-CssClass="detailitem"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:CheckBoxField>

            <asp:CheckBoxField DataField="IsOnline" HeaderStyle-CssClass="detailheader" 
             HeaderText="Is Online" ItemStyle-CssClass="detailitem" ReadOnly="True"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:CheckBoxField><asp:BoundField DataField="CreationDate" HeaderStyle-CssClass="detailheader" 
             HeaderText="Creation Date" ItemStyle-CssClass="detailitem" 
             DataFormatString="{0:dd-MMM-yy, hh:mm}" ReadOnly="True"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:BoundField><asp:BoundField DataField="LastActivityDate" 
             DataFormatString="{0:dd-MMM-yy, hh:mm}" HeaderStyle-CssClass="detailheader" 
             HeaderText="Last Activity Date" ItemStyle-CssClass="detailitem" ReadOnly="True"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:BoundField><asp:BoundField DataField="LastLoginDate" 
             DataFormatString="{0:dd-MMM-yy, hh:mm}" HeaderStyle-CssClass="detailheader" 
             HeaderText="Last Login Date" ItemStyle-CssClass="detailitem" ReadOnly="True"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:BoundField><asp:BoundField DataField="LastLockoutDate" 
             DataFormatString="{0:dd-MMM-yy, hh:mm}" HeaderStyle-CssClass="detailheader" 
             HeaderText="Last Lockout Date" ItemStyle-CssClass="detailitem" ReadOnly="True"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:BoundField><asp:BoundField DataField="LastPasswordChangedDate" 
             DataFormatString="{0:dd-MMM-yy, hh:mm}" HeaderStyle-CssClass="detailheader" 
             HeaderText="Last Password Changed Date" ItemStyle-CssClass="detailitem" 
             ReadOnly="True"><HeaderStyle CssClass="detailheader" /><ItemStyle CssClass="detailitem" /></asp:BoundField><asp:CommandField ControlStyle-CssClass="btn btn-primary" ButtonType="Button" EditText="Edit User Info" 
             ShowEditButton="true">
<ControlStyle BorderStyle="None"></ControlStyle>
            </asp:CommandField>
        </Fields>
        </asp:DetailsView>
</div>
        <div style="float:left;margin-left:30px">
        <asp:DetailsView runat="server" ID="usersview" AutoGenerateRows="False" DataKeyNames="UserName" DataSourceID="SqlDataSource2">
            <Fields>
                <asp:BoundField DataField="UserName" HeaderText="User Name" ReadOnly="True" SortExpression="UserName" />
                <asp:TemplateField HeaderText="Department" SortExpression="DepartmentId">
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="dcm" EmptyMessage=" " CausesValidation="true" runat="server" SelectedValue='<%# Bind("DepartmentId") %>' DataTextField="DepartmentName" DataValueField="DepartmentId" DataSourceID="SqlDataSource5" Skin="Bootstrap"></telerik:RadComboBox>
                    </EditItemTemplate>
                   <ItemTemplate>
                         <telerik:RadComboBox ID="dcm" CausesValidation="true" Enabled="false" EmptyMessage=" " runat="server" SelectedValue='<%# Bind("DepartmentId") %>' DataTextField="DepartmentName" DataValueField="DepartmentId" DataSourceID="SqlDataSource5"></telerik:RadComboBox>

                   </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Area" SortExpression="AreaID">
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="acm" EmptyMessage=" " SelectedValue='<%# Bind("AreaID") %>' runat="server" DataTextField="AreaName" DataValueField="AreaId" DataSourceID="SqlDataSource3" Skin="Bootstrap"></telerik:RadComboBox>
                      </EditItemTemplate>
                   <ItemTemplate>
                         <telerik:RadComboBox ID="acm" Enabled="false" EmptyMessage=" " runat="server" SelectedValue='<%# Bind("AreaID") %>' DataTextField="AreaName" DataValueField="AreaId" DataSourceID="SqlDataSource3"></telerik:RadComboBox>
                    </ItemTemplate>
                </asp:TemplateField>
                 <asp:TemplateField HeaderText="Station" SortExpression="StationID">
                    <EditItemTemplate>
                        <telerik:RadComboBox ID="scm" EmptyMessage=" " SelectedValue='<%# Bind("StationID") %>' runat="server" DataTextField="StationName" DataValueField="StationId" DataSourceID="SqlDataSource4" Skin="Bootstrap"></telerik:RadComboBox>
                        <asp:RequiredFieldValidator ErrorMessage="required" ControlToValidate="scm" ValidationGroup="emp" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator2"></asp:RequiredFieldValidator>

                    </EditItemTemplate>
                    <ItemTemplate>
                         <telerik:RadComboBox ID="iscm" Enabled="false" EmptyMessage=" " SelectedValue='<%# Bind("StationID") %>' runat="server" DataTextField="StationName" DataValueField="StationId" DataSourceID="SqlDataSource4" Skin="Bootstrap"></telerik:RadComboBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Status">
                  <%--  <ItemTemplate>
                          <asp:TextBox runat="server" ID="remarkbox" Text='<%#Bind("remark")%>' TextMode="MultiLine" MaxLength="50"></asp:TextBox>
                    </ItemTemplate>--%>
                    <EditItemTemplate>
                        <asp:TextBox runat="server" ID="remarkbox" Text='<%#Bind("remark")%>' TextMode="MultiLine" MaxLength="50"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:CommandField ButtonType="Button" ValidationGroup="emp" ControlStyle-CssClass="btn btn-primary" ShowEditButton="True" >
<ControlStyle CssClass="btn btn-primary"></ControlStyle>
                </asp:CommandField>
            </Fields>

        </asp:DetailsView>
            <asp:SqlDataSource ID="SqlDataSource2" OnUpdated="SqlDataSoure2_Updated" FilterExpression="username='{0}'" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
                DeleteCommand="DELETE FROM [UserDetails] WHERE [UserName] = @UserName" 
                SelectCommand="SELECT * FROM [UserDetails]" 
                UpdateCommand="UPDATE [UserDetails] SET [AreaID] = @AreaID, [StationID] = @StationID, [DepartmentId] = @DepartmentId, [EntryBy] = @EntryBy, [EntryDate] = @EntryDate, [remark] = @remark WHERE [UserName] = @UserName">
               <FilterParameters>
		<asp:QueryStringParameter Name="username" QueryStringField="username" />
	</FilterParameters>
                 <DeleteParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="UserName" Type="String" />
                    <asp:Parameter Name="StationID" Type="Int32" />
                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                    <asp:Parameter Name="EntryBy" Type="String" />
                    <asp:Parameter Name="EntryDate" Type="DateTime" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter  Name="AreaID" Type="Int32" />
                    <asp:Parameter Name="StationID" Type="Int32" />
                    <asp:Parameter Name="DepartmentId" Type="Int32" />
                    <asp:Parameter Name="EntryBy" Type="String" />
                    <asp:Parameter Name="EntryDate" Type="DateTime" />
                    <asp:Parameter Name="remark" Type="String" />
                 <asp:Parameter Name="UserName" Type="String" />
                   <%-- <asp:QueryStringParameter Name="username" QueryStringField="username" />--%>
                </UpdateParameters>
            </asp:SqlDataSource>
</div>
    </fieldset>
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" 
           ProviderName="<%$ ConnectionStrings:DefaultConnection.ProviderName %>" >
    
    </asp:SqlDataSource>


<asp:ObjectDataSource ID="MemberData" runat="server" DataObjectTypeName="System.Web.Security.MembershipUser" 
    SelectMethod="GetUser" UpdateMethod="UpdateUser" TypeName="System.Web.Security.Membership">
	<SelectParameters>
		<asp:QueryStringParameter Name="username" QueryStringField="username" />
	</SelectParameters>
</asp:ObjectDataSource> 
     <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>'
          SelectCommand="SELECT * FROM [Departments]"></asp:SqlDataSource>
  <asp:SqlDataSource runat="server" ID="SqlDataSource6" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' 
      SelectCommand="SELECT * FROM [Station]"></asp:SqlDataSource>
     <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' 
         SelectCommand="SELECT * FROM [Area]"></asp:SqlDataSource>
     <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString='<%$ ConnectionStrings:DefaultConnection %>' 
         SelectCommand="SELECT [StationID],[StationName] FROM [Station]"></asp:SqlDataSource>
</asp:content>

