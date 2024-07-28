table 50117 TableOrder
{
    Caption = 'Hóa đơn';
    DataClassification = ToBeClassified;
    TableType = Normal;

    fields
    {
        field(1; id; Integer)
        {
            Caption = 'Mã đơn hàng';
            AutoIncrement = true;
        }
        field(2; OrderDate; Date)
        {
            Caption = 'Ngày mua';
        }
        field(3; CustomerID; Integer)
        {
            Caption = 'Mã khách hàng';
            TableRelation = TableKhachHang.idkh;
        }
        field(7; CustomerName; Text[100])
        {
            Caption = 'Tên khách Hàng';
            FieldClass = FlowField;
            CalcFormula = lookup(TableKhachHang.tenkh where(idkh = field(CustomerID)));
            Editable = false;
        }
    }
    keys
    {
        key(PK; id)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; id, OrderDate, CustomerName)
        {
        }
    }
}
