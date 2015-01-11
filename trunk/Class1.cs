using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Diagnostics;

namespace MAPatcher
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Process p = new Process();
            p.StartInfo.FileName = @"F:\ROM Hacking\FCEUxd\fceuxd.exe";
            p.StartInfo.Arguments = @"""F:\Rom Hacking\Mario Adventure 3\MarioAdventure3.nes""";
            p.Start();
        }
    }
}
