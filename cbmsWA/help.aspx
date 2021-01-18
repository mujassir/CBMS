<%@ Page Language="C#" Title="CBMS Help" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="help.aspx.cs" Inherits="cbmsWA.help" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
     <fieldset>
        <legend>CBMS Help</legend>

         <telerik:RadSplitter ID="RadSplitter1" runat="server" Width="859" Height="800px">
             <telerik:RadPane ID="RadPane1" Width="859" ContentUrl="~/manual/manual.pdf" runat="server"></telerik:RadPane>
         </telerik:RadSplitter>










         </fieldset>
    </asp:content>
