#@s = tank with entity above it positioned ~ ~1 ~
#run from liquid_tanks:process via #liquid_tanks:util_above

tag @s add gm4_processing_tank

#cow
execute as @e[dx=0,type=cow] run function standard_liquids:util/cow

#mooshroom
execute as @e[dx=0,type=mooshroom] run function standard_liquids:util/mooshroom

#experience orb
execute positioned ~0.5 ~ ~0.5 if entity @e[distance=..0.5,type=experience_orb] if score @s[tag=gm4_lt_empty] gm4_lt_value matches 0 at @s run function standard_liquids:liquid_init/experience
execute positioned ~0.5 ~ ~0.5 if score @s[tag=gm4_lt_experience] gm4_lt_value matches ..1394 as @e[distance=..0.5,type=experience_orb] run function standard_liquids:util/experience_orb

#player depositing experience
execute if score standard_liquids_deposit_experience gm4_lt_util matches 2 run scoreboard players set standard_liquids_deposit_experience gm4_lt_util 0
execute positioned ~0.5 ~ ~0.5 if entity @a[distance=..0.5,gamemode=!spectator] run scoreboard players set standard_liquids_deposit_experience gm4_lt_util 1

#cauldron
execute if entity @s[tag=gm4_lt_water] at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_cauldron,dx=0] run scoreboard players add @s gm4_lt_util 3
scoreboard players operation @s gm4_lt_util < @s gm4_lt_value
execute at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_cauldron,dx=0,limit=4] positioned ^ ^-1 ^1 if block ~ ~ ~ cauldron[level=0] run function standard_liquids:util/cauldron
scoreboard players reset @s gm4_lt_util

#furnace
execute if entity @s[tag=gm4_lt_lava] at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_furnace,dx=0] run scoreboard players add @s gm4_lt_util 1
scoreboard players operation @s gm4_lt_util < @s gm4_lt_value
execute at @e[type=area_effect_cloud,tag=gm4_lt_util_block,tag=gm4_ltu_furnace,dx=0,limit=4] positioned ^ ^-1 ^1 if block ~ ~ ~ furnace[lit=false]{Items:[{Slot:0b}]} unless block ~ ~ ~ furnace{Items:[{Slot:1b}]} run function standard_liquids:util/furnace_start
scoreboard players reset @s gm4_lt_util


tag @s remove gm4_processing_tank
