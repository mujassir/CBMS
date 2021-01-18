<%@ page title="Departments" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.adddepartment" codebehind="adddepartment.aspx.cs" %>

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
                           <telerik:RadAjaxLoadingPanel runat="server" Skin="Bootstrap" ID="ldp" Transparency="30">

                           </telerik:RadAjaxLoadingPanel>

                           <asp:Panel ID="pnl" runat="server">
                               <asp:Label Font-Bold="true" ID="result" Font-Size="18px" ForeColor="Red" runat="server"></asp:Label>
    <fieldset>
        <legend>Add Department</legend>
        <table class="tbl">
           
            <tr>
                <td>Department Name : </td><td><asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ErrorMessage="required" ControlToValidate="txtname" ValidationGroup="emp" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator2"></asp:RequiredFieldValidator></td>
            </tr>
            <%-- <tr>
                <td>Station :</td><td>
                    <telerik:RadComboBox ID="cmb" AppendDataBoundItems="true" DataTextField="stationname" DataValueField="stationid" runat="server" Skin="Bootstrap" DataSourceID="SqlDataSource1">
                        <Items>
                            <telerik:RadComboBoxItem Value="" Text="" />
                        </Items>
                    </telerik:RadComboBox>
                   
                </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="cmb" ValidationGroup="area" ForeColor="Red" Font-Bold="true" ErrorMessage="required" runat="server"></asp:RequiredFieldValidator></td>
            </tr>--%>
            <tr>
              <td></td>  <td colspan="2"><asp:Button CssClass="btn btn-primary" ID="btnadd" ValidationGroup="emp" Text="Save" runat="server" OnClick="btnadd_Click" /></td>
            </tr>
        </table><br />
        <telerik:RadGrid runat="server" ID="grid" AutoGenerateColumns="False" AllowPaging="True" MasterTableView-EditFormSettings-EditColumn-ButtonType="PushButton" GroupPanelPosition="Top" AllowAutomaticDeletes="true" AllowAutomaticUpdates="true" Skin="Office2010Blue" OnItemCommand="grid_ItemCommand" OnItemDataBound="grid_ItemDataBound" DataSourceID="SqlDataSource1">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="DepartmentId" Font-Size="Small" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridEditCommandColumn HeaderText="Edit" ButtonType="ImageButton">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" HeaderText="Delete" CommandName="Delete" ConfirmText="Are you sure you want to delete this record?" FilterControlAltText="Filter column column" UniqueName="column">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn DataField="DepartmentId" Visible="false" DataType="System.Int32" FilterControlAltText="Filter DepartmentId column" HeaderText="Department Id" ReadOnly="True" SortExpression="DepartmentId" UniqueName="DepartmentId">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="DepartmentName" FilterControlAltText="Filter DepartmentName column" HeaderText="Department Name" SortExpression="DepartmentName" UniqueName="DepartmentName">
                    </telerik:GridBoundColumn>
                </Columns>
                  <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Departments] WHERE [DepartmentId] = @DepartmentId" InsertCommand="INSERT INTO [Departments] ([DepartmentName]) VALUES (@DepartmentName)" SelectCommand="SELECT * FROM [Departments] order by departmentid desc" UpdateCommand="UPDATE [Departments] SET [DepartmentName] = @DepartmentName WHERE [DepartmentId] = @DepartmentId">
            <DeleteParameters>
                <asp:Parameter Name="DepartmentId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="DepartmentName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="DepartmentName" Type="String" />
                <asp:Parameter Name="DepartmentId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </fieldset>
                               </asp:Panel>
</asp:content>

