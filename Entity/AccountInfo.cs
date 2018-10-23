using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entity
{
    public class AccountInfo
    {
        public Int32 AccountID { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
        public string ListCategoryId { get; set; }
        public string FullName { get; set; }
        public int Permission { get; set; }
        public Int32 Role { get; set; }
        public Int32 Status { get; set; }
        public DateTime CreatedDate { get; set; }
    }

    public static class AccountPermissionStates
    {
        public static int TurnOn(this int s, int b) { return s | b; }
        public static int TurnOn(this int s, PermissionStates b) { return s | (int)b; }
        public static int TurnOff(this int s, PermissionStates b) { return s & ~(int)b; }
        
        public static int TurnOff(this int s, int b) { return s & ~b; }
        public static int TurnOn(this int s, RoleStates b) { return s | (int)b; }
        public static int TurnOff(this int s, RoleStates b) { return s & ~(int)b; }

        public static bool HasState(this int s, PermissionStates b)
        {
            return (s & (int)b) == (int)b;
        }
        public static bool HasState(this int s, RoleStates b)
        {
            return (s & (int)b) == (int)b;
        }
        public static bool HasState(this int s, int b)
        {
            return (s & b) == b;
        }
        public static int Keep(this int s, params PermissionStates[] b) { return s & (int)b.Cast<int>().Sum(); }

        
    }

    [Flags]
    public enum PermissionStates
    {
        VietBai = 1 << 0, //1
        BienTapBaiViet = 1 << 1,//2 
        XuatBanBaiViet = 1 << 2,//4
        XuatBanBaiVietQuanTrong = 1 << 3,//8
        DuyetComment = 1 << 4,//16
        QuanLyAccount = 1 << 5,//32
        QuanLyChuDe = 1 << 6//64
        //PAYED = 1 << 7, //128
        //SALECHECKED = 1 << 8, //256
        //OWNER = 1 << 9,//512
        //AUTOUP = 1 << 10,//1024
        //SMS = 1 << 11,//2048
        //OLD = 1 << 12,//4096
        //MAPCFRM = 1 << 13,//8192
        //UNCENSORED = 1 << 14,//16384 - Tin VIP chưa duyệt
        //ISVIP = 1 << 15,//32768 - Tin của khách hàng VIP gửi lên
        //MAPUSRCHANGE = 1 << 16,// 65536
        //ALLOWRESUBMIT = 1 << 17,//131072
        //FAILURE = 1 << 18,//262144 - Tin sai
        //ISBROKER = 1 << 19,//524288 - DA XAC DINH LA TIN MOI GIOI.
        //ISMAILTOOWNER = 1 << 20,//1048576 - DANH DAU LA CO GUI TIN CHO CHINH CHU CRAWLER
        //DONE = 1 << 21//2097152 - ĐÁNH DẤU TIN ĐÃ BÁN/CHO THUÊ
    };


    [Flags]
    public enum RoleStates
    {
        PhongVien = 1 << 0, //1
        ThuKyMuc = 1 << 1,//2 
        ThuKyToaSoan = 1 << 2,//4 
        QuanTri = 1 << 3//8 
        //PUB = 1 << 4,//16 
        //DIS = 1 << 5, //32
        //MOD = 1 << 6, //64
        //PAYED = 1 << 7, //128
        //SALECHECKED = 1 << 8, //256
        //OWNER = 1 << 9,//512
        //AUTOUP = 1 << 10,//1024
        //SMS = 1 << 11,//2048
        //OLD = 1 << 12,//4096
        //MAPCFRM = 1 << 13,//8192
        //UNCENSORED = 1 << 14,//16384 - Tin VIP chưa duyệt
        //ISVIP = 1 << 15,//32768 - Tin của khách hàng VIP gửi lên
        //MAPUSRCHANGE = 1 << 16,// 65536
        //ALLOWRESUBMIT = 1 << 17,//131072
        //FAILURE = 1 << 18,//262144 - Tin sai
        //ISBROKER = 1 << 19,//524288 - DA XAC DINH LA TIN MOI GIOI.
        //ISMAILTOOWNER = 1 << 20,//1048576 - DANH DAU LA CO GUI TIN CHO CHINH CHU CRAWLER
        //DONE = 1 << 21//2097152 - ĐÁNH DẤU TIN ĐÃ BÁN/CHO THUÊ
    };
}
