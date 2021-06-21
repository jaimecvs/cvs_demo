
If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		OBJECT SET VISIBLE:C603(*; "updateContactMessageOKText"; False:C215)
		OBJECT SET VISIBLE:C603(*; "createMessageOKText"; False:C215)
		
		OBJECT SET ENABLED:C1123(*; "UpdateButton"; False:C215)
		
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		OBJECT SET ENABLED:C1123(*; "UpdateButton"; True:C214)
		Form:C1466.contactToSave:=Form:C1466.selectedContact
End case 