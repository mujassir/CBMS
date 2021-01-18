<%@ page title="Cash Transaction Type" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.cashtranstype" codebehind="cashtranstype.aspx.cs" %>

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
    <fieldset>
        <legend>Cash Transaction Types</legend>
        <%--<table class="tbl">
           <tr>
                <td>Area Code : </td><td><asp:TextBox ID="txtareaid" CssClass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ErrorMessage="required" ValidationGroup="area" ControlToValidate="txtareaid" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator1"></asp:RequiredFieldValidator>
                   
                </td>
            </tr>
            <tr>
                <td>Area Name : </td><td><asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ErrorMessage="required" ControlToValidate="txtname" ValidationGroup="area" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator2"></asp:RequiredFieldValidator></td>
            </tr>
             <tr>
                <td>Station :</td><td>
                    <telerik:RadComboBox ID="cmb" AppendDataBoundItems="true" DataTextField="stationname" DataValueField="stationid" runat="server" Skin="Bootstrap" DataSourceID="SqlDataSource1">
                        <Items>
                            <telerik:RadComboBoxItem Value="" Text="" />
                        </Items>
                    </telerik:RadComboBox>
                   
                </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="cmb" ValidationGroup="area" ForeColor="Red" Font-Bold="true" ErrorMessage="required" runat="server"></asp:RequiredFieldValidator></td>
            </tr>
            <tr>
              <td></td>  <td colspan="2"><asp:Button CssClass="btn btn-primary" ID="btnadd" ValidationGroup="area" Text="Add" runat="server" /></td>
            </tr>
        </table>--%><br />
        <telerik:RadGrid runat="server" ID="grid" AutoGenerateColumns="False" AllowPaging="True" PageSize="20" GroupPanelPosition="Top" DataSourceID="EntityDataSource1" Skin="Office2010Blue" AllowAutomaticDeletes="True" AllowAutomaticInserts="True" AllowAutomaticUpdates="True">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="CashTransTypeID" Font-Size="Small" EditFormSettings-EditColumn-InsertText="Save" EditFormSettings-EditColumn-ButtonType="PushButton" CommandItemSettings-AddNewRecordText="Add New Transaction Type" CommandItemDisplay="Top" DataSourceID="EntityDataSource1" EditMode="EditForms">
                <Columns>
                    <telerik:GridEditCommandColumn HeaderText="Edit" ButtonType="ImageButton">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" HeaderText="Delete" CommandName="Delete" ConfirmText="Are you sure you want to delete this record?" FilterControlAltText="Filter column column" UniqueName="column">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn DataField="CashTransTypeID" FilterControlAltText="Filter CashTransTypeID column" HeaderText="Cash Trans Type ID" ReadOnly="True" SortExpression="CashTransTypeID" UniqueName="CashTransTypeID" DataType="System.Int32">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CashTransTypeDesc" HeaderText="Description">

                    </telerik:GridBoundColumn>
                  <%--  <telerik:GridTemplateColumn DataField="CashTransTypeDesc" FilterControlAltText="Filter CashTransTypeDesc column" HeaderText="Description" SortExpression="CashTransTypeDesc" UniqueName="CashTransTypeDesc">
                        <EditItemTemplate>
                            <asp:TextBox ID="CashTransTypeDescTextBox" runat="server" Text='<%# Bind("CashTransTypeDesc") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="CashTransTypeDescLabel" runat="server" Text='<%# Eval("CashTransTypeDesc") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>
                    <telerik:GridNumericColumn DataField="AcctCode" MaxLength="10" DecimalDigits="0" HeaderText="Account Code"></telerik:GridNumericColumn>
               <%--     <telerik:GridTemplateColumn DataField="AcctCode" FilterControlAltText="Filter AcctCode column" HeaderText="Account Code" SortExpression="AcctCode" UniqueName="AcctCode">
                        <EditItemTemplate>
                            <telerik:RadNumericTextBox ID="AcctCodeTextBox" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Skin="Bootstrap" MaxLength="7" DbValue='<%# Bind("AcctCode") %>' runat="server"></telerik:RadNumericTextBox>
                         
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="AcctCodeLabel" runat="server" Text='<%# Eval("AcctCode") %>'></asp:Label>
                        </ItemTemplate>
                    </telerik:GridTemplateColumn>--%>
                  <%--  <telerik:GridBoundColumn DataField="AffectAccount" MaxLength="1" FilterControlAltText="Filter AffectAccount column" HeaderText="Affect Account" SortExpression="AffectAccount" UniqueName="AffectAccount">
                    </telerik:GridBoundColumn>--%>
                   
                </Columns>
                  <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SikatoEntities" DefaultContainerName="SikatoEntities" EnableFlattening="False" OrderBy="it.[CashTransTypeID] desc" EntitySetName="CashTransactionTypes" EnableInsert="true" EnableDelete="True" EnableUpdate="True">
        </asp:EntityDataSource>
    </fieldset>
      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [StationId], [StationName] FROM [Station]"></asp:SqlDataSource>
                               </asp:Panel>
</asp:content>

