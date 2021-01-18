<%@ page title="Add Area" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.addarea" codebehind="addarea.aspx.cs" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
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
<%--     <a href="addarea.aspx">addarea.aspx</a> --%>
                           <asp:Panel ID="pnl" runat="server">
                               <asp:Label Font-Bold="true" ID="result" Font-Size="18px" ForeColor="Red" runat="server"></asp:Label>
    <fieldset>
        <legend>Add Area</legend>
        <table class="tbl">
            <tr>
                <td>Area ID : </td><td><telerik:RadNumericTextBox Type="Number" BackColor="White" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" ID="txtareaid" Enabled="false" CssClass="form-control" runat="server" Skin="Bootstrap"></telerik:RadNumericTextBox></td>
                <td><asp:RequiredFieldValidator ErrorMessage="required" ValidationGroup="area" ControlToValidate="txtareaid" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator1"></asp:RequiredFieldValidator>
                   
                </td>
            </tr>
            <tr>
                <td>Area Name : </td><td><asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ErrorMessage="required" ControlToValidate="txtname" ValidationGroup="area" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator2"></asp:RequiredFieldValidator></td>
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
              <td></td>  <td colspan="2"><asp:Button CssClass="btn btn-primary" ID="btnadd" ValidationGroup="area" Text="Save" runat="server" OnClick="btnadd_Click" /></td>
            </tr>
        </table><br />
<%--        <telerik:RadGrid runat="server" ID="grid" AutoGenerateColumns="false" AllowPaging="True" OnInit="grid_Init" GroupPanelPosition="Top" DataSourceID="EntityDataSource1" Skin="Office2010Blue" OnItemCommand="grid_ItemCommand" OnItemDataBound="grid_ItemDataBound">--%>
        <telerik:RadGrid runat="server" ID="grid" DataSourceID="sqlDataSource7" AutoGenerateColumns="false" AllowPaging="True" OnInit="grid_Init" GroupPanelPosition="Top" Skin="Office2010Blue" OnItemCommand="grid_ItemCommand" OnItemDataBound="grid_ItemDataBound">

<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="AreaID" Font-Size="Small" AllowFilteringByColumn="true" DataSourceID="sqlDataSource7" EditMode="EditForms">
                <EditFormSettings EditColumn-ButtonType="PushButton" EditColumn-ItemStyle-Font-Bold="true"></EditFormSettings>
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" HeaderText="Edit">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" HeaderText="Delete" ConfirmText="Are you sure you want to delete this record?" CommandName="Delete" FilterControlAltText="Filter column column" UniqueName="column">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn DataField="AreaId" AllowFiltering="false" FilterControlAltText="Filter AreaId column" HeaderText="Area Id" ReadOnly="True" SortExpression="AreaId" UniqueName="AreaId">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="AreaName" FilterControlWidth="120px" FilterControlAltText="Filter AreaName column" HeaderText="Area Name" SortExpression="AreaName" UniqueName="AreaName">
                    </telerik:GridBoundColumn>
                   <%--  <telerik:GridTemplateColumn HeaderText="Station" DataField="StationId" UniqueName="StationId">
                       <EditItemTemplate>
                           <telerik:RadComboBox ID="rcmb" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" SelectedValue='<%# Bind("StationId") %>' DataTextField="StationName" DataValueField="StationId" runat="server" Skin="Bootstrap">
                               <Items>
                                   <telerik:RadComboBoxItem Text="" />
                               </Items>
                           </telerik:RadComboBox>
                      
                            </EditItemTemplate>
                       <ItemTemplate>
                            <telerik:RadComboBox Visible="false" ID="rcmb" DataSourceID="SqlDataSource1" SelectedValue='<%# Bind("Stationid") %>' AppendDataBoundItems="true" DataTextField="StationName" DataValueField="StationId" runat="server">
                               <Items>
                                   <telerik:RadComboBoxItem Value="0" />
                               </Items>
                           </telerik:RadComboBox>
                           <asp:Label runat="server" ID="cmblbl"></asp:Label>
                       </ItemTemplate>
                   </telerik:GridTemplateColumn>--%>
                    <telerik:GridBoundColumn DataField="EntryBy" AllowFiltering="false" FilterControlAltText="Filter EntryBy column" HeaderText="Entry By" ReadOnly="true" SortExpression="EntryBy" UniqueName="EntryBy">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="EntryDate" AllowFiltering="false" DataType="System.DateTime" ReadOnly="true" FilterControlAltText="Filter EntryDate column" HeaderText="Entry Date" SortExpression="EntryDate" UniqueName="EntryDate">
                    </telerik:GridBoundColumn>
                </Columns>
                  <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
<%--        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=ModelEntities" DefaultContainerName="ModelEntities" EnableFlattening="False" OrderBy="it.[areaid] desc" EntitySetName="Areas">
        </asp:EntityDataSource>--%>

      <asp:SqlDataSource ID="sqlDataSource7" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Area]"></asp:SqlDataSource>

           </fieldset>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [StationId], [StationName] FROM [Station]"></asp:SqlDataSource>
                               </asp:Panel>
</asp:content>

