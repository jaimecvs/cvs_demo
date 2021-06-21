C_OBJECT:C1216($status)

If (btnTrace)
	TRACE:C157
End if 

If ((Form:C1466.contactToCreate.firstName="") | (Form:C1466.contactToCreate.lastName=""))
	ALERT:C41("Enter valid first name and last name")
	
Else 
	
	If (Form:C1466.selectedCompanyForCreate#Null:C1517)
		Form:C1466.contactToCreate.company:=Form:C1466.selectedCompanyForCreate
	End if 
	
	$status:=Form:C1466.contactToCreate.save()
	
	If ($status.success)
		OBJECT SET VISIBLE:C603(*; "createMessageOKText@"; True:C214)
		OBJECT SET VISIBLE:C603(*; "updateContactMessageOKText@"; False:C215)
		
		Form:C1466.contacts:=ds:C1482.Contact.all()
		
		//Select the created contact in the list box
		// The indexOf() method will be detailed in another How do I
		LISTBOX SELECT ROW:C912(*; "listBoxSaveWithCompany"; Form:C1466.contactToCreate.indexOf(Form:C1466.contacts)+1)
		OBJECT SET SCROLL POSITION:C906(*; "listBoxSaveWithCompany"; Form:C1466.contactToCreate.indexOf(Form:C1466.contacts)+1)
		
		
		Form:C1466.contactToSave:=New object:C1471
		LISTBOX SELECT ROW:C912(*; "listBoxCompaniesForUpdate"; 0; lk remove from selection:K53:3)
		OBJECT SET ENABLED:C1123(*; "Update@Button"; False:C215)
		
		//A new entity is created with the new() method
		Form:C1466.contactToCreate:=ds:C1482.Contact.new()
		LISTBOX SELECT ROW:C912(*; "listBoxCompaniesForCreate"; 0; lk remove from selection:K53:3)
		
		
	End if 
	
End if 