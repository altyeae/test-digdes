using System.IO;
using System.Text.RegularExpressions;
using System.Linq;

File.WriteAllText("pathOut.txt", string.Join("\r\n", Regex.Matches(File.ReadAllText("pathIn.txt"), @"\b\w+\b")
    .Cast<Match>().Select(x => x.Value)
    .GroupBy(x => x)
    .OrderByDescending(x => x.Count()).Select(x => $"{x.Key} {x.Count()}")));
