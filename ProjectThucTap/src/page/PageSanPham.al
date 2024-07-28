page 50115 PageSanPham
{
    ApplicationArea = All;
    Caption = 'Sản Phẩm';
    PageType = List;
    SourceTable = TableSanPham;
    UsageCategory = Lists;
    CardPageId = 50119;
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(idsp; Rec.idsp)
                {
                    ToolTip = 'Specifies the value of the idsp field.';
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        PageSanPhamDetails: Page "PageSanPhamDetails";
                    begin
                        PageSanPhamDetails.SetRecord(Rec);
                        PageSanPhamDetails.Run();
                    end;
                }
                field(tensp; Rec.tensp)
                {
                    ToolTip = 'Specifies the value of the tensp field.';
                }
                field(dongia; Rec.dongia)
                {
                    ToolTip = 'Specifies the value of the dongia field.';
                }
                field(hinhanh; Rec.hinhanh)
                {
                    ToolTip = 'Specifies the image for the product.';
                    ApplicationArea = All;
                    Caption = 'Hình ảnh';
                }
                field(hinhanhcc; Rec.hinhanhchuoi)
                {
                    ApplicationArea = all;
                    ToolTip = 'Specifies the value of the hinh anh field.';

                }
            }
        }
    }
}
