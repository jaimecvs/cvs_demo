//%attributes = {}
C_TEXT:C284($txtContacts; $txtCompanies)
C_COLLECTION:C1488($contactsColl; $companiesColl)


If (ds:C1482.Contact.all().length=0)
	
	$txtContacts:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"contacts_data.json")
	$txtCompanies:=Document to text:C1236(Get 4D folder:C485(Current resources folder:K5:16)+"companies_data.json")
	
	$contactsColl:=JSON Parse:C1218($txtContacts)
	$companiesColl:=JSON Parse:C1218($txtCompanies)
	
	ds:C1482.Company.all().drop()
	ds:C1482.Contact.all().drop()
	
	ds:C1482.Company.fromCollection($companiesColl)
	ds:C1482.Contact.fromCollection($contactsColl)
	
End if 