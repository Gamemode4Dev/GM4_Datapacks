#run from breed_llama.json (advancement)
#@s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini as @e[distance=..10,type=llama,limit=1,sort=nearest,nbt=!{InLove:0}] at @s run summon llama ~ ~ ~ {Age:-23999}

advancement revoke @s only gm4_gemini_shamir:breed_llama
