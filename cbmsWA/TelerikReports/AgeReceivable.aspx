<%@ page title="" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.TelerikReports.AgeReceivable" codebehind="AgeReceivable.aspx.cs" %>

<%@ register assembly="Telerik.ReportViewer.WebForms, Version=10.0.16.113, Culture=neutral, PublicKeyToken=a9d7983dfcc261be" namespace="Telerik.ReportViewer.WebForms" tagprefix="telerik" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        #ContentPlaceHolder1_ReportViewer1_ReportToolbar_NavGr_CurrentPage_CurrentPage {
            padding: 0;
            height: 18px;
        }

        #ContentPlaceHolder1_ReportViewer1_ReportToolbar_ExportGr_FormatList_DropDownList {
            padding: 0;
        }

        #ContentPlaceHolder1_ReportViewer1_ParametersAreaCell {
            width: 75%;
        }

        #ContentPlaceHolder1_ReportViewer1ParametersArea {
            width: 75%;
        }
    </style>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    
        <fieldset>
        <legend>
            Aged Receivables
      </legend>  
    <telerik:ReportViewer ID="ReportViewer" runat="server" Width="100%" Height="800px">
       <typereportsource typename="CbmsLib.Report1, CbmsLib, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null"></typereportsource>
    </telerik:ReportViewer>

    </fieldset>
</asp:content>

