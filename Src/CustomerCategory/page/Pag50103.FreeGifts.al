page 50103 "Free Gift List"
{
    PageType = List;
    ApplicationArea = All;
    SourceTable = FreeGifts;
    UsageCategory = Lists;
    CaptionML = ENU = 'Free Gift Setup', THA = 'Free Gift Setup';

    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(CustomerCategoryCode; CustomerCategoryCode)
                {
                    ApplicationArea = All;

                }
                field(ItemNo; ItemNo)
                {
                    ApplicationArea = All;

                }
                field(MinimumOrderQuantity; MinimumOrderQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
                }
                field(GiftQuantity; GiftQuantity)
                {
                    ApplicationArea = All;
                    Style = Strong;
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