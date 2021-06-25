#run from breed_sheep.json (advancement)
#@s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini as @e[type=sheep,distance=..10,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon sheep ~ ~ ~ {Age:-23999}

advancement revoke @s only gm4_gemini_shamir:breed_sheep
