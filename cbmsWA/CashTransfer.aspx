<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="CashTransfer.aspx.cs" Inherits="cbmsWA.CashTransfer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
    <link href="assets/plugins/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/fontawesome.css" rel="stylesheet" />
    <link href="assets/plugins/SweetAlerts/sweetalert.css" rel="stylesheet" />
    <link href="css/allpage.css" rel="stylesheet" />


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset class="lg">
<legend>Enter Biginning Balances</legend><br />


<%--        ********** Peter ************--%>
<%--    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CashTransfers.aspx.cs" Inherits="forex.CashTransfers1" EnableEventValidation="false" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

   
    <link href="assets/plugins/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/fontawesome.css" rel="stylesheet" />
    <link href="assets/plugins/SweetAlerts/sweetalert.css" rel="stylesheet" />
    <link href="css/allpage.css" rel="stylesheet" />

    </head>

  <body class="container-fluid">
    <form class="form-horizontal" id="form1" runat="server"> 
    <div class="wrapper d-flex flex-column">
        <div class="header">
            <div class="left-box">
                <div class="wrap d-flex align-items-center">
                    <img src="images/css.jpg" height="40" class="logo-img"/>
                 <h4 class="app-name">Easy Bureau</h4>
                </div>

            </div>

                 <div class="middle-box">
           <asp:Label ID="LabeBureaName" CssClass="bureau" runat="server" Text=""></asp:Label>
            <asp:Label ID="BureauID" runat="server" type="hidden"></asp:Label>
            <asp:TextBox ID="Company1D" runat="server" type="hidden"></asp:TextBox>
          </div>
            <div class="right-box">
                <div class="userbox d-flex align-items-center">
                      <div class="user-pic">
                          <i class="fa fa-user-circle fa-2x"></i>
                      </div>
                        <div class="user-info">
                          <asp:Label ID="LabelUserS" CssClass="name" runat="server" Text=""></asp:Label>
                          <asp:TextBox ID="TextBoXUserS" runat="server" Type="hidden" CssClass="name"></asp:TextBox>
                          <asp:Label ID="LabelRank" runat="server" CssClass="role" style="color:white;display:block"></asp:Label>
                      </div>
                      <div class="logout">
                          <asp:Button ID="ButtLogoutS" runat="server" Text="Log Out" CssClass="btn btn-outline-primary" style="color:white;border-color:white" OnClick="ButtLogoutS_Click"/>
                      </div>
                  </div>
            </div>
      
        </div> <%--Header--%>--%>
            <asp:Label ID="LabeBureaName" CssClass="bureau" runat="server" Text=""></asp:Label>
            <asp:Label ID="bureauID" runat="server" type="hidden"></asp:Label>
            <asp:TextBox ID="Company1D" runat="server" type="hidden"></asp:TextBox>
                          <asp:Label ID="LabelUserS" CssClass="name" runat="server" Text=""></asp:Label>
                          <asp:TextBox ID="TextBoXUserS" runat="server" Type="hidden" CssClass="name"></asp:TextBox>
                          <asp:Label ID="LabelRank" runat="server" CssClass="role" style="color:white;display:block"></asp:Label>
        <div class="main-contents flex-grow-1">
            <div class="main-contents-wrap d-flex h-100">
                <div class="sidenav h-100">
                     <h6 class="col-form-label-lg text-center"style="color: #C70039;margin-top:20px">Menu</h6>
                       <div class="container-lg mb-3 pp">
                                        <ul>
                                             <li><a href="MainMenu.aspx"><span class="fa fa-home pfonts"></span>Home</a></li>
                                             <li><a href="Sales.aspx"><span class="fa fa-money-bill-wave pfonts"></span>Make Sales</a></li>
                                            <li><a href="Reports.aspx"><span class="fa fa-folder-open  pfonts"></span>Reports</a></li>
                                            <li><a href="Utilities.aspx"><span class="fa fa-tools pfonts"></span>Utilities</a></li>
                                             <li><a href="CashInjection.aspx"><span class="fa fa-recycle pfonts"></span>CashInjection</a></li>
                                             <li><a href="Espenses.aspx"><span class="fa fa-cart-plus pfonts"></span>Expenses</a></li>
                                             <li><a href="#"><span class="fa fa-certificate pfonts"></span>General</a></li>
                                                 </ul>  
                                       
                                  </div>
                </div> <%--SideNav--%>
                <div class="contents flex-grow-1">
                    

                        
                            <div class="miniheader">
                                <%--<h6 class="col-form-label-lg text-center"style="color:blue">Employee Registration Details</h6>--%>
 <%--                                <center><h4><span class="badge badge-primary"style="background:#183153;font-family:serif;margin-top:8px">Cash Transfers</span></h4></center>
                                  <a class="active" style="margin-top:-7px"><hr/></a>
                                                   --%>

                               
                                <div class="container" >
                                    <div class="row">
                                        <div class="col-sm-6" >

                                                  <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:170px;font-weight:bold">Transferno</span>
                                                   </div>
                                   <asp:TextBox ID="TexBRn" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:170px;font-weight:bold">Date</span>
                                                   </div>
                                     <asp:TextBox ID="TexBPD" runat="server" tabindex="1" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                 </div>

                                            <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:170px;font-weight:bold">Cash Receiver</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDowCashRece" runat="server" tabindex="2" CssClass ="form-control put" aria-describedby="inputGroup-sizing-sm">
                                     </asp:DropDownList>
                                                 
                                         </div>

                                         <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:170px;font-weight:bold">Currency</span>
                                                   </div>
                                     <asp:DropDownList ID="DroDownSCurr" runat="server" tabindex="3" CssClass ="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:DropDownList>
                                         </div>
                                
                                        </div>

                                          <asp:TextBox ID="TextBSBM" runat="server" type="hidden"></asp:TextBox>
                                          <asp:TextBox ID="TextBPDT" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBPDELETE" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBusiesType" runat="server" type="hidden" value="6"></asp:TextBox>
                                        
                                        <div class="col-sm-6 float-right">
                                           
                                      <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:170px;font-weight:bold">Amount</span>
                                                   </div>
                                  <asp:TextBox ID="TexBoxPurAmot" runat="server" tabindex="4" onkeypress="return (event.charCode !=8 && event.charCode ==0 || ( event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)))" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                              <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:170px;font-weight:bold">Cash Administrator</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDowRank" runat="server" tabindex="5" CssClass ="form-control put"  aria-describedby="inputGroup-sizing-sm" >
                                         <asp:ListItem>Administrator</asp:ListItem>
                                         <asp:ListItem>Director</asp:ListItem>
                                         <asp:ListItem>Manager</asp:ListItem>
                                        
                                     </asp:DropDownList>
                                         </div>
                                            
                                      <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:170px;font-weight:bold">Available Cash</span>
                                                   </div>
                                       <asp:TextBox ID="TeBSAFS" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                        <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:170px;font-weight:bold">Recievers Cash Balance</span>
                                                   </div>
                                       <asp:TextBox ID="TextBCBalance" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>
                               
                                        </div>
                                        </div>
                                    </div>

                                
                                      <div class="btn-group">                    
                                          <asp:LinkButton ID="LinkButtReport" runat="server" CssClass="btn btn-sm prs"><i class="fa fa-folder-open"> Reports</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtDelete" runat="server" CssClass="btn btn-sm prs" OnClientClick="if (validateShowPDelete) return true; else return showvalid();" OnClick="LinkButtDelete_Click"><i class="fa fa-trash"> Delete</i></asp:LinkButton>
                                           <asp:LinkButton ID="LinkButtSave" runat="server" tabindex="6" OnClientClick="if (validateShowMath) return true; else return showmath();" OnClick="LinkButtSave_Click" CssClass="btn btn-sm prs"><i class="fa fa-save"> Save</i></asp:LinkButton>

                                              </div> <%--input-group--%>
                                  
                               
                        </div >  <%--miniheader--%>
             
                      
                  <div class="card put" style="width:800px;overflow:auto;height:200px">
   <div class="table-responsive-sm table-bordered table-hover table-striped">
       <asp:Repeater ID="RepetEmploye" runat="server">
           <HeaderTemplate>
                <table class="table table-sm">
      <thead class="table table-sm" style="font-size:small;position:sticky;top:0;background:#183153;color:#ffffff;border: 1px solid #ced4da;height:10px;text-align:center">
          <tr>
             <th></th>
              <th>Transferno</th>
              <th>Date</th>
              <th>CashReceiver</th>
              <th>Currency</th>
              <th>Amount</th>
              <th>CashAdministrator</th>
              <%--<th>AvailableAmount</th>--%>
              <th>Username</th>
              <th>DayTime</th>
          </tr>
      </thead>
      <tbody style="width:800px;overflow:auto;height:200px">
           </HeaderTemplate>
            <ItemTemplate>
                <tr class="table-bordered" style="font-size:small">
                    <th><asp:CheckBox ID="CheckBoxDTE" runat="server" CssClass="checkBox" sytle="margin-top:15px"/></th>
                    <th><%# Eval("TranferNo") %></th>
                    <th><%# string.Format("{0:yyyy/MM/dd}",Eval("Date"))%></th>
                    <th><%# Eval("CashReceiver") %></th>
                    <th><%# Eval("Discription") %></th>
                    <th><%# Eval("Amount") %></th>
                    <th><%# Eval("CashGiver") %></th>
                   <%-- <th><%# Eval("CashierBalance") %></th>--%>  
                    <th><%# Eval("Username") %></th>
                    <th><%# Eval("DTime") %></th> 
                </tr>
            </ItemTemplate>
            <FooterTemplate>
                </tbody>
            </table>
            </FooterTemplate>
       </asp:Repeater>
  </div>
            </div>
                
                </div> <%--Contents--%>
                <div class="sideright">Side Right</div> <%--SideRight--%>
            </div> <%--Main-Contents-Wrap--%>

        </div> <%--Main-Contents--%>
            
<%--   </div> --%><%--wrapper--%>
     <script src="assets/plugins/jquery/jquery.min.js"></script>
       <script src="assets/plugins/bootstrap/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
        <script src="Customize/Date.js"></script>
     <script src="assets/plugins/jquery/moment.js"></script>
    <script src="assets/plugins/fontawesome/js/fontawesome.js"></script>
        <script src="assets/plugins/SweetAlerts/sweetalert2.all.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="Customize/PurchaseKeydown.js"></script>
        <script src="Customize/SingleSelect.js"></script>
        <script src="CashTransfer.js"></script>
        <script src="Customize/PSingleSelect.js"></script>
        <script src="Customize/PDeleteAlert.js"></script>
        <script src="CashTransfeValid.js"></script>
       <%-- </form>--%>
<%--</body>--%>

<%--</html>--%>

<
</fieldset>


</asp:Content>
