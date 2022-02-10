# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred donkey

summon donkey ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=donkey,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Owner set from entity @s Owner
tag @e[type=donkey,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
