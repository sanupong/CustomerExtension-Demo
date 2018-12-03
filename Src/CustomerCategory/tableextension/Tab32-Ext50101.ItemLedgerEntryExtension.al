tableextension 50101 ItemLedgerEntryExtension extends "Item Ledger Entry"
{
    fields
    {
        field(50100; "Customer Category"; code[20])
        {
            TableRelation = "Customer Category".No;
            Caption = 'Customer Category';
        }
    }


}