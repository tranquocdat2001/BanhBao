using Entity;
using FluentData;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DAL
{
    public class MonHangDAL: MainDB
    {
        public MonHangInfo GetMonHangInfo(int monHangId)
        {
            using (var context = Context())
            {
                return context.StoredProcedure("GetMonHangInfo")
                    .Parameter("id", monHangId, DataTypes.Int32)
                    .QuerySingle<MonHangInfo>();
            }
        }
    }
}
