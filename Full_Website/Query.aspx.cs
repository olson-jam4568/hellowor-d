using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Full_Website
{
    public partial class Query : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ListBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox2.Enabled = true;
            ListBox2.DataBind();
        }

        protected void SqlDataSource2_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["PRJ_ID"] = ListBox1.SelectedValue;
        }

        protected void ListBox2_SelectedIndexChanged(object sender, EventArgs e)
        {
            ListBox3.Enabled = true;
            ListBox3.DataBind();
        }

        protected void SqlDataSource3_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {
            Session["MLOC_ID"] = ListBox2.SelectedValue;
        }

        protected void Year_Click(object sender, EventArgs e)
        {
            TextBox1.Enabled = true;
            TextBox2.Enabled = true;
            TextBox2.Text = DateTime.Now.ToShortDateString();
            TextBox1.Text = DateTime.Now.AddYears(-1).ToShortDateString();
        }

        protected void Month_Click(object sender, EventArgs e)
        {
            TextBox1.Enabled = true;
            TextBox2.Enabled = true;
            TextBox2.Text = DateTime.Now.ToShortDateString();
            TextBox1.Text = DateTime.Now.AddMonths(-1).ToShortDateString();
        }

        protected void Week_Click(object sender, EventArgs e)
        {
            TextBox1.Enabled = true;
            TextBox2.Enabled = true;
            TextBox2.Text = DateTime.Now.ToShortDateString();
            TextBox1.Text = DateTime.Now.AddDays(-7).ToShortDateString();
        }

        protected void backyr_Click(object sender, EventArgs e)
        {
            DateTime CurrentDateStart = Convert.ToDateTime(TextBox1.Text);
            DateTime StartDate = CurrentDateStart.AddYears(-1);
            TextBox1.Text = StartDate.ToShortDateString();

            DateTime CurrentDateEnd = Convert.ToDateTime(TextBox2.Text);
            DateTime EndDate = CurrentDateEnd.AddYears(-1);
            TextBox2.Text = EndDate.ToShortDateString();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            DateTime CurrentDateStart = Convert.ToDateTime(TextBox1.Text);
            DateTime StartDate = CurrentDateStart.AddYears(1);
            TextBox1.Text = StartDate.ToShortDateString();

            DateTime CurrentDateEnd = Convert.ToDateTime(TextBox2.Text);
            DateTime EndDate = CurrentDateEnd.AddYears(1);
            TextBox2.Text = EndDate.ToShortDateString();
        }

        protected void backmonth_Click(object sender, EventArgs e)
        {
            DateTime CurrentDateStart = Convert.ToDateTime(TextBox1.Text);
            DateTime StartDate = CurrentDateStart.AddMonths(-1);
            TextBox1.Text = StartDate.ToShortDateString();

            DateTime CurrentDateEnd = Convert.ToDateTime(TextBox2.Text);
            DateTime EndDate = CurrentDateEnd.AddMonths(-1);
            TextBox2.Text = EndDate.ToShortDateString();
        }

        protected void addmonth_Click(object sender, EventArgs e)
        {
            DateTime CurrentDateStart = Convert.ToDateTime(TextBox1.Text);
            DateTime StartDate = CurrentDateStart.AddMonths(1);
            TextBox1.Text = StartDate.ToShortDateString();

            DateTime CurrentDateEnd = Convert.ToDateTime(TextBox2.Text);
            DateTime EndDate = CurrentDateEnd.AddMonths(1);
            TextBox2.Text = EndDate.ToShortDateString();
        }

        protected void backweek_Click(object sender, EventArgs e)
        {
            DateTime CurrentDateStart = Convert.ToDateTime(TextBox1.Text);
            DateTime StartDate = CurrentDateStart.AddDays(-7);
            TextBox1.Text = StartDate.ToShortDateString();

            DateTime CurrentDateEnd = Convert.ToDateTime(TextBox2.Text);
            DateTime EndDate = CurrentDateEnd.AddDays(-7);
            TextBox2.Text = EndDate.ToShortDateString();
        }

        protected void addweek_Click(object sender, EventArgs e)
        {
            DateTime CurrentDateStart = Convert.ToDateTime(TextBox1.Text);
            DateTime StartDate = CurrentDateStart.AddDays(7);
            TextBox1.Text = StartDate.ToShortDateString();

            DateTime CurrentDateEnd = Convert.ToDateTime(TextBox2.Text);
            DateTime EndDate = CurrentDateEnd.AddDays(7);
            TextBox2.Text = EndDate.ToShortDateString();
        }

        protected void GetData_Click(object sender, EventArgs e)
        {
            Session["MLOC_ID"] = ListBox2.SelectedValue;
            Session["Param_ID"] = ListBox3.SelectedValue;
            Session["SRESDATE"] = TextBox1.Text;
            Session["ERESDATE"] = TextBox2.Text;
            Response.Redirect("Results1.aspx");
        }
    }
}