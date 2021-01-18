<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="Purchases.aspx.cs" Inherits="cbmsWA.Purchases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

        <title></title>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>

    <link href="assets/plugins/bootstrap/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/all.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"/>
    <link href="assets/plugins/jquery-ui/jquery-ui.css" rel="stylesheet" />
    <link href="assets/plugins/fontawesome/css/fontawesome.css" rel="stylesheet"/>
    <link href="assets/plugins/SweetAlerts/sweetalert2.css" rel="stylesheet" />
    <link href="css/allpage.css" rel="stylesheet" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

<%@ register tagprefix="telerik" namespace="Telerik.Web.UI" assembly="Telerik.Web.UI" %>
<telerik:radajaxmanager id="RadAjaxManager1" runat="server">
                               <AjaxSettings>
                                   <telerik:AjaxSetting AjaxControlID="pnl">
                                       <UpdatedControls>
                                           <telerik:AjaxUpdatedControl ControlID="pnl" LoadingPanelID="ldp" />
                                           <telerik:AjaxUpdatedControl ControlID="grid" LoadingPanelID="ldp" />
                                           <telerik:AjaxUpdatedControl ControlID="txtareaid" LoadingPanelID="ldp" />
                                               <telerik:AjaxUpdatedControl ControlID="btnadd" LoadingPanelID="ldp" />
                                       </UpdatedControls>
                                   </telerik:AjaxSetting>
                               </AjaxSettings>
                           </telerik:radajaxmanager>
<telerik:radajaxloadingpanel runat="server" skin="Metro" id="ldp" transparency="30">

                           </telerik:radajaxloadingpanel>

<asp:panel id="pnl" runat="server">
   <asp:Label Font-Bold="true" ID="result" Font-Size="18px" ForeColor="Red" runat="server"></asp:Label>
<fieldset class="lg">
<center><legend>Purchases</legend></center>
    <br />
<%--    <asp:Label runat="server" ID="CreateAccountResults" Font-Size="18px" Font-Bold="True"></asp:Label><br />--%>
<%--<div style="float: left">--%>
<%-- &nbsp;<asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="1.1em" 
    ForeColor="#034A81">Main Info:</asp:Label>--%>
<%--<br /><br />--%>
<%-- <table class="tbl">--%>










    <%-- *************Peter--%>


<%--     <%@ Page Language="C#" AutoEventWireup="true" CodeFile="Purchases.aspx.cs" Inherits="forex.Purchases" EnableEventValidation="false" ValidateRequest="false" %>

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
    <form class="form-horizontal" id="form1" runat="server" autocomplete="off">  --%>    
    <div>
    <div class="wrapper d-flex flex-column">
      <%--  <div class="header">
            <div class="left-box">
              <div class="wrap d-flex align-items-center">
                    <img src="images/css.jpg" height="40" class="logo-img"/>
                 <h4 class="app-name">Easy Bureau</h4>
                   
                </div>
            </div>--%>
       <div class="middle-box">
                <asp:Label ID="LabeBureaName" CssClass="bureau" runat="server"></asp:Label>
                <asp:Label ID="Bureauid" runat="server" type="hidden"></asp:Label>
                <asp:TextBox ID="Company1D" runat="server" type="hidden"></asp:TextBox>
                                   <asp:Label ID="LabelUserP" CssClass="name" type="hidden" runat="server"></asp:Label>
                          <asp:TextBox ID="LabelUserpP" CssClass="name" type="hidden" runat="server"></asp:TextBox>
                            <asp:Label ID="LabelRank" runat="server" CssClass="role" type="hidden" style="color:white;display:block"></asp:Label>
      
          </div>
<%--            <div class="right-box">
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
                          <asp:Button ID="ButtLogoutP" CssClass="btn btn-outline-primary" style="color:white;border-color:white" runat="server" Text="Log Out" OnClick="ButtLogoutP_Click"/>
                      </div>
                  </div>
            </div>--%>
      
        </div> <%--Header--%>

        <div class="main-contents flex-grow-1">
            <div class="main-contents-wrap d-flex h-100">
                <div class="sidenav h-100">
                   
