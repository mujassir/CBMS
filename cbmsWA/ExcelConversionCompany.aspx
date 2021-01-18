<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="ExcelConversionCompany.aspx.cs" Inherits="cbmsWA.ExcelConversionCompany" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
      <fieldset>
     <asp:Label runat="server" ID="result" ForeColor="Red" Font-Bold="true" ></asp:Label>

        <legend>BOG - Purchases and Sales Report</legend>

  <asp:Label runat="server" ID="bureau" Visible="false" Font-Bold="true" ></asp:Label>
  <asp:Label runat="server" ID="company" Visible="false" Font-Bold="true" ></asp:Label>
  <asp:Label runat="server" ID="userid" Visible="false" Font-Bold="true" ></asp:Label>
                  <table class="tbl" style="width:90%"> 
<tr><td>Start Date</td>
<td>   <telerik:RadDatePicker ID="startDate" runat="server">    </telerik:RadDatePicker>
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

   <div>  
        <asp:Button runat="server" Text="Fetch BOGStock Data" OnClick="Unnamed1_Click" />  
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Generate ExcelFile" />  
        <br />  <br />
         <div>  
     
        <asp:Button runat="server" ID="fetchBogWeekly" Text="Fetch BOGWRate Data" OnClick="Unnamed2_Click" />  
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Generate ExcelFile" />  
        <br />  
        <br />  
    </div>  
       <div>  
        <asp:Button runat="server" ID="Button3" Text="Fetch BOGWRate Data" OnClick="Unnamed3_Click" />  
        <asp:Button ID="Button4" runat="server" OnClick="Button3_Click" Text="Generate ExcelFile" />  
        <br />  
        <br />  
    </div>  


        <br />  

        <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical">  
            <AlternatingRowStyle BackColor="#DCDCDC" />  
            <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />  
            <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />  
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />  
            <RowStyle BackColor="#EEEEEE" ForeColor="Black" />  
            <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />  
            <SortedAscendingCellStyle BackColor="#F1F1F1" />  
            <SortedAscendingHeaderStyle BackColor="#0000A9" />  
            <SortedDescendingCellStyle BackColor="#CAC9C9" />  
            <SortedDescendingHeaderStyle BackColor="#000065" />  
        </asp:GridView>  
    </div>  


           </fieldset>
</asp:Content>
