codeunit 50101 "FreeGiftManagement"
{
    [EventSubscriber(ObjectType::Table, 37, 'OnAfterValidateEvent',
    'Quantity', false, false)]
    local procedure AddFreeGift(var Rec: Record "Sales Line")
    var
        FreeGift: Record FreeGifts;
        SalesLine: Record "Sales Line";
        Customer: Record Customer;
    begin
        if (Rec.Type = Rec.Type::Item) and (Customer.Get(Rec."Sell-to Customer No.")) then begin
            if FreeGift.Get(Customer."Customer Category", Rec."No.") and
            (rec.Quantity > FreeGift.MinimumOrderQuantity) then begin
                OnBeforeFreeGiftSalesLineAdded(Rec);
                //Creates a new Sales Line with the free gift
                SalesLine.init;
                SalesLine.TransferFields(Rec);
                SalesLine."Line No." := Rec."Line No." + 10000;
                SalesLine.Validate(Quantity, FreeGift.GiftQuantity);
                SalesLine.Validate("Line Discount %", 100);
                if SalesLine.Insert() then;
                OnAfterFreeGiftSalesLineAdded(Rec, SalesLine);
            end;
        end;
    end;

    [IntegrationEvent(true, true)]
    local procedure OnBeforeFreeGiftSalesLineAdded(var Rec: Record "Sales Line")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterFreeGiftSalesLineAdded(var Rec: Record "Sales Line"; var SalesLineGift: Record "Sales Line")
    begin
    end;

    [EventSubscriber(ObjectType::Table, 32, 'OnAfterInsertEvent', '',
    false, false)]
    local procedure OnAfterItemLedgerEntryInsert(var Rec: Record "Item Ledger Entry")
    var
        Customer: Record Customer;
    begin
        if rec."Entry Type" = rec."Entry Type"::Sale then begin
            if Customer.Get(Rec."Source No.") then begin
                rec."Customer Category" := Customer."Customer Category";
                rec.Modify();
            end;
        end;
    end;
}