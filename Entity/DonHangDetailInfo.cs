using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class DonHangDetailInfo
    {
        public Int32 ID { get; set; }

        public Int32 DonHangID { get; set; }
        public Int32 MonHangID { get; set; }
        public Int32 SoLuong { get; set; }
        public Int32 IsFree { get; set; }
        public DateTime CreatedDate { get; set; }
    }
}
