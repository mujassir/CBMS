//using CbmsLib;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;


namespace cbmsWA
{
    public partial class adddepartment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btnadd_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    using (var ctx = new ModelEntities())
                    {

                        Department depart = new Department();
                        // area.AreaId = txtareaid.Text;
                        depart.DepartmentName = txtname.Text;
                        // area.StationId = cmb.SelectedValue;


                        ctx.Departments.Add(depart);
                        ctx.SaveChanges();

                        result.ForeColor = Color.Green;
                        result.Text = "Department added successfully";
                        grid.Rebind();

                        AuditLog log = new AuditLog();
                        log.Action = "Department" + txtname.Text + " " + "added";
                        log.Username = Page.User.Identity.Name;
                        // log.StationID = int.Parse(GetStationId());
                        log.ActionDate = DateTime.Now;
                        ctx.AuditLogs.Add(log);
                        ctx.SaveChanges();

                        txtname.Text = "";
                        // txtareaid.Text = "";
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

        }
        protected void grid_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

        }
    }

}