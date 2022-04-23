using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;

namespace app.Pages
{
    public class VandyModel : PageModel
    {
        private readonly ILogger<VandyModel> _logger;

        public VandyModel(ILogger<VandyModel> logger)
        {
            _logger = logger;
        }

        public void OnGet()
        {
        }
    }
}
