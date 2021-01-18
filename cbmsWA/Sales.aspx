<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="cbmsWA.Sales" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
 <link href="assets/plugins/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/fontawesome.css" rel="stylesheet"/>
    <link href="css/dd.css" rel="stylesheet" />
    <link href="assets/plugins/SweetAlerts/sweetalert2.css" rel="stylesheet" />
    <link href="css/allpage.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <fieldset class="lg">
<legend>Purchases</legend><br />
             <div class="middle-box">
              <asp:Label ID="LabeBureaName" CssClass="bureau" runat="server" Text=""></asp:Label>
                <asp:TextBox ID="Company1D" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="bureauid" runat="server" type="hidden"></asp:TextBox>
          </div>
                      <div class="user-info">
                          <asp:Label ID="LabelUserP" CssClass="name" runat="server" Text=""></asp:Label>
                          <asp:TextBox ID="TextBoXUserS" runat="server" Type="hidden" CssClass="name"></asp:TextBox>
                           <asp:Label ID="LabelRank" runat="server" CssClass="role" style="color:white;display:block"></asp:Label>
                      </div>
<%--***************** Peter *******************--%>

<%--<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Sales.aspx.cs" Inherits="forex.Sales" EnableEventValidation="false" %>
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
    <link href="assets/plugins/fontawesome/css/fontawesome.css" rel="stylesheet"/>
    <link href="css/dd.css" rel="stylesheet" />
    <link href="assets/plugins/SweetAlerts/sweetalert2.css" rel="stylesheet" />
    <link href="css/allpage.css" rel="stylesheet" />
    </head>

  <body class="container-fluid">
    <form class="form-horizontal" id="form2" runat="server" autocomplete="off">
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
                <asp:TextBox ID="Company1D" runat="server" type="hidden"></asp:TextBox>
                <asp:TextBox ID="BureauID" runat="server" type="hidden"></asp:TextBox>
          </div>
            <div class="right-box">
                <div class="userbox d-flex align-items-center">
                      <div class="user-pic">
                          <i class="fa fa-user-circle fa-2x"></i>
                      </div>
                      <div class="user-info">
                          <asp:Label ID="LabelUserP" CssClass="name" runat="server" Text=""></asp:Label>
                          <asp:TextBox ID="TextBoXUserS" runat="server" Type="hidden" CssClass="name"></asp:TextBox>
                           <asp:Label ID="LabelRank" runat="server" CssClass="role" style="color:white;display:block"></asp:Label>
                      </div>
                      <div class="logout">
                          <asp:Button ID="ButtLogoutS" CssClass="btn btn-outline-primary" style="color:white;border-color:white" runat="server" Text="Log Out" OnClick="ButtLogoutS_Click"/>
                      </div>
                  </div>
            </div>
      
        </div> --%><%--Header--%>

        <div class="main-contents flex-grow-1">
            <div class="main-contents-wrap d-flex h-100">
                <div class="sidenav h-100"><%--Side Navs--%>
<%--                    <h6 class="col-form-label-lg text-center"style="color:#C70039;margin-top:20px">Menu</h6>--%>
<%--                       <div class="container-lg mb-3 pp">
                                        <ul>
                                             <li><a href="MainMenu.aspx"><span class="fa fa-home pfonts"></span>Home</a></li>
                                             <li><a href="Purchases.aspx"><span class="fa fa-hand-holding-usd pfonts"></span>Purchases</a></li>
                                            <li><a href="#"><span class="fa fa-folder-open  pfonts"></span>Reports</a></li>
                                            <li><a href="Utilities.aspx"><span class="fa fa-tools pfonts"></span>Utilities</a></li>
                                             <li><a href="CashTransfers.aspx"><span class="fa fa-recycle pfonts"></span>Cash Transfer</a></li>
                                             <li><a href="Expenses.aspx"><span class="fa fa-cart-plus pfonts"></span>Expenses</a></li>
                                             <li><a href="#"><span class="fa fa-certificate pfonts"></span>General</a></li>
                                                 </ul>  
                                       
                                  </div>--%>
                </div> <%--SideNav--%>
                <div class="contents flex-grow-1">
                    

                        
                            <div class="miniheader">
               <center><h4><span class="badge badge-primary"style="background:#183153;font-family:serif;margin-top:8px;">SALES DETAILS</span></h4></center>
                        <a class="active" style="margin-top:-7px"><hr/></a>
                               
                                <div class="container" >
                                    <div class="row">
                                        <div class="col-4" >

                                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:135px;font-weight:bold">Available For Sale</span>
                                                   </div>
                                       <asp:TextBox ID="TeBSAFS" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                          <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Date</span>
                                                   </div>
                                     <asp:TextBox ID="TexBSD" runat="server" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                 </div>
            
                                   <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:135px;font-weight:bold">Receiptno</span>
                                                   </div>
                                   <asp:TextBox ID="TexBSRn" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>

                                         </div>

                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Currency</span>
                                                   </div>
                                     <asp:DropDownList ID="DroDownSCurr" runat="server" tabindex="1" CssClass ="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:DropDownList>
                                         </div>

                                            <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Amount</span>
                                                   </div>
                                  <asp:TextBox ID="TexBoxSalsAmot" runat="server" tabindex="2" onkeypress="return (event.charCode !=8 && event.charCode ==0 || ( event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)))" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                
                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Selling Rate</span>
                                                   </div>
                                     <asp:TextBox ID="TexBSR" runat="server" tabindex="3" onkeypress="return (event.charCode !=8 && event.charCode ==0 || ( event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)))" onblur="SalesMaths()" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm" ></asp:TextBox>
                                       </div>

                                
                                        </div>

                                          <div class="col-4" >
                                  <div class="input-group input-group-sm mb-3 input">
                                   <div class="input-group-prepend">
                                   <span class="input-group-text lo"  style="width:135px;font-weight:bold">First Name</span>
                                                 </div>
                                      <asp:TextBox ID="TexBSCN" runat="server" tabindex="4" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm" aria-label="Text input with dropdown button" size="50"></asp:TextBox>
                                     <div class="input-group-append">
                                         <button type="button" id="LinkNasPopUp" class="btn btn-outline-secondary" style="border:1.5px solid black" data-toggle="modal" data-target="#myModal"><i class="fa fa-user"></i></button>
                                         <div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modelContent">
            
          <p class='content-list'>
              <span class='fn'>FirstNsme</span> 
              <span class="sn">LastName</span> 
              <span class ="address" style="display: none"> LA</span>  
          </p>
  
