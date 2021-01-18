<%@ page title="Add Station" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.addstation" codebehind="addstation.aspx.cs" %>

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
                           <telerik:RadAjaxLoadingPanel runat="server" Skin="Metro" ID="ldp" Transparency="50">

                           </telerik:RadAjaxLoadingPanel>

                           <asp:Panel ID="pnl" runat="server">
                               <asp:Label Font-Bold="true" ID="result" Font-Size="18px" ForeColor="Red" runat="server"></asp:Label>
    <fieldset>
        <legend>Add Station</legend>
        <table class="tbl">
            <tr>
                <td>Area :</td><td>
                    <telerik:RadComboBox ID="cmb" AppendDataBoundItems="true" AutoPostBack="true" OnSelectedIndexChanged="cmb_SelectedIndexChanged" DataTextField="areaname" DataValueField="areaid" runat="server" Skin="Bootstrap" DataSourceID="SqlDataSource1">
                        <Items>
                            <telerik:RadComboBoxItem Value="" Text="" />
                        </Items>
                    </telerik:RadComboBox>
                   
                </td>
                <td><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ControlToValidate="cmb" ValidationGroup="area" ForeColor="Red" Font-Bold="true" ErrorMessage="required" runat="server"></asp:RequiredFieldValidator></td>
                <td>Station ID : </td><td><telerik:RadNumericTextBox Type="Number" NumberFormat-DecimalDigits="0" NumberFormat-GroupSeparator="" Enabled="false" BackColor="White" ID="txtstationid" CssClass="form-control" runat="server" Skin="Bootstrap"></telerik:RadNumericTextBox></td>
                <td><asp:RequiredFieldValidator ErrorMessage="required" ValidationGroup="area" ControlToValidate="txtstationid" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator1"></asp:RequiredFieldValidator>
                   
                </td>
            </tr>
            <tr>
                <td>Station Name : </td><td><asp:TextBox ID="txtname" CssClass="form-control" runat="server"></asp:TextBox></td>
                <td><asp:RequiredFieldValidator ErrorMessage="required" ControlToValidate="txtname" ValidationGroup="area" Font-Bold="true" ForeColor="Red" runat="server" ID="RequiredFieldValidator2"></asp:RequiredFieldValidator></td>
                <td>Cost Centre :</td><td>
                   <asp:TextBox ID="costcentre" CssClass="form-control" runat="server"></asp:TextBox>
                   
                </td>
            </tr>
           <%-- <tr>
                
                <td>Location :</td><td>
                   <asp:TextBox ID="txtlocation" CssClass="form-control" runat="server"></asp:TextBox>
                   
                </td>
            </tr>--%>
             <tr>
                <td>Station Tel No :</td><td>
                   <asp:TextBox ID="txttelno" MaxLength="10" CssClass="form-control" runat="server"></asp:TextBox>
                   
                </td>
                <td></td>
           <td>Credit Code :</td><td>
                   <asp:TextBox ID="txtcc" CssClass="form-control" runat="server"></asp:TextBox>
                   
                </td>
                  </tr>
            <tr>
                <td>Government Credit :</td><td>
                   <asp:TextBox ID="txtgc" CssClass="form-control" runat="server"></asp:TextBox>
                   
                </td>
            </tr>
            <tr>
              <td></td>  <td style="text-align:right" colspan="4"><asp:Button CssClass="btn btn-primary" ID="btnadd" ValidationGroup="area" Text="Save" runat="server" OnClick="btnadd_Click" /></td>
            </tr>
        </table><br />
        <telerik:RadGrid runat="server" ID="grid" PageSize="20" OnInit="grid_Init" AllowPaging="True" AllowFilteringByColumn="true" OnNeedDataSource="grid_NeedDataSource" MasterTableView-EditFormSettings-EditColumn-ButtonType="PushButton" OnDeleteCommand="grid_DeleteCommand" OnPreRender="grid_PreRender" Skin="Office2010Blue" AllowAutomaticDeletes="True" OnItemDataBound="grid_ItemDataBound" OnItemCommand="grid_ItemCommand" AutoGenerateColumns="False">
