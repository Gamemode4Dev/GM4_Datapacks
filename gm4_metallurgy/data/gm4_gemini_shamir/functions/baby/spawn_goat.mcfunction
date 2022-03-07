# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred goat

summon goat ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=goat,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] IsScreamingGoat set from entity @s IsScreamingGoat
data modify entity @e[type=goat,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] PersistenceRequired set value 1b
tag @e[type=goat,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
