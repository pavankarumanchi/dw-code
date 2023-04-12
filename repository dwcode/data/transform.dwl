%dw 2.0
output application/json
import * from dw::util::Values
---
//((payload mask "SSN" with "") mask "dob" with "") - payload map ($) - 'id'

payload map {
    test: $ mapObject ((value, key, index) -> 
    if(((key as String)== "SSN") or((key as String) == "dob"))
    ((key): "") 
     else if(key as String ~= "address")
     ("zipcode":(value splitBy "")[-1] )
     else ((key):value)
    ) filterObject ((value, key, index) -> ((key as String) != "id" ))
}.test