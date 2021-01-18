<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="demo.aspx.cs" Inherits="cbmsWA.demo" %>

<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304" Namespace="CrystalDecisions.Web" TagPrefix="CR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <CR:CrystalReportViewer ID="CrystalReportViewer1" runat="server" AutoDataBind="True" 
            GroupTreeImagesFolderUrl="" Height="1202px"
            ToolbarImagesFolderUrl="" ToolPanelWidth="200px" Width="1104px" />
        <%--<CR:CrystalReportSource ID="CrystalReportSource1" runat="server">
            <Report FileName="CrystalReport8.rpt">
            </Report>
        </CR:CrystalReportSource>--%>
    </div>
    </form>
</body>
</html>
