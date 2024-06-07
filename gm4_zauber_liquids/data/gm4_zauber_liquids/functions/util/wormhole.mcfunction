#@s = living-base entity below wormhole potion tank
#run from zauber_liquids:util_below

# To work with non-player mobs, both versions require a change to @e from @a on line 14 of wormhole_targeting/set_dimension.mcfunction

# Set coords
data remove storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos
execute store result storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos.x int 1 run scoreboard players get @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank,limit=1] gm4_zl_warp_cx
execute store result storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos.y int 1 run scoreboard players get @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank,limit=1] gm4_zl_warp_cy
execute store result storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos.z int 1 run scoreboard players get @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank,limit=1] gm4_zl_warp_cz
execute at @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank] run data modify storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos.dimension set from entity @e[type=armor_stand,tag=gm4_liquid_tank_display,limit=1,sort=nearest,distance=..1] ArmorItems[3].tag.gm4_zauber_liquids.stored_wormhole.dimension

effect give @s resistance 1 12 true

# particles and sound for depart
particle minecraft:portal ~ ~.6 ~ .25 .25 .25 0 100
playsound minecraft:entity.enderman.teleport player @a[distance=0.001..8] ~ ~ ~ 1 .3

# teleport user to destination
function gm4_zauber_cauldrons:player/wormhole_targeting/acquire_destination_context with storage gm4_zauber_cauldrons:temp/wormhole_targeting/destination cauldron_pos


scoreboard players remove @e[type=marker,tag=gm4_liquid_tank,tag=gm4_processing_tank] gm4_lt_value 1
playsound entity.player.swim block @a[distance=..8] ~ ~ ~ .5 1.5
