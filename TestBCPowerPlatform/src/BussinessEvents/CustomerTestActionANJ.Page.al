namespace ANJ.Tools.TestPA;
using Microsoft.Sales.Customer;

page 50114 CustomerTestAction_ANJ
{
    APIGroup = 'testpp';
    APIPublisher = 'anj';
    APIVersion = 'v2.0';
    Caption = 'tespowerautomate', Locked = true;
    DelayedInsert = true;
    EntityName = 'tespowerautomate';
    EntitySetName = 'tespowerautomates';
    ODataKeyFields = SystemId;
    PageType = API;
    SourceTable = Customer;
    layout
    {
        area(Content)
        {
            repeater(Group)
            {
                field(id; Rec.SystemId)
                {
                    Caption = 'Id', Locked = true;
                }
                field(displayname; Rec.Name)
                {
                    Caption = 'displayname', Locked = true;
                }
            }
        }
    }

    [ServiceEnabled]
    procedure updateblocket(var actionContext: WebServiceActionContext)
    begin
        if Rec.Blocked = Rec.Blocked::All then
            exit;

        Rec.Blocked := Rec.Blocked::All;
        if not Rec.Modify(false) then
            exit;

        actionContext.SetResultCode(WebServiceActionResultCode::Updated);
    end;
}