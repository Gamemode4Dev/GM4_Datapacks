# run from gm4_gemini_shamir:breed/check_cat
# @s = recently bred kitten

summon cat ~ ~ ~ {Tags:["gm4_gemini_tamed"],Age:-23999}
data modify entity @e[type=cat,tag=gm4_gemini_tamed,distance=..2,sort=nearest,limit=1] CatType set from entity @s CatType
execute as @e[type=cat,tag=gm4_gemini_tamed,distance=..2,sort=nearest,limit=1] run function gm4_gemini_shamir:breed/tame_pet
