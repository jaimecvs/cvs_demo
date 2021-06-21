C_OBJECT:C1216($status)

If (btnTrace)
	TRACE:C157
End if 

$status:=Form:C1466.contactToSave.save()

If ($status.success)
	OBJECT SET VISIBLE:C603(*; "updateContactMessageOKText"; True:C214)
	OBJECT SET VISIBLE:C603(*; "createMessageOKText"; False:C215)
	
	Form:C1466.contacts:=ds:C1482.Contact.all()
	
	//Select the updated contact in the list box
	// The indexOf() method will be detailed in another How do I
	LISTBOX SELECT ROW:C912(*; "listBoxSave"; Form:C1466.contactToSave.indexOf()+1)
	OBJECT SET SCROLL POSITION:C906(*; "listBoxSave"; Form:C1466.contactToSave.indexOf()+1)
End if 
