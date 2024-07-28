page 50127 PageTaoTongTien
{
    ApplicationArea = All;
    Caption = 'PageTaoTongTien';
    PageType = CardPart;
    SourceTable = TableOrderDetails;

    layout
    {
        area(Content)
        {
            cuegroup(TongTien)
            {
                Caption = 'Tổng tiền';
                ShowCaption = false;
                field("Tổng tiền"; Rec.TongTien)
                {
                    ApplicationArea = all;
                }
            }

        }
    }
    trigger OnAfterGetRecord()
    begin
        Rec.CalcFields(TongTien); // Tính toán lại FlowField
        CurrPage.Update(false);
    end;


}
