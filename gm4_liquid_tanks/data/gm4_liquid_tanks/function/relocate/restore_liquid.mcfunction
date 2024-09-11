# restores the liquid from the tank
# @s = marker for this liquid tank
# located at the center of the liquid tank
# run from gm4_liquid_tanks:relocate/summon_block_markers

data modify entity @s {} merge from storage gm4_relocators:temp gm4_relocation.entity_data.marker
execute store result score @s gm4_lt_value run data get storage gm4_relocators:temp gm4_relocation.entity_data.lt_value
execute store result score @s gm4_lt_max run data get storage gm4_relocators:temp gm4_relocation.entity_data.lt_max
scoreboard players set @s gm4_lt_disp_val 0
function #gm4_liquid_tanks:relocate/restore_liquid

execute unless entity @s[tag=gm4_lt_empty] run summon armor_stand ~ ~-.95 ~ {CustomName:'"gm4_liquid_tank_display"',Tags:["gm4_no_edit","gm4_liquid_tank_display","smithed.entity","smithed.strict","gm4_new_display"],NoGravity:1b,Marker:1b,Silent:1b,Invisible:1b,Invulnerable:1b,Small:1b,Silent:1b,DisabledSlots:4144959,HasVisualFire:1b,ArmorItems:[{},{},{},{id:"player_head",count:1}]}
data modify entity @e[type=armor_stand,tag=gm4_new_display,distance=..1,limit=1] {} merge from storage gm4_relocators:temp gm4_relocation.entity_data.display
function gm4_liquid_tanks:liquid_value_update
