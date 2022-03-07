# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred fox

summon fox ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=fox,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Trusted set from entity @s Trusted
data modify entity @e[type=fox,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Type set from entity @s Type
data modify entity @e[type=fox,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] PersistenceRequired set value 1b
tag @e[type=fox,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
