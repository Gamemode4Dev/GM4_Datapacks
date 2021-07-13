# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred ocelot

summon ocelot ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=ocelot,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Trusting set from entity @s Trusting
tag @e[type=ocelot,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
