#run from breed_strider.json (advancement)
#@s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini as @e[type=strider,distance=..10,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon strider ~ ~ ~ {Age:-23999}

advancement revoke @s only gm4_gemini_shamir:breed_strider
