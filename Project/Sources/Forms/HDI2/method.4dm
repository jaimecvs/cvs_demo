C_LONGINT:C283($n; $i)

Case of 
		
	: (Form event code:C388=On Load:K2:1)
		
		
		ARRAY TEXT:C222(_TabTitles; 0)
		ARRAY TEXT:C222(_Descriptions; 0)
		
		READ ONLY:C145([INFO:1])
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; "<"; 9)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		
		SELECTION TO ARRAY:C260([INFO:1]TabTitle:3; _TabTitles; [INFO:1]Description:2; _Descriptions)
		
		READ ONLY:C145([INFO:1])
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; "="; 9)
		mainDescription:=[INFO:1]Description:2
		
		
		READ ONLY:C145([INFO:1])
		QUERY:C277([INFO:1]; [INFO:1]PageNumber:4; ">="; 10)
		ORDER BY:C49([INFO:1]; [INFO:1]PageNumber:4; >)
		
		SELECTION TO ARRAY:C260([INFO:1]Description:2; _Directions)
		
		If (Is Windows:C1573)
			
			ST SET ATTRIBUTES:C1093(mainDescription; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)
			
			$n:=Size of array:C274(_Descriptions)
			For ($i; 1; $n)
				ST SET ATTRIBUTES:C1093(_Descriptions{$i}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)
			End for 
			
			$n:=Size of array:C274(_Directions)
			For ($i; 1; $n)
				ST SET ATTRIBUTES:C1093(_Directions{$i}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 12; Attribute italic style:K65:2; 1)
			End for 
		End if 
		
		buildDataFromJSON
		
		initPages
		
		RW
		
	: (Form event code:C388=On Page Change:K2:54)
		
		
		initPages
		
		If (Is Windows:C1573)
			
			ST SET ATTRIBUTES:C1093(mainDescription; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)
			
			$n:=Size of array:C274(_Descriptions)
			For ($i; 1; $n)
				ST SET ATTRIBUTES:C1093(_Descriptions{$i}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 16)
			End for 
			
			$n:=Size of array:C274(_Directions)
			For ($i; 1; $n)
				ST SET ATTRIBUTES:C1093(_Directions{$i}; ST Start text:K78:15; ST End text:K78:16; Attribute text size:K65:6; 12; Attribute italic style:K65:2; 1)
			End for 
		End if 
		
End case 

