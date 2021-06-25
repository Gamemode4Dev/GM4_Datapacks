# run from gm4_gemini_shamir:breed/check_llama
# @s = recently bred llama

summon llama ~ ~ ~ {Tags:["gm4_gemini_tamed"],Age:-23999}
data modify entity @e[type=llama,tag=gm4_gemini_tamed,distance=..2,sort=nearest,limit=1] Variant set from entity @s Variant
execute as @e[type=llama,tag=gm4_gemini_tamed,distance=..2,sort=nearest,limit=1] run function gm4_gemini_shamir:breed/tame_pet
