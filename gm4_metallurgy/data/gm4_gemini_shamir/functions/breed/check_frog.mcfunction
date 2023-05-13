# run from breed_frog.json (advancement)
# @s = player who has bred a mob

execute if predicate gm4_gemini_shamir:holding_gemini run data modify entity @e[type=frog,distance=..10,limit=1,sort=nearest,nbt=!{Brain:{memories:{"minecraft:is_pregnant":{value:{}}}}}] Brain.memories.is_pregnant.value set value {}

advancement revoke @s only gm4_gemini_shamir:breed_frog
