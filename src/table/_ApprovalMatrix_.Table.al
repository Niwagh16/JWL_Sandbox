table 50101 "ApprovalMatrix"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1;"Approval By";Code[50])
        {
            DataClassification = CustomerContent;
            TableRelation = User."User Name";

            trigger OnValidate()var UserRec: Record User;
            begin
                UserRec.SetRange("User Name", "Approval By");
                if UserRec.FindFirst()then Name:=UserRec."Full Name";
            end;
        }
        field(2;Name;Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(3;BCM;Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(4;BCM2;Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(5;BCM3;Text[80])
        {
            DataClassification = CustomerContent;
        }
        field(6;BCM4;Text[80])
        {
            DataClassification = CustomerContent;
        }
    }
    keys
    {
        key(PK;"Approval By")
        {
            Clustered = true;
        }
    }
}
