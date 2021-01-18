<%@ page title="Add Users" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.AddUsers" codebehind="AddUsers.aspx.cs" %>

<%@ register src="UserControls/AddUser.ascx" tagname="AddUser" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .poor{
            color:red;
        }
        .weak{
            color:Red;
        }
        .average{
            color:yellow;
        }
        .strong{
            color:green;
        }
    </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <uc1:AddUser ID="AddUser1" runat="server" />
</asp:content>

