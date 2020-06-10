using System;
using System.Net.NetworkInformation;
using System.Linq;

namespace gpfix
{
    class Program
    {
        static int Main(string[] args)
        {
            if (args.Length != 2)
            {
                return 1;
            }

            string adapterName = args[0];
            string command = args[1];


            var adapters = NetworkInterface.GetAllNetworkInterfaces();
            var adapter = adapters.FirstOrDefault(i => i.Description == adapterName);

            if (adapter == null)
                return 2;

            var properties = adapter.GetIPProperties();

            string result = null;
            if (command == "ip")
                result = properties.UnicastAddresses.FirstOrDefault()?.Address.ToString();
            else if (command == "index")
                result = properties.GetIPv4Properties().Index.ToString();
            else
                return 3;

            Console.WriteLine(result);

            return 0;

        }
    }
}
