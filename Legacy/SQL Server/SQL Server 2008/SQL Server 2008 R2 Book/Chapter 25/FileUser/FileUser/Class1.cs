using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections;
using System.IO;
using System.Security.Permissions;

namespace FileUser
{
    public class Class1
    {
        public static string[] ReadFile(string nameoffile)
        {
            FileIOPermission pm = new FileIOPermission(FileIOPermissionAccess.Read, nameoffile);
            pm.Demand();
            ArrayList Personnames = new ArrayList();
            FileStream fs = new FileStream(nameoffile, FileMode.Open, FileAccess.Read);

            StreamReader sr = new StreamReader(fs);
            while (sr.Peek() >= 0)
                Personnames.Add(sr.ReadLine());
            sr.Close();
            fs.Close();
            return (string[])Personnames.ToArray(typeof(string));
        }

    }
}
