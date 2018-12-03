codeunit 50100 "Customer Management"
{
    trigger OnRun()
    begin

    end;

    procedure AssignDefaultCategory(CustomerCode: Code[20])
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category";
    begin
        //Set default category for a Customer
        Customer.Get(CustomerCode);
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            Customer."Customer Category" := CustomerCategory.No;
            Customer.Modify();
        end;
    end;

    procedure AssignDefaultCategory()
    var
        Customer: Record Customer;
        CustomerCategory: Record "Customer Category";
    begin
        //Set default category for ALL Customer
        CustomerCategory.SetRange(Default, true);
        if CustomerCategory.FindFirst() then begin
            if Customer.FindSet() then
                repeat
                    Customer."Customer Category" := CustomerCategory.No;
                    Customer.Modify();
                until Customer.Next() = 0;
        end;
    end;

    procedure CreateDefaultCategory()
    var
        CustomerCategory: Record "Customer Category";
    begin
        CustomerCategory.No := 'DEFAULT';
        CustomerCategory.Description := 'Default Customer Category';
        CustomerCategory.Default := true;
        if CustomerCategory.Insert then;
    end;
    //Returns the number of Customers without an assigned Customer Category
    procedure GetTotalCustomersWithoutCategory(): Integer
    var
        Customer: record Customer;
    begin
        Customer.SetRange("Customer Category", '');
        exit(customer.Count());
    end;


}