<%--                       <div class="container-lg mb-3 pp">
                                        <ul>
                                             <li><a href="MainMenu.aspx"><span class="fa fa-home pfonts"></span>Home</a></li>
                                             <li><a href="Sales.aspx"><span class="fa fa-money-bill-wave pfonts"></span>Make Sales</a></li>
                                            <li><a href="Reports.aspx"><span class="fa fa-folder-open  pfonts"></span>Reports</a></li>
                                            <li><a href="Utilities.aspx"><span class="fa fa-tools pfonts"></span>Utilities</a></li>
                                             <li><a href="CashTransfers.aspx"><span class="fa fa-recycle pfonts"></span>Cash Transfer</a></li>
                                             <li><a href="Expenses.aspx"><span class="fa fa-cart-plus pfonts"></span>Expenses</a></li>
                                             <li><a href="#"><span class="fa fa-certificate pfonts"></span>General</a></li>
                                                 </ul>  
                                       
                                  </div>--%>
                </div> <%--SideNav--%>
                <div class="contents flex-grow-1">
                    
                            <div class="miniheader">
                               <%--   <h6 class="col-form-label-lg text-center"style="color:#183153;">PURCHASES</h6>--%>
<%--                               <center><h4><span class="badge badge-primary"style="background:#183153;font-family:serif;margin-top:8px">PURCHASES</span></h4></center>--%>
<%--                                  <a class="active" style="margin-top:-7px"><hr/></a>--%>
                               
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
                                    <span class="input-group-text" style="width:135px;font-weight:bold">Receiptno</span>
                                                   </div>
                                   <asp:TextBox ID="TexBRn" runat="server" ReadOnly="true" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>

                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Currency</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDownPurCNY" runat="server" tabindex="1" CssClass ="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:DropDownList>
                                         </div>

                                            <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Purchase Amount</span>
                                                   </div>
                                  <asp:TextBox ID="TexBoxPurAmot" runat="server" tabindex="2" onkeypress="return (event.charCode !=8 && event.charCode ==0 || ( event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)))" autocomplete="off" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>
                                
                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Purchase Rate</span>
                                                   </div>
                                     <asp:TextBox ID="TexBPR" runat="server" tabindex="3" onkeypress="return (event.charCode !=8 && event.charCode ==0 || ( event.charCode == 46 || (event.charCode >= 48 && event.charCode <= 57)))" autocomplete="off" onblur="PurMaths()" CssClass ="form-control put"  aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>
                                   
                                 <div class="input-group input-group-sm mb-3 input">
                                   <div class="input-group-prepend">
                                   <span class="input-group-text lo"  style="width:135px;font-weight:bold">First Name</span>
                                                 </div>
                                      <asp:TextBox ID="TexBPCN" runat="server" tabindex="4" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm" aria-label="Text input with dropdown button" size="50"></asp:TextBox>
                                     <div class="input-group-append">
                                       <asp:LinkButton ID="LinkButSPC" runat="server" CssClass="btn btn-outline-secondary" style="border:1.5px solid black" data-toggle="modal" data-target="#myModal"><i class="fa fa-user"></i></asp:LinkButton>

                                         <!-- The Modal -->
