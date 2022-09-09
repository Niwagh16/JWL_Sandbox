report 50100 "Pending Invoices"
{
    Caption = 'Pending Invoices';
    DefaultLayout = RDLC;
    RDLCLayout = './src/reportlayout/PendingInvoices.rdl';
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;

    dataset
    {
        dataitem("Purchase Header"; "Purchase Header")
        {
            DataItemTableView = SORTING("Document Type", "No.") WHERE("Document Type" = CONST(Invoice), Status = const("Pending Approval"));


            column(No_; "No.")
            {
            }
            column(Posting_Date; Format("Posting Date"))
            {
            }
            column(Buy_from_Vendor_No_; "Buy-from Vendor No.")
            {
            }
            column(Buy_from_Vendor_Name; "Buy-from Vendor Name")
            {
            }
            column(Vendor_Invoice_No_; "Vendor Invoice No.")
            {
            }
            column(Status; Status)
            {
            }
            column(On_Hold; "On Hold")
            {
            }
            column(Reason_Code; "Reason Code")
            {
            }
            column(Amount; Amount)
            {
            }
            column(Amount_Including_VAT; "Amount Including VAT")
            {
            }
            column(ApproverName; Approvalname11)
            {
            }
            column(BCM; ApprMatrixRec.BCM)
            {
            }
            column(BCM2; ApprMatrixRec.BCM2)
            {
            }
            column(BCM3; ApprMatrixRec.BCM3)
            {
            }
            column(BCM4; ApprMatrixRec.BCM4)
            {
            }
            trigger OnPreDataItem()
            begin

            end;

            trigger OnAfterGetRecord()
            begin
                /*
                ApprovalEntry.SetRange("Document No.", "Purchase Header"."No.");
                if ApprovalEntry.FindFirst() then
                if ApprMatrixRec.Get(ApprovalEntry."Approver ID") then;
                */
                clear(Approvalname11);
                ApprovalEntry.Reset();
                ApprovalEntry.SetRange("Document No.", "Purchase Header"."No.");
                ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Approved);
                if ApprovalEntry.FindFirst() then
                    Approvalname11 := ApprovalEntry."Approver ID";
                if Approvalname11 = '' then begin
                    ApprovalEntry.Reset();
                    ApprovalEntry.SetRange("Document No.", "Purchase Header"."No.");
                    ApprovalEntry.SetRange(Status, ApprovalEntry.Status::Open);
                    if ApprovalEntry.FindFirst() then
                        Approvalname11 := ApprovalEntry."Approver ID";
                end;

                if ApprMatrixRec.Get(ApprovalEntry."Approver ID") then;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
    }
    var
        ApprovalEntry: Record "Approval Entry";
        ApprovalID: Code[50];
        ApprMatrixRec: Record ApprovalMatrix;
        Approvalname11: Text[100];
}
