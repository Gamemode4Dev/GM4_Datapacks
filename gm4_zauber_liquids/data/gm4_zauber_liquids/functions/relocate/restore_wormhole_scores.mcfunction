# restores the liquid from the tank
# @s = marker for this liquid tank
# located at the center of the liquid tank
# run from #gm4_liquid_tanks:relocate/restore_liquid

execute store result score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_zl_warp_cx run data get storage gm4_relocators:temp gm4_relocation.entity_data.zl_warp_cx
execute store result score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_zl_warp_cy run data get storage gm4_relocators:temp gm4_relocation.entity_data.zl_warp_cy
execute store result score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_zl_warp_cz run data get storage gm4_relocators:temp gm4_relocation.entity_data.zl_warp_cz
execute if entity @s[tag=gm4_lt_zauber_wormhole_potion] run data modify entity @e[type=armor_stand,tag=gm4_liquid_tank_display,limit=1,sort=nearest,distance=..1] ArmorItems[3].tag.gm4_zauber_liquids.stored_wormhole.dimension set from storage gm4_relocators:temp gm4_relocation.entity_data.zl_warp_cz
