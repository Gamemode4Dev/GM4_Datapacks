# @s = zauber cauldron
# at @s
# run from cauldron/structure/check

# analyze type of cauldron used
execute store success score $has_liquid gm4_zc_data store success score $has_water gm4_zc_data if block ~ ~ ~ minecraft:water_cauldron
execute unless score $has_liquid gm4_zc_data matches 1 store success score $has_liquid gm4_zc_data store success score $has_powder_snow gm4_zc_data if block ~ ~ ~ minecraft:powder_snow_cauldron
execute unless score $has_liquid gm4_zc_data matches 1 store success score $has_liquid gm4_zc_data store success score $has_lava gm4_zc_data if block ~ ~ ~ minecraft:lava_cauldron

# check for heat source if $has_liquid == true
execute if score $has_liquid gm4_zc_data matches 1 run function gm4_zauber_cauldrons:cauldron/structure/analyze/heatsource

# enable cauldron for rabbit teleportation (only on empty cauldrons, heatsource does not matter)
execute if score $has_liquid gm4_zc_data matches 0 align xyz if entity @e[type=rabbit,dx=0,dy=0,dz=0] if entity @a[gamemode=!spectator,predicate=gm4_zauber_cauldrons:player/equipment/armor/full,distance=..2] run function gm4_zauber_cauldrons:cauldron/rabbit_teleportation
# TODO update call reference in rabbit_teleportation.mcfunction
