# run from gm4_gemini_shamir:breed/check_axolotl
# @s = recently bred axolotl

summon axolotl ~ ~ ~ {Tags:["gm4_gemini_tamed"],Age:-23999}
data modify entity @e[type=axolotl,tag=gm4_gemini_tamed,distance=..2,sort=nearest,limit=1] Variant set from entity @s Variant
tag @e[type=axolotl,tag=gm4_gemini_tamed,distance=..2,sort=nearest,limit=1] remove gm4_gemini_tamed
