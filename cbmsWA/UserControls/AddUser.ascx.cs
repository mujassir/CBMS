using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//using CbmsLib;


namespace cbmsWA.UserControls
{

    public partial class AddUser : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DisplayRolesInGrid();
                //  MembershipUser deleteuser = Membership.GetUser("1142");
                //Membership.DeleteUser("1142");
            }
        }
        private void DisplayRolesInGrid()
        {
            UserRoles.DataSource = Roles.GetAllRoles();
            UserRoles.DataBind();
        }
        protected void btnUser_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    MembershipCreateStatus createStatus = new MembershipCreateStatus();

                    //  MembershipUser loggedInUser = Membership.GetUser(Page.User.Identity.Name);
                    Membership.CreateUser(txtuser.Text, txtpass.Text, txtemail.Text);
                    MembershipUser newUser = Membership.GetUser(txtuser.Text);
                    // Guid newid = new Guid();
                    // Guid loggedid = new Guid();
                    using (var ctx = new ModelEntities())
                   //     using (var ctx1=new )
                    {
                        UserDetail detail = new UserDetail();
                        detail.DepartmentId = int.Parse(dept.SelectedValue);
                        detail.EntryBy = Page.User.Identity.Name;
                        detail.EntryDate = DateTime.Now;
                        if (!String.IsNullOrEmpty(cmbs.SelectedValue.ToString()))
                        {
                            detail.StationID = int.Parse(cmbs.SelectedValue);
                        }
                        detail.UserName = txtuser.Text;
                        detail.EmployeeName = txtname.Text;
                        detail.Position = txtpos.Text;
                        if (!String.IsNullOrEmpty(cmbarea.SelectedValue.ToString()))
                        {
                            detail.AreaID = int.Parse(cmbarea.SelectedValue);
                        }
                        if (!String.IsNullOrEmpty(cmbBureau.SelectedValue.ToString()))
                        {
                            detail.BureauID = int.Parse(cmbBureau.SelectedValue);
                        }
                        

                        ctx.UserDetails.Add(detail);
                        ctx.SaveChanges();

                        AuditLog log = new AuditLog();
                        log.Action = "New user='" + txtuser.Text + "'" + " " + " " + txtname.Text + " " + "created";
                        log.Username = Page.User.Identity.Name;
                        // log.StationID = int.Parse(GetStationId());
                        log.ActionDate = DateTime.Now;
                        ctx.AuditLogs.Add(log);
                        ctx.SaveChanges();

                    }


                    foreach (ListItem rolebox in UserRoles.Items)
                    {
                        if (rolebox.Selected)
                        {
                            Roles.AddUserToRole(txtuser.Text, rolebox.Text);
                        }
                    }


                    switch (createStatus)
                    {
                        case MembershipCreateStatus.Success: CreateAccountResults.Text = "The user account was successfully created!";
                            CreateAccountResults.ForeColor = System.Drawing.Color.Green;

                            txtemail.Text = "";
                            txtuser.Text = "";
                            cmbs.ClearSelection();
                            dept.ClearSelection();
                            UserRoles.ClearSelection();
                            cmbarea.ClearSelection();
                            cmbBureau.ClearSelection();
                            txtname.Text = "";
                            cmbloc.ClearSelection();
                            //using (var ctx = new EziEntities())
                            //{
                            //    ACCOUNT account = new ACCOUNT();
                            //    account.USERID = newid;
                            //    account.CREATEDBY = Page.User.Identity.Name;
                            //    account.USERNAME = txtuser.Text;
                            //    ctx.ACCOUNTs.Add(account);
                            //    ctx.SaveChanges();
                            //}
                            break;
                        case MembershipCreateStatus.DuplicateUserName: CreateAccountResults.Text = "There already exists a user with this username.";
                            break;
                        case MembershipCreateStatus.DuplicateEmail: CreateAccountResults.Text = "There already exists a user with this email address.";
                            break;
                        case MembershipCreateStatus.InvalidEmail: CreateAccountResults.Text = "There email address you provided in invalid.";
                            break;
                        case MembershipCreateStatus.InvalidPassword: CreateAccountResults.Text = "The password you provided is invalid. It must be seven characters long and have at least one non-alphanumeric character.";
                            break;
                        default: CreateAccountResults.Text = "There was an unknown error; the user account was NOT created.";
                            break;
                    }
                }

            }
            catch (Exception ex)
            {
                CreateAccountResults.Text = ex.Message;
                CreateAccountResults.ForeColor = System.Drawing.Color.Red;
            }

            // CreateAccount();

            //Ezipay.Entities.Account account = new Ezipay.Entities.Account();
            //account.Userid = newUserId;
            //account.Createdby = loggedUserId;
            //account.Username = Page.User.Identity.Name;
            //DataRepository.AccountProvider.Insert(account);
        }
        protected void cmbloc_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            if (cmbloc.SelectedValue == "1")
            {

            }
            else if (cmbloc.SelectedValue == "2")
            {
                RequiredFieldValidator1.ValidationGroup = "user";
            }
            else if (cmbloc.SelectedValue == "3")
            {
                srfv.ValidationGroup = "user";
            }
        }
    }
}