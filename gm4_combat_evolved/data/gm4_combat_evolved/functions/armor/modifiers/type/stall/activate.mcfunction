# run from advancement damaged/armor/stall
# @s = player wearing stall armor being damaged
# at @s

advancement revoke @s only gm4_combat_evolved:damaged/armor/stall

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_evolved:temp Items set from block 29999998 1 7134 Items

# get highest level among pieces
scoreboard players set $level gm4_ce_data 1

execute if data storage gm4_combat_evolved:temp Items[{Slot:0b}].tag.gm4_combat_evolved.stall store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:0b}].tag.gm4_combat_evolved.level
scoreboard players operation $level gm4_ce_data > $level_check gm4_ce_data

execute if data storage gm4_combat_evolved:temp Items[{Slot:1b}].tag.gm4_combat_evolved.stall store result score $level_check gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:1b}].tag.gm4_combat_evolved.level
scoreboard players operation $level gm4_ce_data > $level_check gm4_ce_data

execute if data storage gm4_combat_evolved:temp Items[{Slot:2b}].tag.gm4_combat_evolved.stall store result score $level_check gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:2b}].tag.gm4_combat_evolved.level
scoreboard players operation $level gm4_ce_data > $level_check gm4_ce_data

execute if data storage gm4_combat_evolved:temp Items[{Slot:3b}].tag.gm4_combat_evolved.stall store result score $level_check gm4_ce_data run data get storage gm4_combat_evolved:temp Items[{Slot:3b}].tag.gm4_combat_evolved.level
scoreboard players operation $level gm4_ce_data > $level_check gm4_ce_data

scoreboard players reset $level_check gm4_ce_data

# grant effect
execute if score $level gm4_ce_data matches 1 run effect give @e[distance=..3] weakness 3 1
execute if score $level gm4_ce_data matches 2 run effect give @e[distance=..3] weakness 3 2
execute if score $level gm4_ce_data matches 3 run effect give @e[distance=..3] weakness 3 3

# stall particles
summon marker ~ ~0.6 ~ {Tags:["gm4_ce_stall_aura"]}
execute as @e[type=marker,tag=gm4_ce_stall_aura] at @s run function gm4_combat_evolved:armor/modifiers/type/stall/particles