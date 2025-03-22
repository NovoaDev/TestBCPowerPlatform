namespace ANJ.Tools.TestPA;
using Microsoft.Sales.Customer;
using System.Integration;

pageextension 50100 "CustomerCard_ANJ" extends "Customer Card"
{
    actions
    {
        addfirst(processing)
        {
            action(LaunchFlowAction_ANJ)
            {
                ApplicationArea = All;
                Caption = 'Launch Flow';
                Image = AboutNav;
                ToolTip = 'Executes the Launch Flow action.';

                trigger OnAction()
                begin
                    LaunchFlow_ANJ(Rec.SystemId);
                end;
            }
        }
    }

    [ExternalBusinessEvent('TestAnto', 'Test Antonio', 'Test Business event Antonio', EventCategory::TESTPA_ANJ)]
    local procedure LaunchFlow_ANJ(RecordGuid: Guid)
    begin
    end;
}