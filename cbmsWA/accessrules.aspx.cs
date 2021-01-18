using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//using CbmsLib;


namespace cbmsWA
{
    public partial class accessrules : System.Web.UI.Page
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
                    bool b = chk.Items.Cast<ListItem>().Any(i => i.Selected);
                    if (b == true)
                    {
                        using (var ctx = new ModelEntities())
                        {
                            UserGroup group = new UserGroup();
                            group.EntryBy = Page.User.Identity.Name;
                            group.EntryDate = DateTime.Now;
                            group.GroupName = txtgroup.Text;
                            ctx.UserGroups.Add(group);
                            ctx.SaveChanges();

                            if (!Roles.RoleExists(txtgroup.Text))
                            // Create the role
                            {
                                Roles.CreateRole(txtgroup.Text);
                            }

                            foreach (ListItem rolebox in chk.Items)
                            {
                                if (rolebox.Selected)
                                {
                                    RulesInGroup rig = new RulesInGroup();
                                    //rig.Id = 18;
                                    rig.GroupId = group.GroupId;
                                    rig.AccessRuleId = int.Parse(rolebox.Value);
                                    ctx.RulesInGroups.Add(rig);
                                    ctx.SaveChanges();
                                }
                            }

                            result.ForeColor = System.Drawing.Color.Green;
                            result.Text = "User group added successfully";
                            txtgroup.Text = "";
                            //  chk.ClearSelection();
                        }
                    }
                    else
                    {
        //                result.ForeColor = System.Drawing.Color.Green;
                        result.Text = "Kindly select an Access rule";
                    }
                }
            }
            catch (Exception ex)
            {
                result.Text = ex.GetBaseException().Message;
            }
        }


        protected void cmb_SelectedIndexChanged(object sender, Telerik.Web.UI.RadComboBoxSelectedIndexChangedEventArgs e)
        {
            try
            {
                CheckBoxList1.Enabled = true;
                int selected = int.Parse(cmb.SelectedValue);
                using (var ctx = new ModelEntities())
                {
                    var query = ctx.RulesInGroups.Where(a => a.GroupId == selected);

                    foreach (var group in query)
                    {

                        ListItem checkbox = CheckBoxList1.Items.FindByValue(group.AccessRuleId.ToString());
                        checkbox.Selected = true;

                    }
                }
            }
            catch (Exception ex)
            {
                result.Text = ex.GetBaseException().Message;
            }
        }
        public string GetStationId()
        {

            using (var ctx = new ModelEntities())
            {
                var query = ctx.UserDetails.Where(u => u.UserName == Page.User.Identity.Name).FirstOrDefault();
                return query.StationID.ToString();
            }
        }
        public string GetAreaID()
        {
                using(var ctx=new ModelEntities())
            {
                var udetail = ctx.UserDetails.Where(p => p.UserName == Page.User.Identity.Name ).FirstOrDefault();
                return udetail.AreaID.ToString();
            }
        }
        protected void btnupd_Click(object sender, EventArgs e)
        {
            try
            {
                if (!string.IsNullOrEmpty(cmb.SelectedValue))
                {

                    int groupId = int.Parse(cmb.SelectedValue);

                    //bool b = CheckBoxList1.Items.Cast<ListItem>().Any(i => i.Selected);
                    //if (b == true)
                    //{
                    using (var ctx = new ModelEntities())
                    {

                        foreach (ListItem rolebox in CheckBoxList1.Items)
                        {
                            if (rolebox.Selected)
                            {

                                int roleId = int.Parse(rolebox.Value);
                                var query = ctx.RulesInGroups.Where(a => a.AccessRuleId == roleId && a.GroupId == groupId).FirstOrDefault();
                                if (query == null)
                                {
                                    
                                    RulesInGroup rig = new RulesInGroup();
                                   // SET IDENTITY_INSERT RulesInGroup OFF
                                    rig.GroupId = groupId;
                                    rig.AccessRuleId = roleId;
                                    //rig.Id = 18;
                                    ctx.RulesInGroups.Add(rig);

                                    ctx.SaveChanges();

                                    AuditLog log = new AuditLog();
                                    log.Action = "Roles Updated";
                                    log.Username = Page.User.Identity.Name;
                                    log.StationID = int.Parse(GetStationId());
                                    log.ActionDate = DateTime.Now;
                                    log.AreaID = int.Parse(GetAreaID());
                                    ctx.AuditLogs.Add(log);
                                    ctx.SaveChanges();
                                    lblresult.ForeColor = System.Drawing.Color.Green;
                                    lblresult.Text = "Roles updated successfully";
                                    Response.Redirect("~/accessrules.aspx");


                                }

                            }
                            else if (!rolebox.Selected)
                            {
                                int roleId = int.Parse(rolebox.Value);

                                var itemToRemove = ctx.RulesInGroups.SingleOrDefault(a => a.AccessRuleId == roleId && a.GroupId == groupId); //returns a single item.

                                if (itemToRemove != null)
                                {
                                    ctx.RulesInGroups.Remove(itemToRemove);
                                    //  ctx.SaveChanges();


                                    AuditLog log = new AuditLog();
                                    log.Action = "Roles Updated";
                                    log.Username = Page.User.Identity.Name;
                                    log.StationID = int.Parse(GetStationId());
                                    log.ActionDate = DateTime.Now;
                                    ctx.AuditLogs.Add(log);
                                    ctx.SaveChanges();

                                    lblresult.ForeColor = System.Drawing.Color.Green;
                                    lblresult.Text = "Roles updated successfully";
                                    Response.Redirect("~/accessrules.aspx");

                                }
                            }
                        }


                    }

                }
            }
            catch (Exception ex)
            {
                lblresult.Text = ex.GetBaseException().Message;
            }
        }
    }
}