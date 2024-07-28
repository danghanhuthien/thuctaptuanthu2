table 50118 TableKhachHang
{
    Caption = 'Khách hàng';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; idkh; Integer)
        {
            Caption = 'Mã khách hàng';
            AutoIncrement = true;
            Editable = false;
        }
        field(2; tenkh; Text[50])
        {
            Caption = 'Tên khách hàng';
            NotBlank = true;
            trigger OnValidate()
            begin
                if tenkh = '' then
                    Error('Tên khách hàng không được để trống.');
            end;
        }
        field(3; sdt; Text[10])
        {
            Caption = 'Số điện thoại';
            NotBlank = true;

        }
        field(4; diachi; Text[200])
        {
            Caption = 'Địa chỉ';
            NotBlank = true;

        }
        field(5; hinhanh; MediaSet)
        {
            Caption = 'Hình ảnh';
        }
        field(6; chuoihinhanh; Blob)
        {
            Caption = 'Hình ảnh';
            Subtype = Bitmap;
        }

    }
    keys
    {
        key(PK; idkh)
        {
            Clustered = true;
        }
    }
    fieldgroups
    {
        fieldgroup(DropDown; idkh, tenkh, sdt, diachi)
        {
        }
    }

    trigger OnInsert()
    begin
        TestField(tenkh);/// kiểm tra xem trường khách hàng đã có chưa, trống thì không lưu
        TestField(sdt);/// kiểm tra xem trường khách hàng đã có chưa, trống thì không lưu
    end;

    trigger OnDelete()
    begin

    end;

    trigger OnModify()
    begin
        TestField(tenkh);/// kiểm tra xem trường khách hàng đã có chưa, trống thì không lưu
        TestField(sdt);/// kiểm tra xem trường khách hàng đã có chưa, trống thì không lưu
    end;

}
