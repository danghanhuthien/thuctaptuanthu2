page 50128 PageKhachHangTongOrder
{
    ApplicationArea = All;
    Caption = 'Tổng đơn hàng';
    PageType = CardPart;
    SourceTable = TableOrder;

    layout
    {
        area(Content)
        {
            cuegroup(General)
            {
                Caption = 'Số đơn đặt hàng';
                field("Số đơn hàng"; TotalOrders)
                {
                    StyleExpr = 'Ambiguous'; // Thiết lập màu xanh lá cây
                    ApplicationArea = All;
                    ToolTip = 'Số đơn đặt hàng.';
                    Style = Strong;
                }
                field("Số tiền chi tiêu"; Tongtienkkh)
                {
                    StyleExpr = 'Ambiguous'; // Thiết lập màu xanh lá cây
                    ApplicationArea = All;
                    ToolTip = 'Số tiền chi tiêu.';
                    Style = Strong;
                }
            }
        }
    }
    var
        TotalOrders: Integer;
        Tongtienkkh: Decimal;
        CustomerID: Integer;

    trigger OnOpenPage()
    begin
        // Lấy CustomerID từ bản ghi hiện tại
        CustomerID := Rec.CustomerID;
    end;

    local procedure GetTotalOrders(CustomerID: Integer): Integer
    var
        OrderRec: Record "TableOrder";
    begin
        // Đặt lại bản ghi đơn hàng để đảm bảo không có bộ lọc trước đó
        OrderRec.Reset();

        // Thiết lập phạm vi bộ lọc cho CustomerID
        OrderRec.SetRange(CustomerID, CustomerID);

        // Trả về số lượng đơn hàng của khách hàng này
        exit(OrderRec.Count());
    end;

    local procedure TongTienOfKH(CustomerID: Integer): Decimal
    var
        OrderKh: Record "TableOrder";
        OrderDetails: Record "TableOrderDetails";
        TotalAmount: Decimal;
    begin
        TotalAmount := 0; // Khởi tạo tổng tiền chi tiêu bằng 0

        // Đặt lại bản ghi đơn hàng để đảm bảo không có bộ lọc trước đó
        OrderKh.Reset();

        // Thiết lập phạm vi bộ lọc cho CustomerID
        OrderKh.SetRange(CustomerID, CustomerID);

        // Tìm và duyệt qua tất cả các đơn hàng của khách hàng này
        if OrderKh.FindSet() then begin
            repeat
                // Đặt lại và thiết lập phạm vi bộ lọc cho chi tiết đơn hàng theo OrderID
                OrderDetails.Reset();
                OrderDetails.SetRange(OrderID, OrderKh.id);

                // Tìm và duyệt qua tất cả các chi tiết đơn hàng của đơn hàng hiện tại
                if OrderDetails.FindSet() then begin
                    repeat
                        // Cộng dồn tổng tiền cho từng chi tiết đơn hàng
                        TotalAmount += OrderDetails.thanhtien;
                    until OrderDetails.Next() = 0; // Lặp cho đến khi hết các chi tiết đơn hàng
                end;
            until OrderKh.Next() = 0; // Lặp cho đến khi hết các đơn hàng
        end;

        // Trả về tổng tiền chi tiêu của khách hàng này
        exit(TotalAmount);
    end;

    trigger OnAfterGetRecord()
    var
        OrderRec: Record "TableOrder";
    begin
        // Cập nhật tổng số đơn hàng của khách hàng hiện tại
        TotalOrders := GetTotalOrders(Rec.CustomerID);

        // Cập nhật tổng tiền chi tiêu của khách hàng hiện tại
        Tongtienkkh := TongTienOfKH(Rec.CustomerID);
    end;

}
