pageextension 50130 PageGetChuoiHinhAnh extends PageKhachHangDetails
{
    // layout
    // {
    //     addlast(General)
    //     {
    //         field(LargeText; LargeText)
    //         {
    //             Caption = 'Chuỗi mã hóa';
    //             ApplicationArea = All;
    //             MultiLine = true;
    //             trigger OnValidate()
    //             begin
    //                 SetLargeText(LargeText);
    //             end;
    //         }
    //     }
    // }
    // var
    //     LargeText: Text;
    //     anhcgdhdi: Text[999999999];

    // trigger OnAfterGetRecord()
    // begin
    //     LargeText := GetLargeText();
    // end;

    // trigger OnModifyRecord(): Boolean
    // begin
    //     LargeText := GetLargeText();
    //     exit(true);
    // end;

    // procedure SetLargeText(NewLargeText: Text)
    // var
    //     OutStream: OutStream;
    // begin
    //     Clear(Rec.chuoihinhanh);
    //     Rec."chuoihinhanh".CreateOutStream(OutStream, TEXTENCODING::UTF8);
    //     anhcgdhdi := 'data:application/octet-stream;base64,' + LargeText;
    //     OutStream.WriteText(anhcgdhdi);
    //     Rec.Modify();
    // end;

    // procedure GetLargeText() NewLargeText: Text
    // var
    //     TypeHelper: Codeunit "Type Helper";
    //     InStream: InStream;
    // begin
    //     Rec.CalcFields("chuoihinhanh");
    //     Rec."chuoihinhanh".CreateInStream(InStream, TEXTENCODING::UTF8);
    //     exit(TypeHelper.TryReadAsTextWithSepAndFieldErrMsg(InStream, TypeHelper.LFSeparator(), Rec.FieldName("chuoihinhanh")));
    // end;
}
