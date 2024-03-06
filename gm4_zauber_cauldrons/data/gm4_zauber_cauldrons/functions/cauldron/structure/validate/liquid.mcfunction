# @s = zauber cauldron
# at @s align xzy
# run from main

# reset rabbit target score
scoreboard players set @s gm4_zc_rabtarget 0

# analyze
function gm4_zauber_cauldrons:cauldron/structure/analyze/liquid

# if there is a liquid present, continue to heat source checks
execute if score $has_liquid gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/validate/heatsource

# if the cauldron is empty, enable the rabbit teleportation easter egg
execute unless score $has_liquid gm4_zc_data matches 1 if block ~ ~ ~ minecraft:cauldron if entity @e[type=rabbit,dx=0,dy=0,dz=0,limit=1] if entity @a[gamemode=!spectator,predicate=gm4_zauber_cauldrons:player/equipment/armor/full,distance=..2] run function gm4_zauber_cauldrons:cauldron/rabbit_teleportation
execute unless score $has_liquid gm4_zc_data matches 1 run scoreboard players set @s gm4_zc_rabtarget 1

# if there is no longer a cauldron, destroy the zauber cauldron
execute unless block ~ ~ ~ #minecraft:cauldrons run function gm4_zauber_cauldrons:cauldron/structure/destroy

# reset fake players
scoreboard players reset $has_liquid gm4_zc_data
scoreboard players reset $has_water gm4_zc_data
scoreboard players reset $has_powder_snow gm4_zc_data
scoreboard players reset $has_lava gm4_zc_data
