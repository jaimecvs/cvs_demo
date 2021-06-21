C_OBJECT:C1216($status)
C_OBJECT:C1216($notDropped)

If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: (Form:C1466.contactsListToDelete.length=1)  // Only one contact is selected. It is provided in entity Form.contactToDelete
		
		$status:=Form:C1466.contactToDelete.drop()
		
		If ($status.success)
			OBJECT SET VISIBLE:C603(*; "dropContactMessageOKText"; True:C214)
			Form:C1466.contacts:=ds:C1482.Contact.all()
			ALERT:C41("You have dropped the "+Form:C1466.contactToDelete.firstName+" "+Form:C1466.contactToDelete.lastName+" contact")
		End if 
		
	: (Form:C1466.contactsListToDelete.length>=2)  // Several contacts are selected to be dropped. They are provided in entity selection Form.contactsListToDelete
		
		$notDropped:=Form:C1466.contactsListToDelete.drop()  //$notDropped is an entity selection containing the not dropped entities
		
		If ($notDropped.length=0)  // The drop action is successfull
			OBJECT SET VISIBLE:C603(*; "dropContactMessageOKText"; True:C214)
			Form:C1466.contacts:=ds:C1482.Contact.all()
			ALERT:C41("You have dropped "+String:C10(Form:C1466.contactsListToDelete.length)+" contacts")
		End if 
		
End case 



