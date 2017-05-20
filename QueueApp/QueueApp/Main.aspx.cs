using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QueueApp
{
    public partial class Main : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnCitizen.BackColor = System.Drawing.Color.Blue;
            btnAnonymous.BackColor = System.Drawing.ColorTranslator.FromHtml("#0094ff");
            btnOrganisation.BackColor = System.Drawing.ColorTranslator.FromHtml("#0094ff");
        }

        private void BindGrid(int rowcount)
        {
            DataTable dt = new DataTable();
            DataRow dr;
            dt.Columns.Add(new System.Data.DataColumn("#", typeof(int)));
            dt.Columns.Add(new System.Data.DataColumn("Type", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Name", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Service", typeof(String)));
            dt.Columns.Add(new System.Data.DataColumn("Queued at", typeof(String)));

            if (ViewState["CurrentData"] != null)
            {
                for (int i = 0; i < rowcount + 1; i++)
                {
                    dt = (DataTable)ViewState["CurrentData"];
                    if (dt.Rows.Count > 0)
                    {
                        dr = dt.NewRow();
                        dr[0] = dt.Rows[0][0].ToString();

                    }
                }
               
            }
                dr = dt.NewRow();
                dr[0] = dt.Rows.Count + 1;
                dr[1] = hdnType.Value==""?btnCitizen.Text:hdnType.Value;
                dr[2] = drpTitle.SelectedValue +' '+ txtFname.Text + ' ' + txtLname.Text;
                dr[3] = rdbServices.Text;
                dr[4] = DateTime.Now.ToString("t");

                dt.Rows.Add(dr);

           

            // If ViewState has a data then use the value as the DataSource
            if (ViewState["CurrentData"] != null)
            {
                grdQueue.DataSource = (DataTable)ViewState["CurrentData"];
                grdQueue.DataBind();
            }
            else
            {
                // Bind GridView with the initial data assocaited in the DataTable
                grdQueue.DataSource = dt;
                grdQueue.DataBind();

            }
            // Store the DataTable in ViewState to retain the values
            ViewState["CurrentData"] = dt;

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            // Check if the ViewState has a data assoiciated within it. 
            if (ViewState["CurrentData"] != null)
            {
                DataTable dt = (DataTable)ViewState["CurrentData"];
                int count = dt.Rows.Count;
                BindGrid(count);
            }
            else
            {
                BindGrid(1);
            }
            txtFname.Text = "";
            txtLname.Text="";
           
        }

        protected void btnCitizen_Click(object sender, EventArgs e)
        {
            btnCitizen.BackColor = System.Drawing.Color.Blue;
            btnOrganisation.BackColor = System.Drawing.ColorTranslator.FromHtml("#0094ff");
            btnAnonymous.BackColor = System.Drawing.ColorTranslator.FromHtml("#0094ff");
        }

        protected void btnOrganisation_Click(object sender, EventArgs e)
        {
            btnCitizen.BackColor = System.Drawing.ColorTranslator.FromHtml("#0094ff");
            btnOrganisation.BackColor = System.Drawing.Color.Blue;
            btnAnonymous.BackColor = System.Drawing.ColorTranslator.FromHtml("#0094ff");
        }

        protected void btnAnonymous_Click(object sender, EventArgs e)
        {
            btnCitizen.BackColor = System.Drawing.ColorTranslator.FromHtml("#0094ff");
            btnOrganisation.BackColor = System.Drawing.ColorTranslator.FromHtml("#0094ff");
            btnAnonymous.BackColor = System.Drawing.Color.Blue;
        }
    }
}