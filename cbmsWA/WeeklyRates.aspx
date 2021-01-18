<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="WeeklyRates.aspx.cs" Inherits="cbmsWA.WeeklyRates" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <fieldset>
     <asp:Label runat="server" ID="result" ForeColor="Red" Font-Bold="true" ></asp:Label>

        <legend>BOG - Weekly Rates</legend>

  <asp:Label runat="server" ID="bureau" Visible="false" Font-Bold="true" ></asp:Label>
  <asp:Label runat="server" ID="company" Visible="false" Font-Bold="true" ></asp:Label>
  <asp:Label runat="server" ID="userid" Visible="false" Font-Bold="true" ></asp:Label>
                  <table class="tbl" style="width:90%"> 
<tr><td>Start Date</td>
<td>        
                           <telerik:RadDatePicker ID="startDate" runat="server">
                           </telerik:RadDatePicker>
                           <asp:RequiredFieldValidator ID="stDate" runat="server" controltovalidate="startDate" display="Dynamic" EnableClientScript="true" font-bold="true" forecolor="Red" text="required" validationgroup="cust"></asp:RequiredFieldValidator>
                       </td>

</tr>
<tr><td>End Date Date</td>
<td>        
                           <telerik:RadDatePicker ID="endDate" runat="server"></telerik:RadDatePicker>
                           <asp:RequiredFieldValidator ID="enDate" runat="server" controltovalidate="endDate" display="Dynamic" EnableClientScript="true" font-bold="true" forecolor="Red" text="required" validationgroup="cust"></asp:RequiredFieldValidator>
                       </td>

</tr>
         <tr>
                 <td colspan="4" align="right"><asp:Button ID="btngen"  runat="server" CssClass="btn btn-primary" Text="Generate Report" OnClick="btngen_Click"  />

                            </td> </tr>
                </table>
           </fieldset>
</asp:Content>
