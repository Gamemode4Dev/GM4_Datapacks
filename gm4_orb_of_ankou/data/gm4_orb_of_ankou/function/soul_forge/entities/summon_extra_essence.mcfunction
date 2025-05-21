# @s = soul forge without fire with extra essence in storage
# run from soul_forge/destroy

# summon endermite
execute positioned ~ ~0.2 ~ summon endermite run function gm4_orb_of_ankou:soul_forge/entities/set_data/severed_soul with storage gm4_orb_of_ankou:temp equipment.legs.components."minecraft:custom_data".gm4_orb_of_ankou.stored_pneuma

# visuals
playsound minecraft:entity.endermite.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1

# loop
scoreboard players remove @s gm4_oa_essence 1
execute if score @s gm4_oa_essence matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_extra_essence
