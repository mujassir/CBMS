//using CbmsLib;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using System.Drawing;

namespace cbmsWA
{
    public partial class addstation : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            costcentre.MaxLength = 10;
            txtcc.MaxLength = 10;
            txtgc.MaxLength = 10;
        }
        public int AppID(int areaId)
        {
            try
            {
                SqlConnection cn = new SqlConnection(DbConnection.DbConnectionString);
                cn.Open();
                string a = "select top(1) stationid from station where areaid=@areaid order by stationid desc";
                SqlCommand cmd = new SqlCommand(a, cn);
                cmd.Parameters.AddWithValue("@areaid", areaId);
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
                    using (var ctx = new ModelEntities())
                    {

                        Station station = new Station();
                        station.StationID = int.Parse(txtstationid.Text);
                        station.AreaID = int.Parse(cmb.SelectedValue);
                        station.StationName = txtname.Text;
                        station.CostCentre = costcentre.Text;
                        station.CreditCode = txtcc.Text;
                        // station.Location = txtlocation.Text;
                        station.StationTelNo = txttelno.Text;
                        station.GovtCredit = txtgc.Text;


                        ctx.Stations.Add(station);
                        ctx.SaveChanges();
                        result.ForeColor = Color.Green;
                        result.Text = "Station added successfully";

                        AuditLog log = new AuditLog();
                        log.Action = "Station with ID='" + station.StationID + "'" + " " + "inserted";
                        log.Username = Page.User.Identity.Name;
                        // log.StationID = int.Parse(GetStationId());
                        log.ActionDate = DateTime.Now;
                        ctx.AuditLogs.Add(log);
                        ctx.SaveChanges();

                        grid.Rebind();

                        txtname.Text = "";
                        cmb.SelectedValue = "";
                        costcentre.Text = "";
                        txtcc.Text = "";
                        //  txtlocation.Text = "";
                        txttelno.Text = "";
                        txtgc.Text = "";
                        txtstationid.Text = "";

                        // txtstationid.Text = "";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Text = ex.Message;
            }
        }
        protected void grid_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {
            if (e.Item is GridDataItem)
            {
                GridDataItem item = (GridDataItem)e.Item;
                RadComboBox ddl = (RadComboBox)item.FindControl("rcmb");

                Label ddlText = (Label)item.FindControl("cmblbl");
                Label dsText = (Label)item.FindControl("StationIdLabel");
                ddlText.Text = ddl.SelectedItem.Text;
            }
        }
        protected void grid_ItemCommand(object sender, GridCommandEventArgs e)
        {
            try
            {
                switch (e.CommandName)
                {
                    case RadGrid.UpdateCommandName:
                        {
                            GridEditFormItem item = (GridEditFormItem)e.Item;
                            string id = item.GetDataKeyValue("StationID").ToString();
                            int statId = int.Parse(id);


                            TextBox stationName = (TextBox)item["StationName"].Controls[0];

                            // TextBox location = (TextBox)item["Location"].Controls[0];

                            TextBox creditCode = (TextBox)item["CreditCode"].Controls[0];

                            TextBox costcentre = (TextBox)item["CostCentre"].Controls[0];

                            TextBox stationTel = (TextBox)item["StationTelNo"].Controls[0];

                            TextBox govtcredit = (TextBox)item["GovtCredit"].Controls[0];


                            //  RadComboBox areaid = (RadComboBox)item.FindControl("rcmb");


                            using (var ctx = new ModelEntities())
                            {
                                var query = ctx.Stations.Where(l => l.StationID == statId).FirstOrDefault();
                                query.StationName = stationName.Text;
                                // query.Location = location.Text;
                                query.GovtCredit = govtcredit.Text;
                                query.CostCentre = costcentre.Text;
                                query.StationTelNo = stationTel.Text;
                                query.CreditCode = creditCode.Text;


                                ctx.SaveChanges();

                                AuditLog log = new AuditLog();
                                log.Action = "Station" + " " + stationName.Text + " " + "updated";
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
                            string id = item.GetDataKeyValue("StationID").ToString();
                            int stationID = int.Parse(id);
                            using (var ctx = new ModelEntities())
                            {
                                var itemToRemove = ctx.Stations.SingleOrDefault(x => x.StationID == stationID); //returns a single item.

                                if (itemToRemove != null)
                                {
                                    ctx.Stations.Remove(itemToRemove);
                                    ctx.SaveChanges();
                                    result.ForeColor = Color.Green;
                                    result.Text = "Station deleted successfully";

                                    AuditLog log = new AuditLog();
                                    log.Action = "Station Id" + " " + itemToRemove.StationID + " " + "removed";
                                    log.Username = Page.User.Identity.Name;
                                    // log.StationID = int.Parse(GetStationId());
                                    log.ActionDate = DateTime.Now;
                                    ctx.AuditLogs.Add(log);
                                    ctx.SaveChanges();
                                }
                                grid.Rebind();
                            }


                            break;

                        }

                }
            }
            catch (Exception ex)
            {
                string hresult = ex.HResult.ToString();
                if (hresult == "-2146233087")
                {
                    result.Text = "Cannot delete station,station has child records";
                }
                else
                {
                    result.Text = ex.GetBaseException().Message;
                }
            }


        }
        private static DataTable GetDataTable(string queryString)
        {
            String ConnString = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            SqlConnection MySqlConnection = new SqlConnection(ConnString);
            SqlDataAdapter MySqlDataAdapter = new SqlDataAdapter();
            MySqlDataAdapter.SelectCommand = new SqlCommand(queryString, MySqlConnection);

            DataTable myDataTable = new DataTable();
            MySqlConnection.Open();
            try
            {
                MySqlDataAdapter.Fill(myDataTable);
            }
            finally
            {
                MySqlConnection.Close();
            }

            return myDataTable;
        }
        private DataTable Station
        {
            get
            {
                //object obj = this.Session["Station"];
                //if ((!(obj == null)))
                //{
                //    return ((DataTable)(obj));
                //}
                DataTable myDataTable = new DataTable();
                myDataTable = GetDataTable("SELECT * FROM Station order by stationid desc");
                //  this.Session["Station"] = myDataTable;
                return myDataTable;
            }
        }
        protected void grid_UpdateCommand(object sender, GridCommandEventArgs e)
        {
            //  GridEditableItem editedItem = e.Item as GridEditableItem;
            //  UserControl userControl = (UserControl)e.Item.FindControl(GridEditFormItem.EditFormUserControlID);

            //  //Prepare new row to add it in the DataSource
            //  DataRow[] changedRows = this.Station.Select("StationID = " + editedItem.OwnerTableView.DataKeyValues[editedItem.ItemIndex]["StationID"]);

            //  if (changedRows.Length != 1)
            //  {
            //      grid.Controls.Add(new LiteralControl("Unable to locate the Station for updating."));
            //      e.Canceled = true;
            //      return;
            //  }

            //  //Update new values
            //  Hashtable newValues = new Hashtable();

            //  newValues["StationName"] = (userControl.FindControl("name") as TextBox).Text;
            //  newValues["CostCentre"] = (userControl.FindControl("costcentre") as TextBox).Text;
            //  newValues["Location"] = (userControl.FindControl("txtlocation") as TextBox).Text;
            //  newValues["StationTelNo"] = (userControl.FindControl("stn") as TextBox).Text;
            //  //newValues["BirthDate"] = (userControl.FindControl("BirthDatePicker") as RadDatePicker).SelectedDate.ToString();
            ////  newValues["AreaID"] = (userControl.FindControl("ddl") as DropDownList).SelectedItem.Value;

            //  newValues["CreditCode"] = (userControl.FindControl("cc") as TextBox).Text;
            //  newValues["GovtCredit"] = (userControl.FindControl("gc") as TextBox).Text;
            //  //newValues["FirstName"] = (userControl.FindControl("TextBox2") as TextBox).Text;
            //  //newValues["LastName"] = (userControl.FindControl("TextBox3") as TextBox).Text;
            ////  newValues["AreaID"] = (userControl.FindControl("HireDa") as RadDatePicker).SelectedDate.ToString();
            //  //newValues["Title"] = (userControl.FindControl("TextBox4") as TextBox).Text;

            //  changedRows[0].BeginEdit();
            //  try
            //  {
            //      foreach (DictionaryEntry entry in newValues)
            //      {
            //          changedRows[0][(string)entry.Key] = entry.Value;
            //      }
            //      changedRows[0].EndEdit();
            //      this.Station.AcceptChanges();
            //  }
            //  catch (Exception ex)
            //  {
            //      changedRows[0].CancelEdit();

            //      Label lblError = new Label();
            //      lblError.Text = "Unable to update Station. Reason: " + ex.Message;
            //      lblError.ForeColor = System.Drawing.Color.Red;
            //     grid.Controls.Add(lblError);

            //      e.Canceled = true;
            //  }
        }
        protected void grid_PreRender(object sender, EventArgs e)
        {
            if (!this.IsPostBack && this.grid.MasterTableView.Items.Count > 1)
            {
                //this.grid.MasterTableView.Items[1].Edit = true;
                this.grid.MasterTableView.Rebind();
            }
        }
        protected void grid_NeedDataSource(object sender, GridNeedDataSourceEventArgs e)
        {
            this.grid.DataSource = this.Station;
            // this.Station.PrimaryKey = new DataColumn[] { this.Station.Columns["StationID"] };
        }
        protected void grid_DeleteCommand(object sender, GridCommandEventArgs e)
        {
            //string ID = (e.Item as GridDataItem).OwnerTableView.DataKeyValues[e.Item.ItemIndex]["StationID"].ToString();
            //DataTable stationTable = this.Station;
            //if (stationTable.Rows.Find(ID) != null)
            //{
            //    stationTable.Rows.Find(ID).Delete();
            //    stationTable.AcceptChanges();
            //}

            //grid.Rebind();
        }
        protected void cmb_SelectedIndexChanged(object sender, RadComboBoxSelectedIndexChangedEventArgs e)
        {


            int first = int.Parse(cmb.SelectedValue);
            int applicationId = AppID(first);
            string check = first + "01";
            int firstFig = int.Parse(check);

            using (var ctx = new ModelEntities())
            {
                var query = ctx.Stations.Where(s => s.StationID == firstFig).FirstOrDefault();
                if (query != null)
                {
                    int nextAppId = applicationId + 1;
                    txtstationid.Text = nextAppId.ToString();
                }
                else
                {
                    txtstationid.Text = firstFig.ToString();

                }
            }

            // int nextAppId = applicationId + 1;
            //// result.Text = nextAppId.ToString();
            // if (nextAppId == 1)
            // {

            //     int first = int.Parse(cmb.SelectedValue);
            //     txtstationid.Text = first.ToString() + "0" + nextAppId;
            // }
            // else
            // {
            //     string appId = applicationId.ToString().Substring(1);
            //     int nexId = int.Parse(appId) + 1;
            //     int first = int.Parse(cmb.SelectedValue);
            //     txtstationid.Text = first + nexId.ToString();


            // }
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