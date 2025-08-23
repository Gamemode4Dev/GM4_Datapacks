# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred wolf

summon wolf ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=wolf,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Owner set from entity @s Owner
data modify entity @e[type=wolf,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] variant set from entity @s variant
tag @e[type=wolf,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
