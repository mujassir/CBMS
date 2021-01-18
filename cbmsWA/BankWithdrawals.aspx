<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="BankWithdrawals.aspx.cs" Inherits="cbmsWA.BankWithdrawals" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
     <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <link href="assets/plugins/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/fontawesome.css" rel="stylesheet" />
    <link href="assets/plugins/SweetAlerts/sweetalert2.css" rel="stylesheet" />
    <link href="css/allpage.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:panel id="pnl" runat="server">
   <asp:Label Font-Bold="true" ID="result" Font-Size="18px" ForeColor="Red" runat="server"></asp:Label>
<fieldset class="lg">
<legend>Bank Withdrawals</legend><br />


                <asp:Label ID="LabeBureaName" CssClass="bureau" runat="server" Text=""></asp:Label>
                 <asp:TextBox ID="BureauName" runat="server" type="hidden" CssClass="bureau"></asp:TextBox>
                <asp:TextBox ID="bureauId" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="companyid" runat="server" type="hidden"></asp:TextBox>
                              <asp:Label ID="LabelUser" CssClass="name" runat="server" Text=""></asp:Label>
                          <asp:Label ID="LabelRank" runat="server" CssClass="role" style="color:white;display:block"></asp:Label>
    **************** Peter *************
<%--<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BankWithdrawals.aspx.cs" Inherits="forex.BankWithdrawals" EnableEventValidation="false"%>

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
            </div>
        <div class="middle-box">
                <asp:Label ID="Label1" CssClass="bureau" runat="server" Text=""></asp:Label>
                 <asp:TextBox ID="TextBox1" runat="server" type="hidden" CssClass="bureau"></asp:TextBox>
                 <asp:Label ID="Label2" runat="server" type="hidden"></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" type="hidden"></asp:TextBox>
          </div>
            <div class="right-box">
                <div class="userbox d-flex align-items-center">
                      <div class="user-pic">
                          <i class="fa fa-user-circle fa-2x"></i>
                      </div>
                      <div class="user-info">
                          <asp:Label ID="Label3" CssClass="name" runat="server" Text=""></asp:Label>
                          <asp:Label ID="Label4" runat="server" CssClass="role" style="color:white;display:block"></asp:Label>
                      </div>
                      <div class="logout">
                          <asp:Button ID="ButtLogout" runat="server" CssClass="btn btn-outline-primary" style="color:white;border-color:white" Text="Log Out" Onclick="ButtLogout_Click"/>
                      </div>
                  </div>
            </div>
      
        </div> <%--Header--%>--%>--%>

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
                    </div>--%> <%--SideNav--%>
                <div class="contents flex-grow-1">
                            <div class="miniheader">
                                <hr/>
                                  <center><h4><span class="badge badge-primary"style="background:#183153;font-family:serif;margin-top:8px">BANK WITHDRAWALS</span></h4></center>
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
                                     <asp:DropDownList ID="DroDownSCurr" runat="server" tabindex="1" CssClass ="form-control put" aria-describedby="inputGroup-sizing-sm" ></asp:DropDownList>
                                         </div>

                                        <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Amount</span>
                                                   </div>
                                  <asp:TextBox ID="TexBoxEXAmot" runat="server" tabindex="2" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                      
                                
                                        </div>

                                        <div class="col-4" >
                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Buying Rate</span>
                                                   </div>
                                     <asp:TextBox ID="TextBox3" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>

                                         </div>
                                                                                          
                                              <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text sp" style="width:135px;font-weight:bold">Bank</span>
                                                   </div>
                                    <asp:TextBox ID="TextBNOB" runat="server" tabindex="3" autocomplete="off" cssclass="form-control" style="text-transform:uppercase" aria-label="With textarea"></asp:TextBox>
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
                                    <asp:TextBox ID="TexBEDts" runat="server" tabindex="4" autocomplete="off" cssclass="form-control" style="text-transform:uppercase" aria-label="With textarea"></asp:TextBox>
                                       </div>
                                            <asp:TextBox ID="TextBPDT" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBPBM" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBPDELETE" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBusiesType" runat="server" type="hidden" value="5"></asp:TextBox>
                                        </div>
                                        </div>
                                    </div>

                                
                                       <div class="btn-group align-baseline">

                                          <asp:LinkButton ID="LinkButtReport" runat="server" CssClass="btn btn-sm prs"><i class="fa fa-folder-open"> Reports</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtDelete" runat="server" CssClass="btn btn-sm prs" OnClientClick="if (validateShowPDelete) return true; else return showvalid();" OnClick="LinkButtDelete_Click"><i class="fa fa-trash"> Delete</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtSave" runat="server" tabindex="5" OnClientClick="if (validateShowMath) return true; else return showmath();" OnClick="LinkButtSave_Click" CssClass="btn btn-sm prs"><i class="fa fa-save"> Save</i></asp:LinkButton>

                               
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
              <th>Bank</th>
<%--         <%--     <th>AvailableCedis</th>--%>
              <th>Details</th>--%>
              <th>Username</th>
              <%--<th>BillMonth</th>--%>
          </tr>
      </thead>
      <tbody style="width:800px;overflow:auto;height:200px">
           </HeaderTemplate>
            <ItemTemplate>
                <tr class="table-bordered" style="font-size:small">
                    <th><asp:CheckBox ID="CheckBoxDTE" runat="server" CssClass="checkBox" sytle="margin-top:15px"/></th>
                    <th><%# Eval("Receiptno") %></th>
                    <th><%# string.Format("{0:yyyy/MM/dd}",Eval("Dated"))%></th>
                    <th><%# Eval("CurrencyId") %></th>
                    <th><%# Eval("Amount") %></th>
                     <th><%# Eval("Bank") %></th>
<%--                <th><%# Eval("AvailableCedis") %></th> --%>
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
            
   <%--</div>--%> <%--wrapper--%>
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
        <script src="BankLodg.js"></script>
      <%--  </form>--%>
<%--</body>--%>

<%--</html>--%>



    **************** Peter *************
    </fieldset>
        </asp:panel>

</asp:Content>
