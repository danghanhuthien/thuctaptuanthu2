table 50115 TableSanPham
{
    Caption = 'Sản phẩm';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; idsp; Integer)
        {
            Caption = 'Mã sản phẩm';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; tensp; Text[50])
        {
            Caption = 'Tên sản phẩm';
        }
        field(3; dongia; Integer)
        {
            Caption = 'Đơn giá';
        }
        field(4; mota; Text[200])
        {
            Caption = 'Mô tả';
        }
        field(5; xuatxu; Text[200])
        {
            Caption = 'Xuất xứ';
        }
        field(6; hinhanh; MediaSet)
        {
            Caption = 'Hình ảnh';
            DataClassification = ToBeClassified;

        }
        field(7; hinhanhchuoi; Blob)
        {
            Caption = 'Hình ảnh';
            Subtype = Bitmap;

        }

    }
    keys
    {
        key(PK; idsp)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; idsp, tensp, dongia)
        {
        }
    }
}