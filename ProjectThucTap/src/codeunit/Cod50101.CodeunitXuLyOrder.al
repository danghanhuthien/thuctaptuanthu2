codeunit 50101 CodeunitXuLyOrder
{
    Subtype = Normal;
    SingleInstance = true;

    var
        thanhtiennn: Decimal;

    procedure ThanhTien()
    var
        OrderLine: Record TableOrderDetails;
        Product: Record TableSanPham;
    begin
        thanhtiennn := 0;
        if Product.Get(OrderLine.ProductID)
        then
            thanhtiennn := Product.dongia * OrderLine.Quantity;
        OrderLine.thanhtien := thanhtiennn;
    end;
}
