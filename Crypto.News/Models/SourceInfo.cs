using Newtonsoft.Json;

namespace Crypto.News.Models
{
    public class SourceInfo
    {
        public string Name { get; set; }
        [JsonProperty("lang")]
        public string Language { get; set; }
        [JsonProperty("img")]
        public string ImageUrl { get; set; }
    }
}
