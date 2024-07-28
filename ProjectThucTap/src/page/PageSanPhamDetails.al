page 50119 PageSanPhamDetails
{
    ApplicationArea = All;
    Caption = 'Thông tin chi tiết sản phẩm';
    PageType = Card;
    SourceTable = TableSanPham;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Thông tin';
                field(idsp; Rec.idsp)
                {
                    ToolTip = 'Specifies the value of the idsp field.', Comment = '%';
                }
                field(tensp; Rec.tensp)
                {
                    ToolTip = 'Specifies the value of the tensp field.', Comment = '%';
                }
                field(xuatxu; Rec.dongia)
                {
                    ToolTip = 'Specifies the value of the Xuất xứ field.', Comment = '%';
                }
                field(mota; Rec.mota)
                {
                    ToolTip = 'Specifies the value of the Mô tả field.', Comment = '%';
                    MultiLine = true;

                }
                field(dongia; Rec.xuatxu)
                {
                    ToolTip = 'Specifies the value of the dongia field.', Comment = '%';
                }

            }
        }
        area(FactBoxes)
        {
            part(InfoSanPham; PageSanPhamImage)
            {

                Caption = 'Hình ảnh cá nhân';
                ApplicationArea = All;
                SubPageLink = idsp = FIELD(idsp); // Liên kết trang phụ với trang chính
            }

        }
    }
}
