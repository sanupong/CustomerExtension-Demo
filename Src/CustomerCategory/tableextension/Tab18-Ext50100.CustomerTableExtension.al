tableextension 50100 "CustomerTableExtensions" extends Customer
{
    fields
    {
        field(50100; "Customer Category"; Code[20])
        {
            TableRelation = "Customer Category".No;
            Caption = 'Customer Category Code';
            DataClassification = CustomerContent;
        }
    }


}