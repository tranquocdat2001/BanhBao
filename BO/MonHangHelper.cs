using Entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using DAL;

namespace BO
{
    public class MonHangHelper
    {
        public MonHangInfo GetMonHangInfo(int monHangId)
        {
            MonHangDAL ojDAL = new MonHangDAL();
            return ojDAL.GetMonHangInfo(monHangId);

        }
    }
}
