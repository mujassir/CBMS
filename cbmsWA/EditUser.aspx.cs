using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//using CbmsLib;
using System.Data.SqlClient;

namespace cbmsWA
{
    public partial class EditUser : System.Web.UI.Page
    {
        MembershipUser user;
        string username;

        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                username = Request.QueryString["username"];
                if (username == null || username == "")
                {
                    Response.Redirect("manageusers.aspx");
                }
                user = Membership.GetUser(username);
                UserUpdateMessage.Text = "";
            }
            catch (Exception ex)
            {
            }
        }
        private void Page_PreRender()
        {
            try
            {
                // Load the User Roles into checkboxes.
                SqlDataSource1.SelectCommand = "select * from roles";
                UserRoles.DataSource = SqlDataSource1;
                //  UserRoles.DataSource = Roles.GetAllRoles();
                UserRoles.DataBind();

                // Disable checkboxes if appropriate:
                if (UserInfo.CurrentMode != DetailsViewMode.Edit)
                {
                    foreach (ListItem checkbox in UserRoles.Items)
                    {
                        checkbox.Enabled = false;
                    }
                }

                // Bind these checkboxes to the User's own set of roles.
                string[] userRoles = Roles.GetRolesForUser(username);
                foreach (string role in userRoles)
                {
                    ListItem checkbox = UserRoles.Items.FindByValue(role);
                    checkbox.Selected = true;
                }
            }
            catch (Exception ex)
            {
            }
        }
        protected void UserInfo_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            user.Email = (string)e.NewValues[0];
            user.Comment = (string)e.NewValues[1];
            user.IsApproved = (bool)e.NewValues[2];
            //user.IsLockedOut = (bool)e.NewValues[3];
            // user.IsLockedOut = (bool)e.NewValues[3];

            string conn = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection connection = new SqlConnection(conn);
            SqlCommand cmd = new SqlCommand();
            connection.Open();
            cmd.Connection = connection;
            cmd.CommandType = System.Data.CommandType.Text;
            string getID = Request.QueryString["username"];
            cmd.CommandText = "UPDATE vw_Users SET IsLockedOut = 0 WHERE username = @username";  
            cmd.Parameters.AddWithValue("@username", getID ?? (object)DBNull.Value);
            cmd.ExecuteNonQuery();
            cmd.Parameters.Clear();
            connection.Close();


            try
            {
                // Update user info:
                Membership.UpdateUser(user);

                // Update user roles:
                UpdateUserRoles();

                UserUpdateMessage.Text = "Update Successful.";
                UserUpdateMessage.ForeColor = Color.Green;

                e.Cancel = true;
                UserInfo.ChangeMode(DetailsViewMode.ReadOnly);
            }
            catch (Exception ex)
            {
                UserUpdateMessage.Text = "Update Failed: " + ex.Message;
                UserUpdateMessage.ForeColor = Color.Red;

                e.Cancel = true;
                UserInfo.ChangeMode(DetailsViewMode.ReadOnly);
            }
        }
        private void UpdateUserRoles()
        {
            foreach (ListItem rolebox in UserRoles.Items)
            {
                if (rolebox.Selected)
                {
                    if (!Roles.IsUserInRole(username, rolebox.Text))
                    {
                        Roles.AddUserToRole(username, rolebox.Text);
                    }
                }
                else
                {
                    if (Roles.IsUserInRole(username, rolebox.Text))
                    {
                        Roles.RemoveUserFromRole(username, rolebox.Text);
                    }
                }
            }
        }
        protected void SqlDataSoure2_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.AffectedRows == 0)
            {
                UserUpdateMessage.Text = "User not updated";
            }
            else
            {
                string getUserName = Request.QueryString["username"];
                //ModelEntities
                var ctx = new ModelEntities();
                    var query = ctx.UserDetails.Where(u => u.UserName == getUserName).FirstOrDefault();
                    var getRemark = query.Remark;
                    string conn = System.Web.Configuration.WebConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
                    SqlConnection connection = new SqlConnection(conn);
                    SqlCommand cmd = new SqlCommand();
                    connection.Open();
                    cmd.Connection = connection;
                    cmd.CommandType = System.Data.CommandType.Text;
                    cmd.CommandText = "INSERT INTO auditlog(username, action, actiondate) VALUES(@username, @action, @actiondate)";
                    //cmd.CommandText = "UPDATE vw_Users SET IsLockedOut = 0 WHERE username = @uname";  
                cmd.Parameters.AddWithValue("@username", Page.User.Identity.Name ??(object)DBNull.Value);
                //cmd.Parameters.AddWithValue("@uname", Page.User.Identity.Name ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@action", getUserName + " transfered due to reason: " + getRemark ?? (object)DBNull.Value);
                    cmd.Parameters.AddWithValue("@actiondate", DateTime.Now);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                        connection.Close();
                        UserUpdateMessage.ForeColor = Color.Green;
                        UserUpdateMessage.Text = "User successfully updated";
                }

            }

        }

    }
