page 50100 "Customer Category List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = "Customer Category";
    UsageCategory = Lists;
    Caption = 'Customer Category List';
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(No; No)
                {
                    ApplicationArea = All;

                }
                field(Description; Description)
                {
                    ApplicationArea = All;

                }
                field(Default; Default)
                {
                    ApplicationArea = All;
                }
                field(TotalCustomerForCategory; TotalCustomerForCategory)
                {
                    ApplicationArea = All;
                    ToolTip = 'Total Customers for Category';
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
            action("Create Default Category")
            {
                Image = Category;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                ApplicationArea = All;
                ToolTip = 'Create a default Customer Category';
                Caption = 'Create default category';

                trigger OnAction();
                var
                    CustManagement: Codeunit "Customer Management";
                begin
                    //!Integration event raised
                    OnBeforeCreateDefaultCategoryAction(Rec);
                    CustManagement.CreatedefaultCategory();
                    //!Integration event raised
                    OnAfterCreateDefaultCategoryAction(Rec);
                end;
            }
        }
    }
    [IntegrationEvent(true, true)]
    local procedure OnBeforeCreateDefaultCategoryAction(var CustomerCategory: Record "Customer Category")
    begin
    end;

    [IntegrationEvent(true, true)]
    local procedure OnAfterCreateDefaultCategoryAction(var CustomerCategory: Record "Customer Category");
    begin
    end;
}