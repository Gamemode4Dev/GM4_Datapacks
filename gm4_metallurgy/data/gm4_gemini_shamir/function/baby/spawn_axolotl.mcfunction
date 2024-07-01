# run from gm4_gemini_shamir:baby/pick_type
# @s = recently bred axolotl

summon axolotl ~ ~ ~ {Tags:["gm4_gemini_baby"],Age:-23999}
data modify entity @e[type=axolotl,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] Variant set from entity @s Variant
data modify entity @e[type=axolotl,tag=gm4_gemini_baby,distance=..2,sort=nearest,limit=1] PersistenceRequired set value 1b
tag @e[type=axolotl,tag=gm4_gemini_baby,sort=nearest,limit=1] remove gm4_gemini_baby
