# restores the liquid from the tank
# @s = marker for this liquid tank
# located at the center of the liquid tank
# run from gm4_liquid_tanks:relocate/summon_block_markers

data modify entity @s {} merge from storage gm4_relocators:temp gm4_relocation.entity_data.marker
execute store result score @s gm4_lt_value run data get storage gm4_relocation.entity_data.lt_value
execute store result score @s gm4_lt_max run data get storage gm4_relocation.entity_data.lt_max
execute store result score @s gm4_lt_prior_value run data get storage gm4_relocation.entity_data.lt_prior_value

data modify storage gm4_relocators:temp gm4_relocation.entity_data.display.Pos[0] set from entity @s Pos[0]
data modify storage gm4_relocators:temp gm4_relocation.entity_data.display.Pos[2] set from entity @s Pos[2]

execute unless entity @s[tag=gm4_lt_empty] run summon armor_stand ~ ~-.95 ~ {CustomName:'"gm4_liquid_tank_display"',Tags:["gm4_no_edit","gm4_liquid_tank_display","smithed.entity","smithed.strict","gm4_new_display"],NoGravity:1,Marker:1,Silent:1,Invisible:1,Invulnerable:1,Small:1,DisabledSlots:2039552,HasVisualFire:1,ArmorItems:[{},{},{},{id:"player_head",Count:1b}]}
data modify entity @e[type=armor_stand,tag=gm4_new_display,distance=..1,limit=1] {} merge from storage gm4_relocation.entity_data.display
