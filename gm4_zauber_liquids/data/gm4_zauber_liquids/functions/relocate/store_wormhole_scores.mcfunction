# stores the scores of the wormhole tank
# @s = "smithed.block" entity inside the block
# located at the center of the block to be picked up
# run from #gm4_liquid_tanks:relocate/set_data

execute store result storage gm4_relocators:temp merge_data.entity_data.zl_warp_cx int 1 run scoreboard players get @s gm4_zl_warp_cx
execute store result storage gm4_relocators:temp merge_data.entity_data.zl_warp_cy int 1 run scoreboard players get @s gm4_zl_warp_cy
execute store result storage gm4_relocators:temp merge_data.entity_data.zl_warp_cz int 1 run scoreboard players get @s gm4_zl_warp_cz
data modify storage gm4_relocators:temp merge_data.entity_data.zl_warp_cd set from entity @e[type=armor_stand,tag=gm4_liquid_tank_display,limit=1,sort=nearest,distance=..1] ArmorItems[3].tag.gm4_zauber_liquids.stored_wormhole.dimension
