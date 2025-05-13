# @s = orb of ankou item in a soul forge that already has an orb
# run from both soul_forge/recipes/check_orb and soul_forge/recipes/add_orb

# spawn silverfish
summon silverfish ~ ~0.2 ~ {CustomName:{"translate":"entity.gm4.living_orb","fallback":"Living Orb§"},CustomNameVisible:0b,Team:"gm4_hide_name",Health:2.0f,DeathLootTable:"gm4:empty",PersistenceRequired:1b,Tags:["gm4_oa_unset","gm4_oa_living_orb","gm4_oa_ignore"],drop_chances:{mainhand:2.0f,offhand:1.0f},Motion:[0.0,0.6,0.0],active_effects:[{id:"minecraft:fire_resistance",amplifier:0b,duration:1000000,show_particles:0b}]}

# set loot drop to orb of ankou
data modify entity @e[type=silverfish,tag=gm4_oa_unset,limit=1] equipment.mainhand set from storage gm4_orb_of_ankou:temp Item

# randomize motion in x and z
execute as @e[type=silverfish,tag=gm4_oa_unset,limit=1] run function gm4_orb_of_ankou:soul_forge/entities/set_data/randomize_motion

# visuals
playsound minecraft:entity.silverfish.hurt hostile @a[distance=..12] ~ ~ ~ 0.7 1

# loop
scoreboard players remove orb_count gm4_oa_forge 1
execute if score orb_count gm4_oa_forge matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_living_orb
