

If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		OBJECT SET VISIBLE:C603(*; "dropContactMessageOKText"; False:C215)
		OBJECT SET ENABLED:C1123(*; "DropContactsButton"; False:C215)
		
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		If (Form:C1466.contactsListToDelete.length>=1)
			OBJECT SET ENABLED:C1123(*; "DropContactsButton"; True:C214)
		End if 
		
		
End case 