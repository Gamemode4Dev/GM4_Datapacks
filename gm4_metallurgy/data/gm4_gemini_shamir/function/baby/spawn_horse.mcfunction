# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred horse

summon horse ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=horse,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Variant set from entity @s Variant
tag @e[type=horse,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
