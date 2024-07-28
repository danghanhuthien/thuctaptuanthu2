page 50118 PageKhachHang
{
    ApplicationArea = All;
    Caption = 'Khách Hàng';
    PageType = List;
    SourceTable = "TableKhachHang";
    UsageCategory = Lists;
    CardPageId = 50121;
    layout

    {
        area(Content)
        {
            repeater(General)
            {
                field(idkh; Rec.idkh)
                {
                    ToolTip = 'Specifies the value of the idkh field.', Comment = '%';
                    DrillDown = true;
                    trigger OnDrillDown()
                    var
                        PageKhachHangDetails: Page "PageKhachHangDetails";
                    begin
                        PageKhachHangDetails.SetRecord(Rec);
                        PageKhachHangDetails.Run();
                    end;
                }
                field(tenkh; Rec.tenkh)
                {
                    ToolTip = 'Specifies the value of the tenkh field.', Comment = '%';
                    NotBlank = true;
                }
                field(sdt; Rec.sdt)
                {
                    ToolTip = 'Specifies the value of the sdt field.', Comment = '%';
                }
                field(diachi; Rec.diachi)
                {
                    ToolTip = 'Specifies the value of the diachi field.', Comment = '%';
                }
                field(chuoihinhanh; Rec.chuoihinhanh)
                {
                    ToolTip = 'Specifies the value of the diachi field.', Comment = '%';
                    ApplicationArea = all;
                }

            }

        }
    }
    // actions
    // {
    //     area(processing)
    //     {
    //         action("View Details")
    //         {
    //             ApplicationArea = All;
    //             RunObject = Page "PageKhachHangDetails";
    //             Caption = 'Thêm mới';
    //             Image = View;
    //             Promoted = true;
    //             PromotedCategory = Process;
    //         }
    //     }
    // }

}