<%--<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>--%>
            <MasterTableView DataKeyNames="StationID" Font-Size="Small" AllowAutomaticDeletes="True">
               
                
               <%-- <EditItemTemplate>
                   
                </EditItemTemplate>--%>

                <Columns>
                    <telerik:GridEditCommandColumn ButtonType="ImageButton" HeaderText="Edit">
                    </telerik:GridEditCommandColumn>
                    <telerik:GridButtonColumn ButtonType="ImageButton" HeaderText="Delete" CommandName="Delete" ConfirmText="Are you sure you want to delete this record?" FilterControlAltText="Filter column column" UniqueName="column">
                    </telerik:GridButtonColumn>
                    <telerik:GridBoundColumn DataField="StationID" FilterControlAltText="Filter StationId column" HeaderText="Station Id" ReadOnly="True" SortExpression="StationId" UniqueName="StationId">
                    </telerik:GridBoundColumn>

                    <telerik:GridBoundColumn DataField="StationName" FilterControlAltText="Filter StationName column" HeaderText="Station Name" SortExpression="StationName" UniqueName="StationName">
                    </telerik:GridBoundColumn>
                    <telerik:GridTemplateColumn HeaderText="Area" AllowFiltering="false" ReadOnly="true" DataField="AreaId" UniqueName="AreaId">
                       <EditItemTemplate>
                           <telerik:RadComboBox ID="rcmb" DataSourceID="SqlDataSource1" AppendDataBoundItems="true" SelectedValue='<%# Bind("areaid") %>' DataTextField="areaname" DataValueField="areaid" runat="server" Skin="Bootstrap">
                               <Items>
                                   <telerik:RadComboBoxItem Value="" Text="" />
                               </Items>
                           </telerik:RadComboBox>
                      
                            </EditItemTemplate>
                       <ItemTemplate>
                            <telerik:RadComboBox Visible="false" ID="rcmb" DataSourceID="SqlDataSource1" SelectedValue='<%# Bind("areaid") %>' DataTextField="areaname" DataValueField="AreaId" runat="server">
                               <Items>
                                   <telerik:RadComboBoxItem Text="" Value="" />
                               </Items>
                           </telerik:RadComboBox>
                           <asp:Label runat="server" ID="cmblbl"></asp:Label>
                       </ItemTemplate>
                   </telerik:GridTemplateColumn>
                 <%--   <telerik:GridBoundColumn DataField="Location" FilterControlAltText="Filter EntryBy column" HeaderText="Location" SortExpression="Location" UniqueName="Location">
                    </telerik:GridBoundColumn>--%>
                    <telerik:GridBoundColumn DataField="CreditCode" AllowFiltering="false" FilterControlAltText="Filter EntryDate column" HeaderText="Credit Code" SortExpression="Credit Code" UniqueName="CreditCode">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="CostCentre" AllowFiltering="false" FilterControlAltText="Filter EntryDate column" HeaderText="Cost Centre" SortExpression="Cost Centre" UniqueName="CostCentre">
                    </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="StationTelNo" AllowFiltering="false" Visible="false" FilterControlAltText="Filter EntryDate column" HeaderText="Station Tel No" SortExpression="stationtelno" UniqueName="StationTelNo">
                    </telerik:GridBoundColumn>
                    <telerik:GridBoundColumn DataField="GovtCredit" AllowFiltering="false" Visible="false" FilterControlAltText="Filter EntryDate column" HeaderText="GovtCredit" SortExpression="GovtCredit" UniqueName="GovtCredit">
                    </telerik:GridBoundColumn>
                </Columns>
              
                <NestedViewTemplate>
                    
                                               <table class="tbl">
                                                   <tr>
                                                      
                                                   <td></td> <td></td>   <td><b>Station Tel No :</b></td><td> <asp:Label ID="streetlabel" runat="server" Text='<%# Eval("StationTelNo") %>'></asp:Label></td>
                                                       <td><b>Government Credit :</b></td><td><asp:Label ID="suburblabel" runat="server" Text='<%# Eval("GovtCredit") %>'></asp:Label></td>
                                                       
                                                   </tr>
                                               </table>
                                          
                </NestedViewTemplate>
               
            </MasterTableView>
            
        </telerik:RadGrid>
        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=SikatoEntities" DefaultContainerName="SikatoEntities" EnableDelete="True" EnableFlattening="False" OrderBy="it.[stationid] desc" EntitySetName="Stations">
        </asp:EntityDataSource>
    </fieldset>
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [AreaID], [AreaName] FROM [Area]"></asp:SqlDataSource>
                               </asp:Panel>
</asp:content>

