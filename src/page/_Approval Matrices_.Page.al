page 50101 "Approval Matrices"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    SourceTable = ApprovalMatrix;
    Caption = 'Approval Matrices';

    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field("Approval By"; Rec."Approval By")
                {
                    ApplicationArea = All;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = All;
                }
                field(BCM; Rec.BCM)
                {
                    ApplicationArea = All;
                }
                field(BCM2; Rec.BCM2)
                {
                    ApplicationArea = All;
                }
                field(BCM3; Rec.BCM3)
                {
                    ApplicationArea = All;
                }
                field(BCM4; Rec.BCM4)
                {
                    ApplicationArea = All;
                }
            }
        }
        area(Factboxes)
        {
        }
    }
    actions
    {
        area(Processing)
        {
            action(ActionName)
            {
                ApplicationArea = All;

                trigger OnAction();
                begin
                end;
            }
        }
    }
}
