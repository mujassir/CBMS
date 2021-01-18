<%@ page title="Ranks" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.addrank" codebehind="addrank.aspx.cs" %>

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
        <legend>Add Rank</legend>
        <table class="tbl">
           
            <tr>
                <td>Rank : </td><td><asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox></td>
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
        <telerik:RadGrid runat="server" ID="grid" AutoGenerateColumns="False" AllowPaging="True" MasterTableView-EditFormSettings-EditColumn-ButtonType="PushButton" GroupPanelPosition="Top" AllowAutomaticDeletes="True" AllowAutomaticUpdates="True" Skin="Office2010Blue" DataSourceID="SqlDataSource1">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
            <MasterTableView DataKeyNames="RankId" Font-Size="Small" DataSourceID="SqlDataSource1">
                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" HeaderText="Edit">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" HeaderText="Delete" CommandName="Delete" FilterControlAltText="Filter column column" UniqueName="column">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn DataField="RankId" DataType="System.Int32" FilterControlAltText="Filter RankId column" HeaderText="Rank Id" ReadOnly="True" SortExpression="RankId" UniqueName="RankId">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="RankName" FilterControlAltText="Filter RankName column" HeaderText="Rank Name" SortExpression="RankName" UniqueName="RankName">
                    </telerik:GridBoundColumn>
                </Columns>
                  <EditFormSettings>
                    <EditColumn FilterControlAltText="Filter EditCommandColumn1 column" UniqueName="EditCommandColumn1">
                    </EditColumn>
                </EditFormSettings>
            </MasterTableView>
        </telerik:RadGrid>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Rank] WHERE [RankId] = @RankId" InsertCommand="INSERT INTO [Rank] ([RankName]) VALUES (@RankName)" SelectCommand="SELECT * FROM [Rank]" UpdateCommand="UPDATE [Rank] SET [RankName] = @RankName WHERE [RankId] = @RankId">
            <DeleteParameters>
                <asp:Parameter Name="RankId" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="RankName" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="RankName" Type="String" />
                <asp:Parameter Name="RankId" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </fieldset>
                               </asp:Panel>
</asp:content>

