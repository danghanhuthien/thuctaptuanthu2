page 50130 ApiKhachHang
{
    APIGroup = 'apiGroup';
    APIPublisher = 'ApiKhachHanggggggggggg';
    APIVersion = 'v1.0';
    ApplicationArea = All;
    Caption = 'apiKhachHang';
    DelayedInsert = true;
    EntityName = 'KhachHang';
    EntitySetName = 'KhachHangs';
    PageType = API;
    SourceTable = TableKhachHang;

    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idkh; Rec.idkh)
                {
                    Caption = 'Mã khách hàng';
                }
                field(tenkh; Rec.tenkh)
                {
                    Caption = 'Tên khách hàng';
                }
                field(hinhanh; Rec.hinhanh)
                {
                    Caption = 'Hình ảnh';
                }
                field(diachi; Rec.diachi)
                {
                    Caption = 'Địa chỉ';
                }
                field(sdt; Rec.sdt)
                {
                    Caption = 'Số điện thoại';
                }
                field(chuoihinhanh; Rec.chuoihinhanh)
                {
                    Caption = 'Chuổi mã hóa base64';
                }

            }
        }
    }
}
