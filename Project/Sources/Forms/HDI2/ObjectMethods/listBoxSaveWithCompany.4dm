
If (btnTrace)
	TRACE:C157
End if 

Case of 
		
	: (Form event code:C388=On Clicked:K2:4)
		
		OBJECT SET VISIBLE:C603(*; "updateContactMessageOKText@"; False:C215)
		OBJECT SET VISIBLE:C603(*; "createMessageOKText@"; False:C215)
		
		OBJECT SET ENABLED:C1123(*; "Update@Button"; False:C215)
		
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		OBJECT SET ENABLED:C1123(*; "Update@Button"; True:C214)
		
		Form:C1466.contactToSave:=Form:C1466.selectedContact
		
		If (Form:C1466.contactToSave.company#Null:C1517)
			//Select the company in the list box
			// The indexOf() method will be detailed in another How do I
			LISTBOX SELECT ROW:C912(*; "listBoxCompaniesForUpdate"; Form:C1466.contactToSave.company.indexOf(Form:C1466.companiesForUpdate)+1)
			OBJECT SET SCROLL POSITION:C906(*; "listBoxCompaniesForUpdate"; Form:C1466.contactToSave.company.indexOf(Form:C1466.companiesForUpdate)+1)
		Else 
			LISTBOX SELECT ROW:C912(*; "listBoxCompaniesForUpdate"; 0; lk remove from selection:K53:3)
		End if 
		
End case 