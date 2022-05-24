# restores the liquid from the tank
# @s = marker for this liquid tank
# located at the center of the liquid tank
# run from #gm4_liquid_tanks:relocate/restore_liquid

execute store result score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_zl_warp_cx run data get storage gm4_relocators:temp gm4_relocation.entity_data.zl_warp_cx
execute store result score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_zl_warp_cy run data get storage gm4_relocators:temp gm4_relocation.entity_data.zl_warp_cy
execute store result score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_zl_warp_cz run data get storage gm4_relocators:temp gm4_relocation.entity_data.zl_warp_cz
execute store result score @s[tag=gm4_lt_zauber_wormhole_potion] gm4_zl_warp_cd run data get storage gm4_relocators:temp gm4_relocation.entity_data.zl_warp_cd
