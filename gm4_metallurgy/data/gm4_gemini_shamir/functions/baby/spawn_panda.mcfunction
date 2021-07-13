# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred panda

summon panda ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=panda,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] MainGene set from entity @s MainGene
data modify entity @e[type=panda,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] HiddenGene set from entity @s HiddenGene
tag @e[type=panda,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
