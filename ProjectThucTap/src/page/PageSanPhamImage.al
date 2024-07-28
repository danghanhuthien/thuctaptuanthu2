page 50120 PageSanPhamImage
{
    ApplicationArea = All;
    PageType = CardPart;
    SourceTable = TableSanPham;

    layout
    {
        area(Content)
        {
            field(hinhanh; Rec.hinhanh)
            {
                ToolTip = 'Specifies the image for the product.';
                ShowCaption = false; // Ẩn Caption để chỉ tập trung vào hình ảnh
                trigger OnAssistEdit()
                var
                    InStream: InStream;
                    FileName: Text;
                begin
                    if UploadIntoStream('Chọn ảnh từ folder của bạn', '', 'All files (*.*)|*.*', FileName, InStream) then begin
                        Rec.hinhanh.ImportStream(InStream, FileName);
                        Rec.Modify();
                        CurrPage.Update();
                    end;
                end;
            }
        }


    }
    actions
    {
        area(processing)
        {
            action(UploadImage)
            {
                Caption = 'Tải ảnh lên';
                Image = Import;
                trigger OnAction()
                var
                    InStream: InStream;
                    FileName: Text;
                    mediaId: Guid;
                    OutStream: OutStream;
                begin
                    if UploadIntoStream('Chọn ảnh từ folder của bạn', '', 'All files (*.*)|*.*', FileName, InStream) then begin
                        if Rec.hinhanh.Count > 0 then begin
                            mediaId := Rec.hinhanh.Item(1);
                            if Rec.hinhanh.Remove(mediaId) then
                                Rec.Modify();
                        end;
                        Rec.hinhanh.ImportStream(InStream, FileName);


                        Rec.hinhanhchuoi.CreateOutStream(OutStream);
                        CopyStream(OutStream, InStream);
                        Rec.Modify();
                        CurrPage.Update();
                    end;
                end;
            }
            action(deleteimg)
            {
                Caption = 'Xóa ảnh';
                Image = Delete;
                trigger OnAction()
                var
                    mediaid: guid;
                    OutStr: OutStream;
                begin
                    if Rec.hinhanh.Count > 0 then begin
                        mediaid := Rec.hinhanh.Item(1);
                        if rec.hinhanh.Remove(mediaid) then
                            rec.Modify();
                    end;
                    Rec.hinhanhchuoi.CreateOutStream(OutStr);
                    OutStr.WriteText('');
                    Rec.Modify();
                    CurrPage.Update();
                end;
            }
        }
    }

    trigger OnAfterGetRecord();
    begin
        CurrPage.Update();
    end;
}
