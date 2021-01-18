<%@ Page Title="" Language="C#" MasterPageFile="~/cbs.master" AutoEventWireup="true" CodeBehind="Utilities.aspx.cs" Inherits="cbmsWA.Utilities" %>
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
                      <asp:Label ID="bureauid" CssClass="role" runat="server" Text=""></asp:Label>
                  <asp:Label ID="LabeBureaName" CssClass="name" runat="server" Text=""></asp:Label>
                       <asp:Label ID="LabelUserP" CssClass="name" runat="server"></asp:Label>
                          <asp:TextBox ID="LabelUserpP" CssClass="name" type="hidden" runat="server"></asp:TextBox>
                            <asp:Label ID="Company1D" runat="server" CssClass="role" style="color:white;display:block"></asp:Label>


<%--************* Peter ***************--%>


<%--    <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Utilities.aspx.cs" Inherits="forex.Utilities" %>

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
          </div>
            <div class="right-box">
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
                          <asp:Button ID="ButLogout" runat="server" CssClass="btn btn-outline-primary" style="color:white;border-color:white" Text="Log Out" Onclick="ButLogout_Click"/>
                      </div>
                  </div>
            </div>
      
      
        </div>--%> <%--Header--%>

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
                               <%--   <h6 class="col-form-label-lg text-center"style="color:#183153;">PURCHASES</h6>--%>
                               <center><h4><span class="badge badge-primary"style="background:#183153;font-family:serif;margin-top:8px">Utilities</span></h4></center>
                                  <a class="active" style="margin-top:-7px"><hr/></a>
                               
                                <div class="container" >
                                    <div class="row">
                                        <div class="col-4" >


                                   

                                 <div class="input-group input-group-sm mb-3 input">
<%--                                <asp:Button ID="Button6" runat="server" cssclass="btn btn-primary btn-lg active" Text="Update Company"/>--%>
                                  <button type="button" id="LinkAddCompa" class="btn btn-primary btn-lg active" style="border:1.5px solid black" data-toggle="modal" data-target="#myMoAddcomp">Add Company</button>
                                                <div class="modal" id="myMoAddcomp">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">   
        <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Save Company Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modelContent">
              <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Date</span>
                                                   </div>
          <asp:TextBox ID="TexBPD" runat="server" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                 </div>
        
                               <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Bureau Name</span>
                                                   </div>
                                    <asp:TextBox ID="TextBoBN" runat="server" tabindex="1" autocomplete="off" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>
                    
           <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">LicenceNo</span>
                                                   </div>
                                    <asp:TextBox ID="TextBoBLN" runat="server" tabindex="2" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

             <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Area ID</span>
                                                   </div>
                                    <asp:TextBox ID="TextBoAID" runat="server" tabindex="3" autocomplete="off" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

           <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Phone Numbers</span>
                                                   </div>
                                    <asp:TextBox ID="TextBoBTN" runat="server" tabindex="4" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>
       
               <asp:Button ID="ButtoAddCom" tabindex="5" CssClass="btn btn-primary btn-md active" style="border:1.5px solid black" runat="server" Text="Save"/>

<%--                                  <button type="button" id="ButtomUpdate" class="btn btn-primary btn-md active" style="border:1.5px solid black">Update</button>--%>
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>
                                       </div>

                                            <div class="input-group input-group-sm mb-3 input">
                                <asp:Button ID="Button7" runat="server" cssclass="btn btn-danger btn-lg active" Text="Delete All Data" />
                                         </div>
                                        </div>

                                        <div class="col-4" >
                                            <div class="input-group input-group-sm mb-3 input">
<%--                                <asp:Button ID="Button6" runat="server" cssclass="btn btn-primary btn-lg active" Text="Update Company"/>--%>
                                  <button type="button" id="LinkNasPopUp" class="btn btn-primary btn-lg active" style="border:1.5px solid black" data-toggle="modal" data-target="#myModal">Update Company</button>
                                                <div class="modal" id="myModal">
  <div class="modal-dialog modal-dialog-scrollable">
    <div class="modal-content">   
        <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Update Company Details</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body" id="modelContent">
            
           <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Date</span>
                                                   </div>
          <asp:TextBox ID="TexBSD" runat="server" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                 </div>

             <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Bureau Name</span>
                                                   </div>
                                    <asp:TextBox ID="TextBSSN" runat="server" autocomplete="off" cssclass="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

                       <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">LicenceNo</span>
                                                   </div>
                                    <asp:TextBox ID="TextBox1" runat="server" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Location</span>
                                                   </div>
                                    <asp:TextBox ID="TextBox2" runat="server" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

                                 <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Phone Numbers</span>
                                                   </div>
                                    <asp:TextBox ID="TextBox3" runat="server" autocomplete="off" cssclass="form-control put" style="text-transform:uppercase" aria-describedby="inputGroup-sizing-sm"></asp:TextBox>
                                       </div>

                         <div class="input-group input-group-sm mb-3 input">
                                 <div class="input-group-prepend">
                                    <span class="input-group-text lo" style="width:135px;font-weight:bold">Branch</span>
                                                   </div>
             <asp:DropDownList ID="DroDownBranch" runat="server" CssClass ="form-control put" aria-describedby="inputGroup-sizing-sm"></asp:DropDownList>
                                         </div>
               <asp:Button ID="ButtoUpdate" CssClass="btn btn-primary btn-md active" style="border:1.5px solid black" runat="server" Text="Update"/>

<%--                                  <button type="button" id="ButtomUpdate" class="btn btn-primary btn-md active" style="border:1.5px solid black">Update</button>--%>
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
                                    </div>
                                       <%--input-group--%>
                                  
                        </div >  <%--miniheader--%>
                   
                </div> <%--Contents--%>
                <div class="sideright">Side Right</div> <%--SideRight--%>
            </div> <%--Main-Contents-Wrap--%>

        </div> <%--Main-Contents--%>
            
  <%-- </div>--%> <%--wrapper--%>
    
      <%--           </ContentTemplate>
        </asp:UpdatePanel>--%>
        
     <script src="assets/plugins/jquery/jquery.min.js"></script>
       <script src="assets/plugins/bootstrap/popper.min.js"></script>
    <script src="assets/plugins/bootstrap/bootstrap.min.js"></script>
    <script src="assets/plugins/jquery-ui/jquery-ui.js"></script>
        <script src="Customize/Date.js"></script>
     <script src="assets/plugins/jquery/moment.js"></script>
    <script src="assets/plugins/fontawesome/js/fontawesome.js"></script>
        <script src="assets/plugins/SweetAlerts/sweetalert2.all.min.js"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script src="AddBureau.js"></script>
        <script src="Company.js"></script>
        <script src="insertdata.js"></script>
        <script src="UpdateCompany.js"></script>
     <%--   </form>--%>

      
<%--</body>--%>

<%--</html>--%>
<%--****************Peter**************--%>

</asp:Content>
