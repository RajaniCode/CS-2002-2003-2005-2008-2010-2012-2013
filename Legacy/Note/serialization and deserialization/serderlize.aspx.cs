using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.IO;
using System.Runtime.Serialization;
using System.Runtime.Serialization.Formatters;
using System.Runtime.Serialization.Formatters.Soap;
using System.Xml;
using System.Xml.Serialization;
using System.Xml.Serialization.Advanced;
public partial class serderlize : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            
            secreteClass objSecrete = new secreteClass();
            objSecrete.MyAccNum = 123321456;
       
            //Soap serialization technique
            SoapFormatter formatter = new SoapFormatter();
            Stream objfilestream = new FileStream("c:\\Myserialzed.xml", FileMode.Create, FileAccess.Write, FileShare.None);

            formatter.Serialize(objfilestream, objSecrete);
            objfilestream.Close();
            //deserialization
            Stream objreadstream = new FileStream("c:\\Myserialzed.xml", FileMode.Open, FileAccess.Read, FileShare.Read);
            secreteClass objSecrete2 = (secreteClass)formatter.Deserialize(objreadstream);

            int Myaccno = objSecrete2.MyAccNum;
            Response.Write("AccNo: " + Myaccno.ToString());
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }

        
    }
    
    [Serializable]
    public class secreteClass
    {
        private int myaccountnumber = 0;
        [NonSerialized()]
        private string password = "qwerty321";

        public int MyAccNum
        {
            get
            {
                return myaccountnumber;
            }
            set
            {
                myaccountnumber = value;
            }
        }
        public string Passwd
        {
            get
            {
                return password;
            }
            set
            {
                password = value;
            }
        }
        public secreteClass()
        {

        }

    }
   
}
