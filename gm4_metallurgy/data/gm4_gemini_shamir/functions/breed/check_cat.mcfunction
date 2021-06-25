#run from breed_cat.json (advancement)
#@s = player who has bred a mob

data modify storage gm4_gemini_shamir:temp/uuid UUID set from entity @s UUID
execute if predicate gm4_gemini_shamir:holding_gemini as @e[type=cat,distance=..10,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon cat ~ ~ ~ {Tags:["gm4_gemini_tamed"],Age:-23999}
execute as @e[type=cat,tag=gm4_gemini_tamed,distance=..10,sort=nearest,limit=1] run function gm4_gemini_shamir:breed/tame_pet

advancement revoke @s only gm4_gemini_shamir:breed_cat
