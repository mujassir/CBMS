using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;


namespace cbmsWA.UserControls
{

    public partial class Users : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //MembershipUser loggedInUser = Membership.GetUser(Page.User.Identity.Name);
            //Guid loggedid = new Guid();

            //loggedid = (Guid)loggedInUser.ProviderUserKey;
            //byte[] loggedUserId = loggedid.ToByteArray();

            //// string queryString = "SELECT * from vw_account where username = '" + Page.User.Identity.Name + "' ";
            //string queryString = "select u.userid,u.username,u.lastactivitydate,m.isapproved,m.createdate,m.email,m.islockedout,m.lastlogindate from users u left outer join memberships m on m.userid = u.userid";

            //using (SqlConnection connection = new SqlConnection(DbConnection.DbConnectionString))
            //{
            //    SqlCommand command = new SqlCommand(queryString, connection);

            //    connection.Open();

            //    using (SqlDataReader reader = command.ExecuteReader())
            //    {

            //        gdUsers.DataSource = reader;
            //        gdUsers.DataBind();


            //    }
            //}
        }
        protected string GetActiveStatus(string stat)
        {



            switch (stat)
            {
                case "1":
                    return "True";


                case "0":
                    return "False";


                default:
                    return "Not Available";
            }
        }
        protected string GetAccessStatus(string stat)
        {



            switch (stat)
            {
                case "1":
                    return "True";


                case "0":
                    return "False";


                default:
                    return "Not Available";
            }
        }
        protected void gdUsers_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            SqlConnection cn = null;
            try
            {

                cn = new SqlConnection(DbConnection.DbConnectionString);
                cn.Open();
                string sql = "select * from vw_users";

                SqlCommand cmd = new SqlCommand(sql, cn);

                // cmd.Parameters.AddWithValue("@stationid", stationId);
                // cmd.Parameters.AddWithValue("@status", 7);

                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                da.Fill(ds);
                gdUsers.DataSource = ds.Tables[0];

            }
            catch (Exception ex)
            {
                // result.Text = ex.GetBaseException().Message;
            }
            finally
            {
                cn.Close();
            }
        }
        protected void gdUsers_Init(object sender, EventArgs e)
        {
            GridFilterMenu menu = gdUsers.FilterMenu;
            int i = 0;
            while (i < menu.Items.Count)
            {
                if (menu.Items[i].Text == "NoFilter" || menu.Items[i].Text == "Contains" || menu.Items[i].Text == "EqualTo")
                {
                    i++;
                }
                else
                {
                    menu.Items.RemoveAt(i);
                }
            }
        }
    }

}