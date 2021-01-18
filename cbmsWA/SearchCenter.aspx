<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="SearchCenter.aspx.cs" Inherits="cbmsWA.SearchCenter" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
      <style>
          .tb {
              border-collapse: separate;
          }

              .tb td {
                  padding: 5px;
              }
      </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <fieldset>
     <asp:Label runat="server" ID="result" ForeColor="Red" Font-Bold="true" ></asp:Label>

        <legend>Search Center</legend>

  <asp:Label runat="server" ID="area" Visible="false" Font-Bold="true" ></asp:Label>
  <asp:Label runat="server" ID="formid" Visible="false" Font-Bold="true" ></asp:Label>
                <table class="tbl" style="width:90%"> 
         <tr>
                 <td colspan="4" align="right"><asp:Button ID="btnref"  runat="server" CssClass="btn btn-primary" Text="Old,New Customer Accts." OnClick="btnref_Click" />

                 <td colspan="4" align="right"><asp:Button ID="bclose" ValidationGroup="AllValidators" runat="server" CssClass="btn btn-primary" Text="Close" OnClick="bclose_Click" />

                            </td> </tr>
                </table>
       <br />
      <telerik:RadGrid runat="server" ID="grid" GroupPanelPosition="Top" AllowFilteringByColumn="true" Skin="Office2010Blue" Font-Size="XX-Small" AllowPaging="true" PageSize="15" OnNeedDataSource="grid_NeedDataSource">
           <GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
           <MasterTableView AutoGenerateColumns="False" DataKeyNames="CustAccountID" Font-Size="Small" AllowMultiColumnSorting="True">
               <Columns>
                   <telerik:GridBoundColumn DataField="CustAccountID" HeaderText="Customer ID" SortExpression="CustAccountID" UniqueName="CustAccountID" DataType="System.Int32" FilterControlAltText="Filter CustAccountID column" ReadOnly="True"></telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="SurName" HeaderText="Surname" SortExpression="Surname" UniqueName="SurName" FilterControlAltText="Filter SurName column"></telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="OtherNames" HeaderText="OtherNames" SortExpression="OtherNames" UniqueName="OtherNames" FilterControlAltText="Filter OtherNames column"></telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="ServiceAddress" HeaderText="Service Address" SortExpression="ServiceAddress" UniqueName="ServiceAddress" FilterControlAltText="Filter ServiceAddress column"></telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="Stationid" HeaderText="Station" FilterControlAltText="Filter column Station" UniqueName="Stationid"></telerik:GridBoundColumn>
                   <telerik:GridBoundColumn DataField="MeterSerialNo" HeaderText="Meter No." FilterControlAltText="Filter column Meter" UniqueName="MeterSerialNo"></telerik:GridBoundColumn>
<%--                   <telerik:GridBoundColumn DataField="AccountStatusID" HeaderText="Status" FilterControlAltText="Filter column Status" UniqueName="AccountStatusID"></telerik:GridBoundColumn>--%>
                   <telerik:GridBoundColumn DataField="CustSeqNo" HeaderText="Seq. No." FilterControlAltText="Filter column SeqNo" UniqueName="CustSeqNo"></telerik:GridBoundColumn>

<%--                   <telerik:GridBoundColumn DataField="TariffId" HeaderText="Tariff" FilterControlAltText="Filter column Tariff" UniqueName="TariffId" ItemStyle-Width="12px"></telerik:GridBoundColumn>--%>
<%--                   <telerik:GridBoundColumn DataField="Cycleid" HeaderText="Cycle" FilterControlAltText="Filter column cycle" UniqueName="Cycleid"></telerik:GridBoundColumn>--%>
                   <telerik:GridBoundColumn DataField="Routeid" HeaderText="Route" FilterControlAltText="Filter column Route" UniqueName="Routeid"></telerik:GridBoundColumn>
<%--                   <telerik:GridBoundColumn DataField="CustSeqno" HeaderText="Seq No." FilterControlAltText="Filter column SeqNo" UniqueName="CustSeqno"></telerik:GridBoundColumn>--%>
<%--                   <telerik:GridBoundColumn DataField="GroupId" HeaderText="Group" FilterControlAltText="Filter column Group" UniqueName="Group"></telerik:GridBoundColumn>--%>
<%--                   <telerik:GridBoundColumn DataField="DateConnected" HeaderText="DateConnected" FilterControlAltText="Filter column DateConnected" UniqueName="DateConnected"></telerik:GridBoundColumn>--%>
               </Columns>
                 <NestedViewTemplate>
                    <table class="tbl">
                        <tr>
                            <td>Date Connected :</td><td><b><%# DateTime.Parse(Eval("DateConnected").ToString()).ToShortDateString() %></b></td>
                            <td>Cycle :</td><td><b><%# Eval("CycleId") %></b></td>
                            <td>Seq No. :</td><td><asp:Label ID="seq" Font-Bold="true" Text='<%# Eval("CustSeqNo") %>' runat="server"></asp:Label></td>
                            <td>Group :</td><td><asp:Label ID="grp" Text='<%# Eval("GroupId") %>' Font-Bold="true" runat="server"></asp:Label></td>
                            <td>Tariff :</td><td><asp:Label ID="Label1" Text='<%# Eval("TariffId") %>' Font-Bold="true" runat="server"></asp:Label></td>
                            <td>Account Status :</td><td><asp:Label ID="Label2" Text='<%# Eval("AccountStatusID") %>' Font-Bold="true" runat="server"></asp:Label></td>

                            
                       </tr>
                    </table>
                </NestedViewTemplate>
        </MasterTableView>
     </telerik:RadGrid>
       </fieldset>
</asp:Content>
