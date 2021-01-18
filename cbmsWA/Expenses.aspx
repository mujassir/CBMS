<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="Expenses.aspx.cs" Inherits="cbmsWA.Expenses" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
        <link href="assets/plugins/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/fontawesome.css" rel="stylesheet" />
    <link href="assets/plugins/SweetAlerts/sweetalert2.css" rel="stylesheet" />
    <link href="css/allpage.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<legend>Enter Expenses</legend><br />


<%--******* Peter ***********--%>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Expenses.aspx.cs" Inherits="forex.Expenses1" EnableEventValidation="false" %>

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
    <link href="assets/plugins/SweetAlerts/sweetalert2.css" rel="stylesheet" />
    <link href="css/allpage.css" rel="stylesheet" />

    </head>

  <body class="container-fluid">
    <form class="form-horizontal" id="formE" runat="server" autocomplete="off"> 
     <div class="wrapper d-flex flex-column">
        <div class="header">
            <div class="left-box">
                <div class="wrap d-flex align-items-center">
                    <img src="images/css.jpg" height="40" class="logo-img"/>
                 <h4 class="app-name">Easy Bureau</h4>
                   
                </div>
            </div>--%>
<%--       <div class="middle-box">
            <asp:Label ID="LabeBureaName" CssClass="bureau" runat="server" Text=""></asp:Label>
            <asp:TextBox ID="Company1D" runat="server" type="hidden"></asp:TextBox>
            <asp:TextBox ID="BureauID" runat="server" type="hidden"></asp:TextBox>
          </div>--%>
            <%--<div class="right-box">
                <div class="userbox d-flex align-items-center">
                      <div class="user-pic">
                          <i class="fa fa-user-circle fa-2x"></i>
                      </div>
                      <div class="user-info">
                        <asp:Label ID="LabelUserP" CssClass="name" runat="server"></asp:Label>
                          <asp:TextBox ID="LabelUserpP" CssClass="name" type="hidden" runat="server"></asp:TextBox>
                          <asp:Label ID="LabelRank" runat="server" CssClass="role" style="color:white;display:block"></asp:Label>
                      </div>
                      <div class="logout">
                          <asp:Button ID="ButtExLogout" runat="server" Text="Log Out" CssClass="btn btn-outline-primary" style="color:white;border-color:white" OnClick="ButtExLogout_Click" />
                      </div>
                  </div>
            </div>--%>
<%--        </div> <%--Header--%>--%>
                <asp:Label ID="LabeBureaName" CssClass="bureau" type="hidden" runat="server" Text=""></asp:Label>
            <asp:TextBox ID="Company1D" runat="server" type="hidden"></asp:TextBox>
            <asp:TextBox ID="BureauID" runat="server" type="hidden"></asp:TextBox>
                <asp:Label ID="LabelUserP" CssClass="name" runat="server" type="hidden"></asp:Label>
                <asp:TextBox ID="LabelUserpP" CssClass="name" type="hidden" runat="server"></asp:TextBox>
                <asp:Label ID="LabelRank" runat="server" type="hidden" CssClass="role" style="color:white;display:block"></asp:Label>
        <div class="main-contents flex-grow-1">
            <div class="main-contents-wrap d-flex h-100">
<%--                <div class="sidenav h-100">
                      <h6 class="col-form-label-lg text-center"style="color: #C70039;margin-top:20px">Menu</h6>
                       <div class="container-lg mb-3 pp">
                                        <ul>
                                             <li><a href="MainMenu.aspx"><span class="fa fa-home pfonts"></span>Home</a></li>
                                             <li><a href="Sales.aspx"><span class="fa fa-money-bill-wave pfonts"></span>Make Sales</a></li>
                                            <li><a href="Purchases.aspx"><span class="fa fa-hand-holding-usd pfonts"></span>Purchases</a></li>
                                            <li><a href="Reports.aspx"><span class="fa fa-folder-open  pfonts"></span>Reports</a></li>
                                             <li><a href="CashTransfers.aspx"><span class="fa fa-recycle pfonts"></span>Cash Transfer</a></li>
                                             <li><a href="Espenses.aspx"><span class="fa fa-cart-plus pfonts"></span>Expenses</a></li>
                                             <li><a href="#"><span class="fa fa-certificate pfonts"></span>General</a></li>
                                                 </ul>  
                                       
                                  </div>
                    </div> <%--SideNav--%>--%>
                <div class="contents flex-grow-1">
                            <div class="miniheader">
                               <%-- <h6 class="col-form-label-lg text-center"style="color:blue">DAILY EXPENSES</h6>
                                <hr/>--%>
