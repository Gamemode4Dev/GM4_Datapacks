#run from breed_mooshroom.json (advancement)
#@s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini as @e[distance=..10,type=mooshroom,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon mooshroom ~ ~ ~ {Age:-23999}

advancement revoke @s only gm4_gemini_shamir:breed_mooshroom
