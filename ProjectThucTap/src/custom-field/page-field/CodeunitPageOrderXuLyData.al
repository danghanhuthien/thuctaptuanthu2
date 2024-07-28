codeunit 50110 "PageOrderXuLyData"
{
    Subtype = Normal;
    SingleInstance = true;

    procedure MergeDuplicateOrderDetails()
    var
        OrderDetailRec: Record "TableOrderDetails";
        TempOrderDetailRec: Record "TableOrderDetails" temporary;
        MergedOrderDetailRec: Record "TableOrderDetails";
    begin
        // Xóa bảng tạm thời
        TempOrderDetailRec.DeleteAll();
        // Ghi chú: Điều này đảm bảo chúng ta bắt đầu với một bảng tạm thời trống

        // Lặp qua tất cả các bản ghi trong OrderDetailRec
        if OrderDetailRec.FindSet() then begin
            repeat
                // Ghi chú: Vòng lặp này sẽ xử lý từng bản ghi trong bảng gốc

                // Kiểm tra xem sự kết hợp của OrderID và ProductID đã tồn tại trong bảng tạm thời chưa
                TempOrderDetailRec.SetRange("OrderID", OrderDetailRec."OrderID");
                TempOrderDetailRec.SetRange("ProductID", OrderDetailRec."ProductID");
                // Ghi chú: Các lệnh SetRange này lọc bảng tạm thời để tìm các bản ghi phù hợp

                if TempOrderDetailRec.FindFirst() then begin
                    // Ghi chú: Nếu tìm thấy bản ghi phù hợp, chúng ta cập nhật số lượng của nó
                    TempOrderDetailRec.Quantity += OrderDetailRec.Quantity;
                    TempOrderDetailRec.Modify();
                end else begin
                    // Ghi chú: Nếu không tìm thấy bản ghi phù hợp, chúng ta tạo một bản ghi mới
                    TempOrderDetailRec.Init();
                    TempOrderDetailRec.TransferFields(OrderDetailRec);
                    TempOrderDetailRec.Insert();
                end;

                // Xóa các bộ lọc cho lần lặp tiếp theo
                TempOrderDetailRec.SetRange("OrderID");
                TempOrderDetailRec.SetRange("ProductID");
            // Ghi chú: Điều này đảm bảo chúng ta bắt đầu mới cho bản ghi tiếp theo

            until OrderDetailRec.Next() = 0;
            // Ghi chú: Tiếp tục vòng lặp cho đến khi không còn bản ghi nào nữa
        end;

        // Xóa tất cả các bản ghi gốc trong OrderDetailRec
        OrderDetailRec.DeleteAll(true);
        // Ghi chú: Điều này loại bỏ tất cả các bản ghi gốc, chuẩn bị cho dữ liệu đã được hợp nhất

        // Chèn các bản ghi đã hợp nhất trở lại bảng gốc
        if TempOrderDetailRec.FindSet() then begin
            repeat
                // Ghi chú: Vòng lặp này xử lý từng bản ghi trong bảng tạm thời
                MergedOrderDetailRec.Init();
                MergedOrderDetailRec.TransferFields(TempOrderDetailRec);
                MergedOrderDetailRec.Insert();
            // Ghi chú: Mỗi bản ghi đã hợp nhất được chèn vào bảng gốc
            until TempOrderDetailRec.Next() = 0;
            // Ghi chú: Tiếp tục cho đến khi tất cả các bản ghi tạm thời được xử lý
        end;
    end;
}