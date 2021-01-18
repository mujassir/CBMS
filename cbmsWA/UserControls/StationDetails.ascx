<%@ control language="C#" autoeventwireup="true" inherits="cbmsWA.UserControls.StationDetails" codebehind="StationDetails.ascx.cs" %>
<%@ register tagprefix="telerik" namespace="Telerik.Web.UI" assembly="Telerik.Web.UI" %>
<table class="tbl">
    <tr>
        <td>Station Name :</td>
        <td>
            <asp:textbox id="name" runat="server" text='<%#Bind("StationName") %>'></asp:textbox>
        </td>
        <td>Cost Centre :</td>
        <td>
            <asp:textbox id="costcentre" text='<%# Bind("costcentre") %>' cssclass="form-control" runat="server"></asp:textbox>
        </td>
    </tr>
    <tr>
        <td>Area :
        </td>
        <td>
            <asp:dropdownlist id="ddl" enabled="false" runat="server" datatextfield="AreaName" datavaluefield="AreaID" selectedvalue='<%# DataBinder.Eval(Container, "DataItem.AreaID") %>'
                datasourceid='SqlDataSource1' appenddatabounditems="True">
                <asp:ListItem Selected="True" Text="Select" Value="">
                </asp:ListItem>
            </asp:dropdownlist>
        </td>
        <td>Location :</td>
        <td>
            <asp:textbox id="txtlocation" text='<%# Bind("location") %>' cssclass="form-control" runat="server"></asp:textbox>
        </td>
    </tr>
    <tr>
        <td>Station Tel No :</td>
        <td>
            <asp:textbox id="stn" runat="server" text='<%#Bind("StationTelNo") %>'></asp:textbox>
        </td>
        <td>Credit Code :</td>
        <td>
            <asp:textbox id="cc" text='<%# Bind("CreditCode") %>' cssclass="form-control" runat="server"></asp:textbox>
        </td>
    </tr>
    <tr>
        <td>Government Credit :</td>
        <td>
            <asp:textbox id="gc" text='<%# Bind("GovtCredit") %>' cssclass="form-control" runat="server"></asp:textbox>
        </td>
    </tr>
    <tr>
        <td align="right" colspan="4">
            <asp:button id="btnUpdate" text='<%# (Container is GridEditFormInsertItem) ? "Insert" : "Update" %>'
                runat="server" commandname='<%# (Container is GridEditFormInsertItem) ? "PerformInsert" : "Update" %>'></asp:button>
            &nbsp;
                                    <asp:button id="btnCancel" text="Cancel" runat="server" causesvalidation="False"
                                        commandname="Cancel"></asp:button>
        </td>
    </tr>
</table>
<asp:sqldatasource id="SqlDataSource1" runat="server" connectionstring="<%$ ConnectionStrings:DefaultConnection %>" selectcommand="SELECT [AreaID], [AreaName] FROM [Area]"></asp:sqldatasource>
