using System;
using System.Collections.Generic;
using System.Data.Odbc;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace nightshop
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void ProfileButton_Click(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://supersonic-club.fr/events/");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://lemazette.com/programmation");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ChangeIframe", "changeIframeSrc('https://www.youtube.com/embed/HcgYbgWaejc?si=MJn3yCdD7EeOE1Rs');", true);
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ChangeIframe", "changeIframeSrc('https://www.youtube.com/embed/1a2qboPo8zQ?si=IG7WhkPudE05_ZvU');", true);
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "ChangeIframe", "changeIframeSrc('https://www.youtube.com/embed/MQkVRmZEi4M?si=rKafyRjKPyX_1bFe');", true);
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
            Response.Redirect("https://linktr.ee/noctilians");
        }

    }
}