<%--                                  <center><h4><span class="badge badge-primary"style="background:#183153;font-family:serif;margin-top:8px">DAILY EXPENSES</span></h4></center>--%>
                                  <a class="active" style="margin-top:-7px"><hr/></a>
                                <div class="container" >
                                    <div class="row">
                                        <div class="col-4" >

                                     <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Date</span>
                                                   </div>
                                     <asp:TextBox ID="TexBPD" runat="server" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                 </div>

                                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Reference No</span>
                                                   </div>
                                  <asp:TextBox ID="TexBER" runat="server" ReadOnly="true" autocomplete="off" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                            
                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Currency</span>
                                                   </div>
                                     <asp:DropDownList ID="DroDownSCurr" runat="server" tabindex="2" CssClass ="form-control put" aria-describedby="inputGroup-sizing-sm" ></asp:DropDownList>
                                         </div>

                                        <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Amount</span>
                                                   </div>
                                  <asp:TextBox ID="TexBoxEXAmot" runat="server" tabindex="3" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                      
                                
                                        </div>

                                        <div class="col-4" >
                                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Account</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDownEA" runat="server" tabindex="4" CssClass ="form-control put"  aria-describedby="inputGroup-sizing-sm" >
                                         <asp:ListItem>Salary Expenese</asp:ListItem>
                                         <asp:ListItem>Staff Cost</asp:ListItem>
                                         <asp:ListItem>T & T</asp:ListItem>
                                         <asp:ListItem>Telecummunication Cost</asp:ListItem>
                                         <asp:ListItem>Fuel & Lubricants</asp:ListItem>
                                        <asp:ListItem>Repairs & Maintenance</asp:ListItem>
                                         <asp:ListItem>Electricity & Water</asp:ListItem>
                                         <asp:ListItem>Sanitation Cost</asp:ListItem>
                                         <asp:ListItem>Printing & Stationary</asp:ListItem>
                                         <asp:ListItem>Medical Expense</asp:ListItem>
                                         <asp:ListItem>General Office Expenes</asp:ListItem>
                                     </asp:DropDownList>
                                         </div>
                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Buying Rate</span>
                                                   </div>
                                     <asp:TextBox ID="TextBox1" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>

                                         </div>

                                        </div>

                                        
                                        <div class="col-4 float-right">
                                           
                                              <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Available Cedis</span>
                                                   </div>
                                       <asp:TextBox ID="TeBSAFS" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>
                                            
                                            <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Selling Rate</span>
                                                   </div>
                                       <asp:TextBox ID="TextBEBR" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                          <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Cedi Equivalent</span>
                                                   </div>
                                       <asp:TextBox ID="TexBECE" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                              <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text sp" style="width:135px;font-weight:bold">Datails</span>
                                                   </div>
                                    <asp:TextBox ID="TexBEDts" runat="server" tabindex="5" autocomplete="off" cssclass="form-control" style="text-transform:uppercase" aria-label="With textarea"></asp:TextBox>
                                       </div>
                                             <asp:TextBox ID="TextBPBM" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBDT" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBPDELETE" runat="server" type="hidden"></asp:TextBox>
                                            <asp:TextBox ID="TextBusiesType" runat="server" type="hidden" value="3"></asp:TextBox>
                                        </div>
                                        </div>
                                    </div>

                                
                                       <div class="btn-group align-baseline">

                                          <asp:LinkButton ID="LinkButtReport" runat="server" CssClass="btn btn-sm prs"><i class="fa fa-folder-open"> Reports</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtDelete" runat="server" CssClass="btn btn-sm prs" OnClientClick="if (validateShowPDelete) return true; else return showvalid();" OnClick="LinkButtDelete_Click"><i class="fa fa-trash"> Delete</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtSave" runat="server" tabindex="6" OnClientClick="if (validateShowMath) return true; else return showmath();" OnClick="LinkButtSave_Click" CssClass="btn btn-sm prs"><i class="fa fa-save"> Save</i></asp:LinkButton>
                                                    
                               
                                           <div class="form-check" style="margin-top:6px">
                                        <!-- Default unchecked -->
                                <div class="custom-control custom-checkbox custom-control-inline" style="color:blue;margin-left:-30px">
                        
                                 <asp:CheckBox ID="CheckBoxPR" runat="server" text="PrintReceipt" CssClass="custom-checkbox prs"/>
                              
                                               </div>
                               <div class="custom-control custom-checkbox custom-control-inline" style="color:blue;margin-left:-30px">
                              
                                      <asp:CheckBox ID="CheckBoxRP" runat="server" text="ReceiptPrinter" CssClass="custom-checkbox prs"/>
                                         <div class="btn-group" style="margin-left:10px; top: 0px; left: 0px;">
                                       <asp:Button ID="ButtSPCD" runat="server" Text="Veiw/Print" CssClass="btn btn-light btn-sm cup"/>
                                             </div>
                                       
                                            </div>    
                                       </div>

                                              </div> <%--input-group--%>
                               
                        </div >  <%--miniheader--%>
             
                      
                          <div class="card put" style="width:800px;overflow:auto;height:200px">
                       <div class="table-responsive-sm table-bordered table-hover table-striped">
                      <asp:Repeater ID="RepetExpenses" runat="server">
                    <HeaderTemplate>
                <table class="table table-sm">
      <thead class="table table-sm" style="font-size:small;position:sticky;top:0;background:#183153;color:#ffffff;border: 1px solid #ced4da;height:10px;text-align:center">
          <tr>
             <th></th>
              <th>ReferenceNo</th>
              <th>Date</th>
              <th>Currency</th>
              <th>Amount</th>
              <th>Account</th>
              <%--<th>AvailableCedis</th>--%>
             <%-- <th>BuyingRate</th>--%>
              <th>CediEquivalent</th>
             <%-- <th>Details</th>--%>
              <th>Username</th>
             <%-- <th>BillMonth</th>--%>
          </tr>
      </thead>
      <tbody style="width:800px;overflow:auto;height:200px">
           </HeaderTemplate>
            <ItemTemplate>
                <tr class="table-bordered" style="font-size:small">
                    <th><asp:CheckBox ID="CheckBoxDTE" runat="server" CssClass="checkBox" sytle="margin-top:15px"/></th>
                    <th><%# Eval("ReceiptNo") %></th>
                    <th><%# string.Format("{0:yyyy/MM/dd}",Eval("Dated"))%></th>
                    <th><%# Eval("CurrencyId") %></th>
                    <th><%# Eval("Amount") %></th>
                    <th><%# Eval("Account") %></th>
                    <%--<th><%# Eval("AvailableCedis") %></th>--%> 
                   <%-- <th><%# Eval("BuyingRate") %></th> --%>
                    <th><%# Eval("CediEquivalent") %></th> 
                  <%--  <th><%# Eval("Details") %></th>--%>
                    <th><%# Eval("Username") %></th>
                    <%--<th><%# Eval("BillMonth") %></th>--%>
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
            
<%--   </div> <%--wrapper--%>--%>
    <script src="assets/plugins/jquery/jquery.min.js"></script>
       <script src="assets/plugins/bootstrap/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
        <script src="Customize/Date.js"></script>
     <script src="assets/plugins/jquery/moment.js"></script>
    <script src="assets/plugins/fontawesome/js/fontawesome.js"></script>
        <script src="assets/plugins/SweetAlerts/sweetalert2.all.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="Expenses.js"></script>
        <script src="Customize/PurchaseKeydown.js"></script>
        <script src="Customize/PSingleSelect.js"></script>
        <script src="Customize/PDeleteAlert.js"></script>
<%--        </form>--%>
<%--</body>--%>

<%--</html>--%>




    *************  Peter **************

</asp:Content>
