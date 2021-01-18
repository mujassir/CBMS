using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
//using CbmsLib;
using Telerik.Web.UI;


namespace cbmsWA
{
    public partial class report : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                clock.Text = DateTime.Now.ToString();
                string[] userRoles = Roles.GetRolesForUser(Page.User.Identity.Name);
                foreach (var role in userRoles)
                {
                    using (var ctx = new ModelEntities())
                    {
                        var query = ctx.UserGroups.Where(g => g.GroupName == role).FirstOrDefault();
                        if (query != null)
                        {

                            //foreach (var group in query)
                            //{
                            int groupId = query.GroupId;
                            var accessRule = ctx.RulesInGroups.Where(r => r.GroupId == groupId);

                            foreach (var ruleId in accessRule)
                            {
                                var accessName = ctx.AccessRules.Where(a => a.AccessRuleId == ruleId.AccessRuleId);
                                foreach (var name in accessName)
                                {

                                    foreach (RadPanelItem item in nav.GetAllItems())
                                    {
                                        if (item.Text == name.AccessRuleName)
                                        {
                                            // nav.Parent.Visible = true;
                                            item.Parent.Visible = true;
                                            nav.FindItemByText(name.AccessRuleName).Visible = true;
                                        }
                                    }



                                }
                            }
                            // }
                        }
                    }
                }

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }

        }
    }
}