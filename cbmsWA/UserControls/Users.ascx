<%@ control language="C#" autoeventwireup="true" inherits="cbmsWA.UserControls.Users" codebehind="Users.ascx.cs" %>
<%@ register tagprefix="telerik" namespace="Telerik.Web.UI" assembly="Telerik.Web.UI" %>

<asp:hiddenfield id="HiddenField1" runat="server" />

<telerik:radgrid id="gdUsers" runat="server" gridlines="None" allowfilteringbycolumn="true" oninit="gdUsers_Init" autogeneratecolumns="False" cellspacing="0" skin="Office2010Blue" onneeddatasource="gdUsers_NeedDataSource">
<MasterTableView Font-Size="Small">
<CommandItemSettings ExportToPdfText="Export to Pdf"></CommandItemSettings>

<RowIndicatorColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</RowIndicatorColumn>

<ExpandCollapseColumn>
<HeaderStyle Width="20px"></HeaderStyle>
</ExpandCollapseColumn>
    <Columns>
        <telerik:GridTemplateColumn DataField="username" HeaderText="Staff ID"
            UniqueName="column2">
           
            <ItemTemplate>
               <%-- <asp:Label ID="usernameLabel" runat="server" Text='<%# Eval("usrname") %>'></asp:Label>--%>
                <a href="EditUser.aspx?username=<%# Eval("username") %>" style="text-decoration: underline; color: blue"><%# Eval("username")%></a>
            </ItemTemplate>
            
        </telerik:GridTemplateColumn>
        <telerik:GridBoundColumn DataField="employeename" HeaderText="Name" UniqueName="column">
           
        </telerik:GridBoundColumn>
        <telerik:GridDateTimeColumn DataField="createdate" DataFormatString="{0:d}" AllowFiltering="false" HeaderText="Creation Date" UniqueName="column1">
          
            <%-- <telerik:GridDateTimeColumn DataField="lastlogindate" AllowFiltering="false" HeaderText="Last Login Date" 
            UniqueName="column10">
           
        </telerik:GridDateTimeColumn>--%>


        </telerik:GridDateTimeColumn>
        <telerik:GridDateTimeColumn DataField="lastlogindate" AllowFiltering="false" HeaderText="Last Login Date" 
            UniqueName="column3">
           
        </telerik:GridDateTimeColumn>
        <telerik:GridDateTimeColumn DataField="lastactivitydate" AllowFiltering="false" 
            HeaderText="Last Activity Date" UniqueName="column4">
           
        </telerik:GridDateTimeColumn>
        <telerik:GridTemplateColumn DataField="isapproved" HeaderText="Is Active" AllowFiltering="false" 
            UniqueName="column5">
           
            <ItemTemplate>
               <%-- <asp:Label ID="isapprovedLabel" runat="server" Text='<%# GetActiveStatus(Eval("isapproved").ToString()) %>'></asp:Label>--%>
                 <asp:Label ID="isapprovedLabel" runat="server" Text='<%# Eval("isapproved") %>'></asp:Label>
            </ItemTemplate>
           
        </telerik:GridTemplateColumn>
        <telerik:GridTemplateColumn DataField="islockedout" AllowFiltering="false" HeaderText="Is Locked Out" 
            UniqueName="column6">
            
            <ItemTemplate>
                <%--<asp:Label ID="islockedoutLabel" runat="server" Text='<%# GetAccessStatus(Eval("islockedout").ToString()) %>'></asp:Label>--%>
                <asp:Label ID="islockedoutLabel" runat="server" Text='<%# Eval("islockedout") %>'></asp:Label>
            </ItemTemplate>
           <%-- <HeaderStyle Font-Bold="True" />--%>
        </telerik:GridTemplateColumn>
       
    </Columns>

<EditFormSettings>
<EditColumn FilterControlAltText="Filter EditCommandColumn column"></EditColumn>
</EditFormSettings>
   <%-- <HeaderStyle Font-Bold="True" Font-Names="Arial" Font-Size="Small" />--%>
</MasterTableView>

<FilterMenu EnableImageSprites="False"></FilterMenu>

<HeaderContextMenu EnableImageSprites="True" CssClass="GridContextMenu GridContextMenu_Default"></HeaderContextMenu>
    </telerik:radgrid>
<br />


