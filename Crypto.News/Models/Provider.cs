using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Crypto.News.Models
{
    public class Provider
    { 
        public string Key { get; set; }
        public string Name { get; set; }

        [JsonProperty("lang")]
        public string Language { get; set; }

        [JsonProperty("img")]
        public string ImgUrl { get; set; }
           
    }
}
