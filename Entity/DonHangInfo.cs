using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class DonHangInfo
    {
        public Int32 ID { get; set; }
        
        public Int32 KhachHangID { get; set; }
        public Int32 ShipFee { get; set; }
        public Int32 TotalAmount { get; set; }
        public Int32 Discount { get; set; }
        public DateTime CreateDate { get; set; }
    }
}
