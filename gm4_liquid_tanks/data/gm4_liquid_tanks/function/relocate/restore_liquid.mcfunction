# restores the liquid from the tank
# @s = marker for this liquid tank
# located at the center of the liquid tank
# run from gm4_liquid_tanks:relocate/summon_block_markers

data modify entity @s {} merge from storage gm4_relocators:temp gm4_relocation.entity_data.marker
execute store result score @s gm4_lt_value run data get storage gm4_relocators:temp gm4_relocation.entity_data.lt_value
execute store result score @s gm4_lt_max run data get storage gm4_relocators:temp gm4_relocation.entity_data.lt_max
scoreboard players set @s gm4_lt_disp_val 0
function #gm4_liquid_tanks:relocate/restore_liquid

summon item_display ~ ~ ~ {CustomName: "gm4_liquid_tank_liquid_display",Tags: ["gm4_liquid_tank_liquid_display","smithed.entity","smithed.strict","gm4_new_display"],transformation:{left_rotation: [0f,0f,0f,1f],right_rotation: [0f,0f,0f,1f],translation: [0f,0.2185f,0f],scale: [0.83, 0.83, 0.83]},item_display: head}
data modify entity @e[type=item_display,tag=gm4_new_display,distance=..1,limit=1] {} merge from storage gm4_relocators:temp gm4_relocation.entity_data.liquid_display
function gm4_liquid_tanks:liquid_value_update