<div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Search Customer Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modelContent">
            


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
                                        </div>

                                        <div class="col-4" >
                                            <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Surname</span>
                                                   </div>
                                    <asp:TextBox ID="TextBPSN" runat="server" tabindex="5" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Gender</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDownPG" runat="server" tabindex="6" CssClass ="form-control put"  aria-describedby="inputGroup-sizing-sm" >
                                         <asp:ListItem>Male</asp:ListItem>
                                         <asp:ListItem>Female</asp:ListItem>

                                     </asp:DropDownList>
                                         </div>

                                             <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Resident Address</span>
                                                   </div>
                                    <asp:TextBox ID="TexBRA" runat="server" tabindex="7" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

                                            <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Physical</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDownPTT" runat="server" ReadOnly="true" tabindex="8" CssClass ="form-control put" aria-describedby="inputGroup-sizing-sm" >
                                       <%--  <asp:ListItem>Purchase</asp:ListItem>--%>
                                     </asp:DropDownList>
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
                                             <asp:TextBox ID="TextBPDT" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextActive" runat="server" type="hidden" value="1"></asp:TextBox>
                                             <asp:TextBox ID="TextBoXUserP" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBPDELETE" runat="server" type="hidden"></asp:TextBox>
                                             <asp:TextBox ID="TextBusiesType" runat="server" type="hidden" value="1"></asp:TextBox>
                                        </div>


                                        <div class="col-4 float-right">
                                           
                                        <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:135px;font-weight:bold">Cedi Equivalent</span>
                                                   </div>
                                       <asp:TextBox ID="TexBPCE" runat="server" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" autocomplete="off" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>
                                
                                            
                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text" style="width:135px;font-weight:bold">Available Amount</span>
                                                   </div>
                                    <asp:TextBox ID="TexBAM" runat="server" onkeydown="return (!(event.keyCode>=65) && event.keyCode!=32);" autocomplete="off" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                    <asp:HiddenField ID="HiddenFieTAM" runat="server" />
                                         </div>
                                            
                                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Region</span>
                                                   </div>
                                     <asp:DropDownList ID="DropDowPROT" runat="server" tabindex="9" CssClass ="form-control put"  aria-describedby="inputGroup-sizing-sm" >
                               
                                     </asp:DropDownList>
                                         </div>

                                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Nationality</span>
                                                   </div>
                                           <asp:DropDownList ID="DropDownTexBPN" runat="server"  tabindex="10" CssClass="form-control put" aria-describedby="inputGroup-sizing-sm" ></asp:DropDownList>
                                         </div>

                                            
                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Type Of Identity</span>
                                                   </div>
                                       <asp:DropDownList ID="DroDwonPId" runat="server"  tabindex="11" cssclass="form-control put"  aria-describedby="inputGroup-sizing-sm" ></asp:DropDownList>
                                         </div>

                                <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Identity No.</span>
                                                   </div>
                                    <asp:TextBox ID="TexBPIDNo" runat="server"  tabindex="12" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                         </div>
                               
                                        </div>
                                        </div>
                                    </div>

                                
                                      <div class="btn-group align-baseline" style="margin-top:-4px">
                                          <div class="linki" style="margin-top:-5px">
                                          <asp:LinkButton ID="LinkButtReprint" runat="server" CssClass="btn btn-sm prs"><i class="fa fa-print"> Reprint</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtReport" runat="server" CssClass="btn btn-sm prs"><i class="fa fa-folder-open"> Reports</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtDelete" runat="server" CssClass="btn btn-sm prs" OnClientClick="if (validateShowPDelete) return true; else return showvalid();" OnClick="LinkButtDelete_Click"><i class="fa fa-trash"> Delete</i></asp:LinkButton>
                                          <asp:LinkButton ID="LinkButtSave" runat="server" tabindex="13" OnClientClick="if (validateShowMath) return true; else return showmath();" OnClick="LinkButtSave_Click" CssClass="btn btn-sm prs"><i class="fa fa-save"> Save</i></asp:LinkButton>
                                                    </div>
                               
                                           <div class="form-check" style="margin-top:-2px">
                                        <!-- Default unchecked -->
                                <div class="custom-control custom-checkbox custom-control-inline" style="color:blue;margin-left:-30px">
                        
                                 <asp:CheckBox ID="CheckBoxPR" runat="server" text="PrintReceipt" CssClass="custom-checkbox prs"/>
                              
                                               </div>
                               <div class="custom-control custom-checkbox custom-control-inline" style="color:blue;margin-left:-30px">
                               
                                      <asp:CheckBox ID="CheckBoxRP" runat="server" text="ReceiptPrinter" CssClass="custom-checkbox prs"/>
                                         <asp:Button ID="Button5" runat="server" Text="Save Customers Details" CssClass="btn btn-primary btn-sm active cup" Style="margin-left:41px"/>
                                         <asp:Button ID="Button6" runat="server" Text="Complete Purchase Print" CssClass="btn btn-primary btn-sm active cup" Style="margin-left:41px"/>
                                        
                                            </div>    
                                       </div>

                                              </div> <%--input-group--%>
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                        </div >  <%--miniheader--%>                     
                        
                   <div class="card put" style="width:980px;overflow:auto;height:200px;margin-top:4px">
   <div class="table-responsive-sm table-bordered table-hover table-striped">
       <asp:Repeater ID="RepetPurchase" runat="server" >
           <HeaderTemplate>
                <table class="table table-sm">
      <thead class="table table-sm" style="font-size:small;position:sticky;top:0;background:#183153;color:#ffffff;border: 1px solid #ced4da;height:10px;text-align:center">
          <tr>
              <th></th>
              <th>ReceiptNo</th>
              <th>Currency</th>
              <th>Amount</th>
              <th>PurchaseRate</th>
              <th>CediEquivalent</th>
             <%-- <th>AvailableAmount</th>--%>
              <th>Date</th>
            <%--  <th>BillMonth</th>--%>
              <th>Username</th>
              <th>Dtime</th>
              <th>First Name</th>
               <th>SurName</th>
              <th>Gender</th>
              <th>CustAddress</th>
               <%--<th>TransactionType</th>--%>
               <th>Region</th>
              <th>Nationality</th>
              <th>IdentityType</th>
              <th>IdentityNo</th>
               
          </tr>
      </thead>      
         <tbody style="width:800px;overflow:auto;height:200px">
           </HeaderTemplate>
            <ItemTemplate>
                <tr class="table-bordered" style="font-size:small">
                    <th><asp:CheckBox ID="CheckBoxDTP" runat="server" CssClass="checkBox" sytle="margin-top:15px"/></th>
                    <th><%# Eval("ReceiptNo") %></th>
                    <th><%# Eval("CurrencyId") %></th>
                    <th><%# Eval("Amount") %></th>
                    <th><%# Eval("PurchaseRate") %></th>
                    <th><%# Eval("CediEquivalent") %></th>
                   <%-- <th><%# Eval("AvailableAmount") %></th>--%>
                    <th><%# string.Format("{0:yyyy/MM/dd}",Eval("Dated")) %></th>
                   <%-- <th><%# Eval("BillMonth") %></th>--%>
                    <th><%# Eval("Username") %></th>
                    <th><%# Eval("DTime") %></th>
                    <th><%# Eval("FirstName") %></th>
                    <th><%# Eval("SurName") %></th>
                    <th><%# Eval("Gender") %></th>
                    <th><%# Eval("CustAddress") %></th>
                   <%-- <th><%# Eval("TransactionType") %></th>--%>
                    <th><%# Eval("Region") %></th>
                    <th><%# Eval("Nationality") %></th>
                    <th><%# Eval("IdentityType") %></th>
                    <th><%# Eval("IdentityNo") %></th>
                     <%-- <th><%# Eval("BillMonth") %></th>--%>
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
          </div>  
  <%-- </div>--%> <%--wrapper--%>
    
      <%--           </ContentTemplate>
        </asp:UpdatePanel>--%>
        
     <script src="assets/plugins/jquery/jquery.min.js"></script>
     <script src="assets/plugins/bootstrap/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
     <script src="assets/plugins/jquery/jquery.dd.min.js"></script>
    <script src="javaquery/cmDate.js"></script>
     <script src="assets/plugins/jquery/moment.js"></script>
    <script src="assets/plugins/fontawesome/js/fontawesome.js"></script>
        <script src="assets/plugins/SweetAlerts/sweetalert2.all.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <script src="javaquery/PurchaseKeydown.js"></script>
    <script src="javaquery/PurCediEqui.js"></script>
    <script src="javaquery/PurtxtValidation.js"></script>
    <script src="javaquery/popup.js"></script>
    <script src="javaquery/PSingleSelect.js"></script>
    <script src="Customize/PDeleteAlert.js"></script>
       <%-- </form>--%>

      
<%--</body>

</html>--%>



     ****************Peter




    <%-- </table>--%>
    <%--</div>--%>
    </fieldset>
    </asp:panel>
</asp:Content>
