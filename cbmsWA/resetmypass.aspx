<%@ page title="Password Reset" language="C#" masterpagefile="~/cbs.master" autoeventwireup="true" inherits="cbmsWA.resetmypass" codebehind="resetmypass.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script type="text/javascript">
        function Validate() {
            var password = document.getElementById("pass").value;
            var confirmPassword = document.getElementById("confirmpass").value;
            if (password != confirmPassword) {
                document.getElementById("result").value = "Passwords do not match";

                //alert("Passwords do not match.");
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">

     <fieldset>
         <legend>Reset Password</legend>
                    <table class="tbl">
                        <tr>
                            <td><asp:Label runat="server" Font-Size="16px" Font-Bold="true" ForeColor="red" ID="result"></asp:Label></td>
                        </tr>
                      <%--  <tr>
                            <td>Username :</td><td><asp:TextBox ID="username" runat="server"></asp:TextBox>
                                  <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ErrorMessage="required" Font-Bold="true" ForeColor="red" ControlToValidate="username" Display="Dynamic" ValidationGroup="lgn" runat="server"></asp:RequiredFieldValidator>
                                               </td>
                        </tr>--%>
                        <tr>
                            <td>Password :</td><td><asp:TextBox TextMode="Password" ID="pass" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ControlToValidate="pass" ErrorMessage="required" Font-Bold="true" ForeColor="Red" Display="Dynamic" ValidationGroup="lgn" runat="server"></asp:RequiredFieldValidator>
                                               </td>
                        </tr>
                          <tr>
                            <td>Confirm Password :</td><td><asp:TextBox TextMode="Password" ID="confirmpass" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ControlToValidate="confirmpass" ErrorMessage="required" Font-Bold="true" ForeColor="Red" Display="Dynamic" ValidationGroup="lgn" runat="server"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator runat="server" Text="Password mismatch" Font-Bold="true" ForeColor="Red" ControlToValidate="pass" ValidationGroup="lgn" ControlToCompare="confirmpass"></asp:CompareValidator>                  
                                 </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align:right"><asp:Button CssClass="btn btn-primary" Text="Reset" ID="btnreset" ValidationGroup="lgn" OnClientClick="Validate()" runat="server" OnClick="btnreset_Click"></asp:Button>
                               &nbsp; 
                            </td>
                        </tr>
                    </table>
                    </fieldset>
</asp:content>

