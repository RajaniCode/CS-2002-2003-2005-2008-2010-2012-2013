using System;
using System.Security;
using System.Security.Cryptography;
using System.Text;

public partial class GenerateMachineKey : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CreateKey();
    }
    public void CreateKey()
    {
        //The hexadecimal string that is created is twice the size of the value that is passed in. 
        //For example, if you specify 24 bytes for a key, the resulting string is 48 bytes in length after the conversion. 
        //The valid values for decryptionKey is 8 or 24. This creates a 16 byte key for Data Encryption Standard (DES) 
        //or a 48 byte key for Triple DES, respectively. Valid values for validationKey are 20 to 64. 
        //This creates keys from 40 to 128 bytes in length. The output from the code is an entire <machineKey> element 
        //that you can copy and paste into a Machine.config file.
        
        int DecryptionArg = 24;
        int ValidationArg = 32;
        lblValidationKey.Text = "validationKey=" + CreateKey(ValidationArg) + "<br>";
        lblDecryptionKey.Text = "decryptionKey=" + CreateKey(DecryptionArg) + "<br>";
        lblValidation.Text="validation=SHA1";
    }

    private String CreateKey(int numBytes)
    {
        RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider();
        byte[] buff = new byte[numBytes];

        rng.GetBytes(buff);
        return BytesToHexString(buff);
    }

    private String BytesToHexString(byte[] bytes)
    {
        StringBuilder hexString = new StringBuilder(64);

        for (int counter = 0; counter < bytes.Length; counter++)
        {
            hexString.Append(String.Format("{0:X2}", bytes[counter]));
        }
        return hexString.ToString();
    }

}
