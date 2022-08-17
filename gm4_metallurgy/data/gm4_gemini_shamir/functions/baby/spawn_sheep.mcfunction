# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred sheep

summon sheep ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=sheep,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Color set from entity @s Color
tag @e[type=sheep,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
