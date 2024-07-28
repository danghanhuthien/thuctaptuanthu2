page 50126 PageOrderLine
{
    ApplicationArea = All;
    Caption = 'Chức năng';
    PageType = ListPart;
    SourceTable = TableOrderDetails;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                ShowCaption = false;
                field(id; Rec.id)
                {
                    Caption = 'Mã chi tiết';
                    ToolTip = 'Specifies the value of the Mã chi tiết field.', Comment = '%';
                }
                field(OrderID; Rec.OrderID)
                {
                    Caption = 'Mã đơn hàng';
                    ToolTip = 'Specifies the value of the Mã chi tiết field.', Comment = '%';
                    TableRelation = TableOrder.id;
                }
                field(ProductID; Rec.ProductID)
                {
                    Caption = 'Mã sản phẩm';
                    ToolTip = 'Specifies the value of the Mã sản phẩm field.', Comment = '%';

                }
                field(ProductName; Rec.ProductName)
                {
                    Caption = 'Tên sản phẩm';
                    ToolTip = 'Specifies the value of the Tên sản phẩm field.', Comment = '%';
                }
                field(Quantity; Rec.Quantity)
                {
                    Caption = 'Số lượng';
                    ToolTip = 'Specifies the value of the Số lượng field.', Comment = '%';
                }
                field(thanhtien; Rec.thanhtien)
                {
                    Caption = 'Thành tiền';
                    ToolTip = 'Specifies the value of the Số lượng field.', Comment = '%';
                }

            }
        }

    }

    actions
    {
        area(Processing)
        {
            action(ProcessOrderDetailsAction)
            {
                ApplicationArea = All;
                Caption = 'Xử lý dữ liệu trùng lặp';
                Image = RefreshLines;

                trigger OnAction()
                var
                    Podfhfhfu: Codeunit PageOrderXuLyData;
                begin

                    Podfhfhfu.MergeDuplicateOrderDetails();
                    CurrPage.Update();
                end;
            }
        }
    }
    trigger OnOpenPage()
    begin
        Rec.Ascending(false);
    end;

    trigger OnAfterGetCurrRecord()
    begin
        ThanhTiennnn();
    end;

    var
        thanhtien: Decimal;

    local procedure ThanhTiennnn()
    var
        Product: Record TableSanPham;
    begin
        // thanhtien := 0;
        // if Product.Get(Rec.id)
        // then
        //     thanhtien := Product.dongia * Rec.Quantity;
        // Rec.thanhtien := thanhtien;
        thanhtien := 0;
        // Tìm kiếm sản phẩm dựa trên ProductID của bản ghi hiện tại
        if Product.Get(Rec.ProductID) then begin
            // Nếu tìm thấy sản phẩm, tính thành tiền bằng cách nhân đơn giá với số lượng
            thanhtien := Product.dongia * Rec.Quantity;

            // Cập nhật trường thanhtien của bản ghi hiện tại
            Rec.thanhtien := thanhtien;
            // Lưu thay đổi vào cơ sở dữ liệu
            Rec.Modify();
        end;
    end;

}

