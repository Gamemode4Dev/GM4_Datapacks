# @s = orb of ankou item in a soul forge that already has an orb
# run from both soul_forge/recipes/check_orb and soul_forge/recipes/add_orb

# spawn silverfish
data modify storage gm4_orb_of_ankou:temp current_orb set from storage gm4_orb_of_ankou:temp Item
execute positioned ~ ~0.2 ~ summon silverfish run function gm4_orb_of_ankou:soul_forge/entities/set_data/living_orb

# visuals
playsound minecraft:entity.silverfish.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1

# loop
scoreboard players remove orb_count gm4_oa_forge 1
execute if score orb_count gm4_oa_forge matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_living_orb