</div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>

                                                                                       </div>
                                        </div>


                                            <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Surname</span>
                                                   </div>
                                    <asp:TextBox ID="TextBSSN" runat="server" tabindex="5" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>


                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Gender</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDownSG" runat="server" tabindex="6" CssClass ="form-control put"  aria-describedby="inputGroup-sizing-sm" >
                                         <asp:ListItem>Male</asp:ListItem>
                                          <asp:ListItem>Female</asp:ListItem>
                                       </asp:DropDownList>
                                         </div>

                                             <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Resident Address</span>
                                                   </div>
                                    <asp:TextBox ID="TexBSRA" runat="server" tabindex="7" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

                                           <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Date Of Birth</span>
                                                   </div>
                                     <asp:TextBox ID="TextBDOB" runat="server" ReadOnly="true" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                 </div>

                                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">TIN Number</span>
                                                   </div>
                                    <asp:TextBox ID="TextBTIN" runat="server" ReadOnly="true" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>
                                        </div>

                                        
                                        <div class="col-4 float-right">
                                           
                                        <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:135px;font-weight:bold">Cedi Equivalent</span>
                                                   </div>
                                       <asp:TextBox ID="TexBSCE" runat="server" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                            <asp:HiddenField ID="HiddeSCE" runat="server" />
                                         </div>
                                                       

                                   <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Physical</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDownSTT" Readonly="true" runat="server" tabindex="8" CssClass ="form-control put"  aria-describedby="inputGroup-sizing-sm" >
                                        <%-- <asp:ListItem>Cash</asp:ListItem>--%>
                                     </asp:DropDownList>
                                         </div>

                                                       <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Region</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDowSROT" runat="server" tabindex="9" CssClass ="form-control put"  aria-describedby="inputGroup-sizing-sm" ></asp:DropDownList>
                                         </div>
                                     

                                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Nationality</span>
                                                   </div>
                                           <asp:DropDownList ID="DropDownTexBSN" runat="server" tabindex="10" CssClass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:DropDownList>
                                         </div>

                                            
                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Type Of Identity</span>
                                                   </div>
                                       <asp:DropDownList ID="DroDwonSId" runat="server"  tabindex="11" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm" ></asp:DropDownList>
                                         </div>

                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Identity No.</span>
                                                   </div>
                                    <asp:TextBox ID="TexBSIDNo" runat="server"  tabindex="12" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                             <asp:TextBox ID="TextBSDT" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBSBM" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBSDELETE" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBusiesType" runat="server" type="hidden" value="2"></asp:TextBox>
                                             <asp:TextBox ID="TexProfit" runat="server" type="hidden"></asp:TextBox>
                                        </div>
                                        </div>
                                    </div>

                                
                                      <div class="btn-group">

                                          <asp:LinkButton ID="LinkButtReprint" runat="server"  CssClass="btn btn-sm prs"><i class="fa fa-print"> Reprint</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtReport" runat="server" CssClass="btn btn-sm prs"><i class="fa fa-folder-open"> Reports</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtSalesDelete" runat="server" CssClass="btn btn-sm prs" OnClientClick="if (validateSALEDelete) return true; else return SalesshowDelet();" OnClick="LinkButtSalesDelete_Click"><i class="fa fa-trash"> Delete</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtSaveSALES" runat="server" tabindex="13" OnClientClick="if (validateSALESShowMath) return true; else  return Salesshowmath();" OnClick="LinkButtSaveSALES_Click" CssClass="btn btn-sm prs"><i class="fa fa-save"> Save</i></asp:LinkButton>

                                   <div class="form-check" style="margin-top:3px">
                                     <div class="custom-control custom-checkbox custom-control-inline" style="color:blue;margin-left:-30px">
                                        <asp:CheckBox ID="CheckBoxPR" runat="server" text="PrintReceipt" CssClass="custom-checkbox prs"/>
                                            </div>
                               <div class="custom-control custom-checkbox custom-control-inline" style="color:blue;margin-left:-30px">
                                   <asp:CheckBox ID="CheckBoxRP" runat="server" text="ReceiptPrinter" CssClass="custom-checkbox prs"/>
                                         <asp:Button ID="Button5" runat="server" Text="Save Customers Details" CssClass="btn btn-primary btn-sm active cup" Style="margin-left:62px"/>
                                         <asp:Button ID="Button6" runat="server" Text="Complete Sales Print" CssClass="btn btn-primary btn-sm active cup" Style="margin-left:62px"/>
                                            </div>    
                                       </div>
                                              </div> <%--input-group--%>
                                  
                               
                        </div >  <%--miniheader--%>
             
                      
                  <div class="card put" style="width:980px;overflow:auto;height:200px;margin-top:4px">
   <div class="table-responsive-sm table-bordered table-hover table-striped">
       <asp:Repeater ID="RepetSales" runat="server" EnableViewState="false">
           <HeaderTemplate>
                <table class="table table-sm">
      <thead class="table table-sm" style="font-size:small;position:sticky;top:0;background:#183153;color:#ffffff;border: 1px solid #ced4da;height:10px;text-align:center;/*background-image: linear-gradient(253deg,#01096c,#111874 16%,#0c1c86 39%,#011773 67%,#01022d,#040747);*/">
          <tr>
             <th></th>
              <th>ReceiptNo</th>
              <th>Currency</th>
              <th>Amount</th>
              <th>Rate</th>
              <th>FirstName</th>
              <th>SurName</th>
              <th>Date</th>
              <th>CediEquivalent</th>
             <%-- <th>AvailableForSale</th>--%>
              <th>Gender</th>
              <th>Address</th>
             <%-- <th>TransactionType</th>--%>
             <%-- <th>Profit</th>--%>
              <th>Region</th>
              <th>Nationality</th>
              <th>IdentityType</th>
              <th>IdentityNo</th>
              <th>Username</th>
             <%-- <th>DTime</th>--%>
             <%-- <th>BillMonth</th>--%>
          </tr>
      </thead>
      <tbody style="width:800px;overflow:auto;height:200px">
           </HeaderTemplate>
            <ItemTemplate>
                <tr class="table-bordered" style="font-size:small">
                    <th><asp:CheckBox ID="CheckBoxDTP" runat="server" CssClass="checkBox" sytle="margin-top:15px"/></th>
                    <th><%# Eval("Receiptno") %></th>
                    <th><%# Eval("CurrencyId") %></th>
                    <th><%# Eval("Amount") %></th>
                    <th><%# Eval("Rate") %></th>
                    <th><%# Eval("FirstName") %></th>
                    <th><%# Eval("SurName") %></th>
                    <th><%# string.Format("{0:yyyy/MM/dd}",Eval("Dated")) %></th>
                    <th><%# Eval("CediEquivalent") %></th>
                    <%--<th><%# Eval("AvailableForSale") %></th>--%>
                    <th><%# Eval("Gender") %></th>
                    <th><%# Eval("Address") %></th>
                    <%--<th><%# Eval("TransactionType") %></th>--%>
                   <%-- <th><%# Eval("Profit") %></th>--%>
                    <th><%# Eval("Region") %></th>
                    <th><%# Eval("Nationality") %></th>
                    <th><%# Eval("IdentityType") %></th>
                    <th><%# Eval("IdentityNo") %></th>
                    <th><%# Eval("Username") %></th>
                   <%-- <th><%# Eval("DTime") %></th>--%>
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
            
  <%-- </div>--%> <%--wrapper--%>
        <script src="assets/plugins/jquery/jquery.min.js"></script>
     <script src="assets/plugins/bootstrap/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
     <script src="assets/plugins/jquery/jquery.dd.min.js"></script>
     <script src="Customize/Date.js"></script>
     <script src="assets/plugins/jquery/moment.js"></script>
    <script src="assets/plugins/fontawesome/js/fontawesome.js"></script>
        <script src="assets/plugins/SweetAlerts/sweetalert2.all.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="Customize/SalesBalances.js"></script>
        <%--<script src="SalesValid.js"></script>--%>
        <script src="Customize/PurchaseKeydown.js"></script>
        <script src="popsales.js"></script>
        <script src="Customize/SalesCediEquiva.js"></script>
        <script src="Customize/SalesValidation.js"></script>
        <script src="Customize/SSingleSelect.js"></script>
        <script src="Customize/SDeleteAet.js"></script>
       <%-- </form>--%>
<%--</body>--%>

<%--</html>--%>


<%--    ****************Peter ***************--%>
</fieldset>

</asp:Content>
