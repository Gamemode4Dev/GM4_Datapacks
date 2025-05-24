# @s = soul forge without fire with extra shard in storage
# run from soul_forge/destroy

# spawn bat
execute positioned ~ ~0.2 ~ summon bat run function gm4_orb_of_ankou:soul_forge/entities/set_data/congealed_shard with storage gm4_orb_of_ankou:temp equipment.chest.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas[-1]

# visuals
playsound minecraft:entity.bat.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1
