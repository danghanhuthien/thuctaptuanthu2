page 50121 PageKhachHangDetails
{
    ApplicationArea = All;
    Caption = 'PageKhachHangDetails';
    PageType = Card;
    SourceTable = TableKhachHang;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'General';

                field(idkh; Rec.idkh)
                {
                    ToolTip = 'Specifies the value of the idkh field.', Comment = '%';
                }
                field(tenkh; Rec.tenkh)
                {
                    ToolTip = 'Specifies the value of the tenkh field.', Comment = '%';
                }
                field(sdt; Rec.sdt)
                {
                    ToolTip = 'Specifies the value of the sdt field.', Comment = '%';
                }
                field(diachi; Rec.diachi)
                {
                    ToolTip = 'Specifies the value of the diachi field.', Comment = '%';
                }
            }
        }
        area(FactBoxes)
        {
            part(InfoKhachHang; PageKhachHangImage)
            {

                Caption = 'Hình ảnh cá nhân';
                ApplicationArea = All;
                SubPageLink = idkh = FIELD(idkh); // Liên kết trang phụ với trang chính
            }
            part(tongdonhang; PageKhachHangTongOrder)
            {
                SubPageLink = CustomerID = FIELD(idkh); // Liên kết trang phụ với trang chính
                Caption = 'Số liệu khách hàng';
                ApplicationArea = All;
            }
        }
    }

}
