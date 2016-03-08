using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Full_Website
{
    public partial class Querytop : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBoxTop2.Enabled = true;
            ListBoxTop2.DataBind();
            GridView1.Enabled = false;
            GridView2.Enabled = false;

        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
        }

        protected void ListBoxTop2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBoxTop3.Enabled = true;
            ListBoxTop3.DataBind();
            GridView1.Visible = false;
            GridView2.Visible = false;
        }

        protected void GetTopTen_Click(object sender, EventArgs e)
        {
            GridView1.Visible = true;
            GridView1.DataBind();
            Label3.Visible = true;
        }

        protected void GetLowTen_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            GridView2.DataBind();
            Label4.Visible = true;
        }

        protected void ListBoxTop3_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridView1.Visible= false;
            GridView2.Visible = false;
        }

        protected void SqlDataSource4_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
            Session["PARAM_ID"] = ListBoxTop3.SelectedValue;
        }

        protected void SqlDataSource5_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBoxTop1.SelectedValue;
            Session["MLOC_ID"] = ListBoxTop2.SelectedValue;
            Session["PARAM_ID"] = ListBoxTop3.SelectedValue;
        }

        protected void Dates_Click(object sender, EventArgs e)
        {
            Label1.Visible = true;
            Label2.Visible = true;
            TextBox1.Visible = true;
            TextBox2.Visible = true;
            Calendar1.Visible = true;
            Calendar2.Visible = true;
            Dates.Visible = false;
        }
    }
}