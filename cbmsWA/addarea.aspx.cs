using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//using CbmsLib;
using Telerik.Web.UI;
using System.Data.SqlClient;
using System.Drawing;


namespace cbmsWA
{
    public partial class addarea : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                int applicationId = AppID();
                // sn.Text = applicationId.ToString();
                int nextAppId = applicationId + 1;
                txtareaid.Value = nextAppId;
            }
        }
        public int AppID()
        {
            try
            {
                SqlConnection cn = new SqlConnection(DbConnection.DbConnectionString);
                cn.Open();
                string a = "select top(1) areaid from area order by areaid desc";
                SqlCommand cmd = new SqlCommand(a, cn);
                //cmd.Parameters.AddWithValue("@userid", userid);
                // cmd.Parameters.AddWithValue("@status", status);
                SqlDataReader rdr = cmd.ExecuteReader();
                int id = 0;
                while (rdr.Read())
                {

                    id = rdr.GetInt32(0);

                }
                return id;
            }
            catch (Exception ex)
            {
                return 0;
            }

        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int areadId = (int)(txtareaid.Value);
                    using (var ctx = new ModelEntities())
                    {
                        Area area = new Area();
                        area.AreaID = areadId;
                        area.AreaName = txtname.Text;
                        // area.StationId = cmb.SelectedValue;
                        area.EntryBy = Page.User.Identity.Name;
                        area.EntryDate = DateTime.Now;

                        ctx.Areas.Add(area);
                        ctx.SaveChanges();

                        result.ForeColor = Color.Green;
                        result.Text = "Area added successfully";

                        AuditLog log = new AuditLog();
                        log.Action = "Area with ID='" + area.AreaID + "'" + " " + "inserted";
                        log.Username = Page.User.Identity.Name;
                        // log.StationID = int.Parse(GetStationId());
                        log.ActionDate = DateTime.Now;
                        ctx.AuditLogs.Add(log);
                        ctx.SaveChanges();

                        grid.Rebind();

                        txtname.Text = "";
                        int applicationId = AppID();

                        int nextAppId = applicationId + 1;
                        txtareaid.Value = nextAppId;

                    }
                }
            }
            catch (Exception ex)
            {
                result.Text = ex.Message;
            }
        }
        protected void grid_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case RadGrid.UpdateCommandName:
                        {
                            GridEditFormItem item = (GridEditFormItem)e.Item;
                            string id = item.GetDataKeyValue("AreaID").ToString();
                            int areaId = int.Parse(id);
                            TextBox description = (TextBox)item["AreaName"].Controls[0];
                            //  RadNumericTextBox amt = (RadNumericTextBox)item["RentAmount"].Controls[0];
                            // RadComboBox stationid = (RadComboBox)item.FindControl("rcmb");
                            //RadComboBox station = (RadComboBox)item.FindControl("StationIdRadComboBox");

                            using (var ctx = new ModelEntities())
                            {
                                var query = ctx.Areas.Where(l => l.AreaID == areaId).FirstOrDefault();
                                query.AreaName = description.Text;


                                ctx.SaveChanges();

                                AuditLog log = new AuditLog();
                                log.Action = "Area" + " " + description.Text + " " + "updated";
                                log.Username = Page.User.Identity.Name;
                                // log.StationID = int.Parse(GetStationId());
                                log.ActionDate = DateTime.Now;
                                ctx.AuditLogs.Add(log);
                                ctx.SaveChanges();
                            }

                            break;
                        }
                    case RadGrid.DeleteCommandName:
                        {
                            GridDataItem item = (GridDataItem)e.Item;
                            string id = item.GetDataKeyValue("AreaID").ToString();
                            int areaID = int.Parse(id);
                            using (var ctx = new ModelEntities())
                            {
                                var itemToRemove = ctx.Areas.SingleOrDefault(x => x.AreaID == areaID); //returns a single item.

                                if (itemToRemove != null)
                                {
                                    ctx.Areas.Remove(itemToRemove);
                                    ctx.SaveChanges();
                                    result.ForeColor = Color.Green;
                                    result.Text = "Record deleted successfully";

                                    AuditLog log = new AuditLog();
                                    log.Action = "Area Id" + " " + itemToRemove.AreaID + " " + "removed";
                                    log.Username = Page.User.Identity.Name;
                                    // log.StationID = int.Parse(GetStationId());
                                    log.ActionDate = DateTime.Now;
                                    ctx.AuditLogs.Add(log);
                                    ctx.SaveChanges();
                                }
                            }


                            break;

                        }

                }
            }

            catch (InvalidOperationException ex)
            {
                result.Text = ex.Message;
            }
            catch (SqlException ex)
            {
                result.Text = ex.GetBaseException().Message;
            }
            catch (Exception ex)
            {
                string hresult = ex.HResult.ToString();
                if (hresult == "-2146233087")
                {
                    result.Text = "Cannot delete area,area has child records";
                }
                else
                {
                    result.Text = ex.GetBaseException().Message;
                }
            }



        }
        protected void grid_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                //GridDataItem item = (GridDataItem)e.Item;
                //RadComboBox ddl = (RadComboBox)item.FindControl("rcmb");

                //Label ddlText = (Label)item.FindControl("cmblbl");
                //if (!string.IsNullOrEmpty(ddl.SelectedValue))
                //{
                //    ddlText.Text = ddl.SelectedItem.Text;
                //}
            }


        }
        protected void grid_Init(object sender, EventArgs e)
        {
            GridFilterMenu menu = grid.FilterMenu;
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