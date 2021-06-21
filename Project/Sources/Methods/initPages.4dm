//%attributes = {}
C_BOOLEAN:C305(btnTrace)

//Business logic related to the DataStore

Form:C1466.contacts:=ds:C1482.Contact.all()
Form:C1466.companiesForUpdate:=ds:C1482.Company.all()
Form:C1466.companiesForCreate:=ds:C1482.Company.all()

//Create Update
OBJECT SET VISIBLE:C603(*; "createMessageOKText@"; False:C215)
OBJECT SET VISIBLE:C603(*; "updateContactMessageOKText@"; False:C215)
OBJECT SET ENABLED:C1123(*; "Update@Button"; False:C215)

Form:C1466.contactToSave:=New object:C1471

//The new method is used to create a new entity
Form:C1466.contactToCreate:=ds:C1482.Contact.new()

//Drop contacts
OBJECT SET VISIBLE:C603(*; "dropContactMessageOKText"; False:C215)
OBJECT SET ENABLED:C1123(*; "DropContactsButton"; False:C215)

btnTrace:=False:C215
