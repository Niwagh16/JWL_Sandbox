codeunit 50102 "Mail Pending Invoices"
{
    trigger OnRun()begin
        Clear(TempB);
        Clear(MailTo);
        ctr:=0;
        RepNo:=50100;
        AlertTo.Reset();
        AlertTo.SetFilter(AlertTo."Report ID", '%1', RepNo);
        If AlertTo.FindSet then repeat ctr:=ctr + 1;
                If ctr = 1 then MailTo:=AlertTo."E-Mail"
                else
                    MailTo:=MailTo + ';' + AlertTo."E-Mail";
            until AlertTo.Next = 0;
        //MailTo := 'chulse@jwlogistics.com' + ';' + 'hemant.khetade@cyret.com';
        AttachmentName:=STRSUBSTNO('Pending Invoices_%1.xlsx', FORMAT(Today));
        TempB.CreateOutStream(Ostream);
        If Report.SaveAs(Report::"Pending Invoices", '', ReportFormat::Excel, Ostream)then begin
            TempB.CreateInStream(Istream);
            mail.EmailFileFromStream(Istream, AttachmentName, 'Pending Invoices Report', 'Pending Invoices Report', MailTo, true, 4);
        end;
    end;
    var RepNo: Integer;
    RepNo1: Integer;
    AttachmentName: Text[100];
    AttachmentName1: Text[100];
    OStream: OutStream;
    IStream: InStream;
    OStream1: OutStream;
    IStream1: InStream;
    mail: Codeunit "Document-Mailing";
    mail1: Codeunit "Document-Mailing";
    ctr: Integer;
    tmedia: Record "Tenant Media";
    emailitem: Record "Email Item" temporary;
    TempB: Codeunit "Temp Blob";
    TempB1: Codeunit "Temp Blob";
    smtpmail: Codeunit "Email Message";
    MailTo: Text;
    usersetup: Record "User Setup";
    AlertTo: Record "Alert To";
}
