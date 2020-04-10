#@s = tank with entity above it positioned ~ ~1 ~
#run from liquid_tanks:process via #gm4_liquid_tanks:util_above

tag @s add gm4_processing_tank

#cow
execute as @e[dx=0,type=cow] run function gm4_standard_liquids:util/cow

#mooshroom
execute as @e[dx=0,type=mooshroom] run function gm4_standard_liquids:util/mooshroom

#experience orb
execute positioned ~0.5 ~ ~0.5 if entity @e[distance=..0.5,type=experience_orb] if score @s[tag=gm4_lt_empty] gm4_lt_value matches 0 at @s run function gm4_standard_liquids:liquid_init/experience
execute positioned ~0.5 ~ ~0.5 if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1394 as @e[distance=..0.5,type=experience_orb] run function gm4_standard_liquids:util/experience_orb

#player depositing experience
execute if score standard_liquids_deposit_experience gm4_lt_util matches 2 run scoreboard players set standard_liquids_deposit_experience gm4_lt_util 0
execute positioned ~0.5 ~ ~0.5 if entity @a[distance=..0.5,gamemode=!spectator] run scoreboard players set standard_liquids_deposit_experience gm4_lt_util 1

#water cauldron
execute if entity @s[tag=gm4_lt_water] run function gm4_standard_liquids:util/water_tank

#honey cauldron
execute if entity @s[tag=gm4_lt_honey] run function gm4_standard_liquids:util/honey_casting/honey_tank

#furnace
execute if entity @s[tag=gm4_lt_lava] run function gm4_standard_liquids:util/furnace_fueling/lava_tank


tag @s remove gm4_processing_tank
