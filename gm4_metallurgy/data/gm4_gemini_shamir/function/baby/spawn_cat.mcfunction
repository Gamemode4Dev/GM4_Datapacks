# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred cat

summon cat ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=cat,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] CatType set from entity @s CatType
data modify entity @e[type=cat,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Owner set from entity @s Owner
data modify entity @e[type=cat,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] PersistenceRequired set value 1b
tag @e[type=cat,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
