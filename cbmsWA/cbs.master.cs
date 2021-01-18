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
    public partial class cbs : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                clock.Text = DateTime.Now.ToString("dd-MMM-yyyy hh:mm");
                string[] userRoles = Roles.GetRolesForUser(Page.User.Identity.Name);
                foreach (var role in userRoles)
                {
                    using (var ctx = new ModelEntities())
                    {
                        var user = ctx.UserDetails.Where(u => u.UserName == Page.User.Identity.Name).FirstOrDefault();
                        txtname.Text = user.EmployeeName;
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
                           
                        }
                    }
                }
                nav.DataBind();

                // ApplyAppPathModifier will add the session ID if we're using Cookieless session.
                string urlWithSessionID = Response.ApplyAppPathModifier(Request.Url.PathAndQuery);
                RadPanelItem clickedItem = nav.FindItemByUrl(urlWithSessionID);

                // Expand the parent of the clicked item
                if (clickedItem != null)
                {
                    clickedItem.ExpandParentItems();
                    ShowPath(clickedItem);
                }

                string pageContentString;
                if (Request.QueryString["page"] == null)
                {
                    pageContentString = "home";
                }
                else
                {
                    pageContentString = Request.QueryString["page"];
                }

                //Literal1.Text = String.Format("This is the <em>{0}</em> page", pageContentString);

            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);
            }


        }
        private void ShowPath(RadPanelItem clickedItem)
        {
            foreach (RadPanelItem childItem in clickedItem.PanelBar.GetAllItems())
            {
                childItem.CssClass = "";

            }

            clickedItem.CssClass = "rpSelected";

        }
        protected void HeadLoginStatus_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            //Session.Clear();
            //Session.Abandon();
            //FormsAuthentication.SignOut();
            //FormsAuthentication.RedirectToLoginPage();
        }


    }

}