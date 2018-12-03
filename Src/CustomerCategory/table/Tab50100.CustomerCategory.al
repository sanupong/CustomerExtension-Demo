table 50100 "Customer Category"
{
    DataClassification = ToBeClassified;
    DrillDownPageId = "Customer Category List";
    Caption = 'Cusotmer Category';
    fields
    {
        field(1; No; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';
            trigger OnValidate();
            begin
            end;

        }
        field(2; Description; Text[50])
        {
            DataClassification = CustomerContent;
            CaptionML = ENU = 'Description', THA = 'รายละเอียด';
        }
        field(3; Default; Boolean)
        {
            DataClassification = CustomerContent;
            Caption = 'Default';

        }
        field(4; TotalCustomerForCategory; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count (Customer where ("Customer Category" = field (No)));
            CaptionML = ENU = 'Total customer for category', THA = 'จำนวนลูกค้าสำหรับกลุ่มนี้';
        }
        field(5; EnableNewsletter; Option)
        {
            DataClassification = ToBeClassified;
            OptionMembers = " ","Full","Limited";
            OptionCaption = ' ,Full,Limited';
            Caption = 'Enable Newsletter';
        }
        field(6; FreeGiftsAvailable; Boolean)
        {
            DataClassification = ToBeClassified;
            Caption = 'Free Gifts Available';
        }
    }

    keys
    {
        key(PK; No)
        {
            Clustered = true;
        }
    }
}