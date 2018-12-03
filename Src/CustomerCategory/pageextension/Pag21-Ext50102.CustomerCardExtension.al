pageextension 50102 "CustomerCardExtension" extends "Customer Card"
{
    layout
    {
        addlast(General)
        {
            field("Customer Category SDM"; "Customer Category")
            {
                ToolTip = 'Customer Category';
                ApplicationArea = ALL; //Always add this!
            }
        }

    }

    actions
    {
        addlast("F&unctions")
        {
            action("Assign default category")
            {
                Image = ChangeCustomer;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                Caption = 'Assign Default Category';
                ToolTip = 'Assign the default category for the selected customer';

                trigger OnAction();
                var
                    CustManagement: codeunit "Customer Management";
                begin
                    CustManagement.AssignDefaultCategory(Rec."No.");
                end;
            }
        }
    }


}