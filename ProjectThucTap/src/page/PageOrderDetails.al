page 50125 PageOrderDetails
{
    ApplicationArea = All;
    Caption = 'PageOrderDetails';
    PageType = Card;
    SourceTable = TableOrder;

    layout
    {
        area(Content)
        {
            group(General)
            {
                Caption = 'Thông tin đơn hàng';

                field(id; Rec.id)
                {
                    ToolTip = 'Specifies the value of the Mã đơn hàng field.';

                }
                field(CustomerID; Rec.CustomerID)
                {
                    ToolTip = 'Specifies the value of the Mã khách hàng field.';
                }
                field(CustomerName; Rec.CustomerName)
                {
                    ToolTip = 'Specifies the value of the Tên khách Hàng field.';
                }
                field(OrderDate; Rec.OrderDate)
                {
                    ToolTip = 'Specifies the value of the Ngày mua field.';
                }
            }
            group("Chi tiết đơn hàng")
            {
                part(addPageOrderLine; PageOrderLine)
                {
                    ApplicationArea = All;
                    SubPageLink = OrderID = FIELD(id); // Liên kết trang phụ với trang chính
                    Editable = true;


                }


            }


        }
        area(FactBoxes)
        {

            part(TinhTongTiennn; PageTaoTongTien)
            {
                Caption = 'Tổng Tiền';
                SubPageLink = OrderID = FIELD(id);

            }
        }
    }
    // trigger OnNewRecord(BelowxRec: Boolean)
    // var
    //     OrderRec: Record TableOrder;
    // begin
    //     OrderRec.Reset();
    //     if OrderRec.FindLast() then
    //         Rec.id := OrderRec.id + 1
    //     else
    //         Rec.id := 1;
    // end;
    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    var
        Podfhfhfu: Codeunit PageOrderXuLyData;
    begin

        Podfhfhfu.MergeDuplicateOrderDetails();
        CurrPage.Update();
        exit(true);
    end;

    trigger OnModifyRecord(): Boolean
    var
        Podfhfhfu: Codeunit PageOrderXuLyData;
    begin
        Podfhfhfu.MergeDuplicateOrderDetails();
        CurrPage.Update(false);
        exit(true);
    end;
}
