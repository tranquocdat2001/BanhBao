using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FluentData;
using System.Configuration;

namespace DAL
{
    public class MainDB
    {
        protected IDbContext Context()
        {
            return new DbContext().ConnectionString(ConfigurationManager.ConnectionStrings["DB"].ToString(), new SqlServerProvider());
        }

       
    }
}
