# determine type
# run from gm4_gemini_shamir:baby/find_baby

execute if entity @s[tag=gm4_gemini_axolotl] as @e[type=axolotl,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_axolotl
execute if entity @s[tag=gm4_gemini_cat] as @e[type=cat,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_cat
execute if entity @s[tag=gm4_gemini_donkey] as @e[type=donkey,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_donkey
execute if entity @s[tag=gm4_gemini_fox] as @e[type=fox,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_fox
execute if entity @s[tag=gm4_gemini_goat] as @e[type=goat,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_goat
execute if entity @s[tag=gm4_gemini_horse] as @e[type=horse,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_horse
execute if entity @s[tag=gm4_gemini_llama] as @e[type=llama,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_llama
execute if entity @s[tag=gm4_gemini_mule] as @e[type=mule,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_mule
execute if entity @s[tag=gm4_gemini_ocelot] as @e[type=ocelot,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_ocelot
execute if entity @s[tag=gm4_gemini_panda] as @e[type=panda,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_panda
execute if entity @s[tag=gm4_gemini_rabbit] as @e[type=rabbit,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_rabbit
execute if entity @s[tag=gm4_gemini_sheep] as @e[type=sheep,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_sheep
execute if entity @s[tag=gm4_gemini_trader_llama] as @e[type=trader_llama,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_trader_llama
execute if entity @s[tag=gm4_gemini_wolf] as @e[type=wolf,distance=..10,nbt={Age:-24000},limit=1,sort=nearest] at @s run function gm4_gemini_shamir:baby/spawn_wolf

kill @s
