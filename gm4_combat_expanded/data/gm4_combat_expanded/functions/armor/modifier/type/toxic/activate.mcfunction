# actiavate toxic armor on wearer getting hit
# @s = player wearing armor
# at @s
advancement revoke @s only gm4_combat_expanded:damaged/armor/toxic

# store armor for checking
item replace block 29999998 1 7134 container.0 from entity @s armor.head
item replace block 29999998 1 7134 container.1 from entity @s armor.chest
item replace block 29999998 1 7134 container.2 from entity @s armor.legs
item replace block 29999998 1 7134 container.3 from entity @s armor.feet
data modify storage gm4_combat_expanded:temp Items set from block 29999998 1 7134 Items
data remove block 29999998 1 7134 Items

scoreboard players set $level.poison gm4_ce_data 0
scoreboard players set $level.weakness gm4_ce_data 0
scoreboard players set $level.instant_health gm4_ce_data 0

# add levels among pieces
scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].tag.gm4_combat_expanded{modifier:toxic} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:0b}].tag.gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run scoreboard players add $level.poison gm4_ce_data 1
execute if score $level gm4_ce_data matches 2 run scoreboard players add $level.weakness gm4_ce_data 1
execute if score $level gm4_ce_data matches 3 run scoreboard players add $level.instant_health gm4_ce_data 1

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].tag.gm4_combat_expanded{modifier:toxic} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:1b}].tag.gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run scoreboard players add $level.poison gm4_ce_data 1
execute if score $level gm4_ce_data matches 2 run scoreboard players add $level.weakness gm4_ce_data 1
execute if score $level gm4_ce_data matches 3 run scoreboard players add $level.instant_health gm4_ce_data 1

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].tag.gm4_combat_expanded{modifier:toxic} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:2b}].tag.gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run scoreboard players add $level.poison gm4_ce_data 1
execute if score $level gm4_ce_data matches 2 run scoreboard players add $level.weakness gm4_ce_data 1
execute if score $level gm4_ce_data matches 3 run scoreboard players add $level.instant_health gm4_ce_data 1

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].tag.gm4_combat_expanded{modifier:toxic} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:3b}].tag.gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run scoreboard players add $level.poison gm4_ce_data 1
execute if score $level gm4_ce_data matches 2 run scoreboard players add $level.weakness gm4_ce_data 1
execute if score $level gm4_ce_data matches 3 run scoreboard players add $level.instant_health gm4_ce_data 1

# grant effect
execute if score $level.poison gm4_ce_data matches 1 on attacker run effect give @s[tag=!smithed.strict] poison 6 0
execute if score $level.poison gm4_ce_data matches 2 on attacker run effect give @s[tag=!smithed.strict] poison 6 1
execute if score $level.poison gm4_ce_data matches 3 on attacker run effect give @s[tag=!smithed.strict] poison 6 2
execute if score $level.poison gm4_ce_data matches 4 on attacker run effect give @s[tag=!smithed.strict] poison 6 3

execute if score $level.weakness gm4_ce_data matches 1 on attacker run effect give @s[tag=!smithed.strict] weakness 10 0
execute if score $level.weakness gm4_ce_data matches 2 on attacker run effect give @s[tag=!smithed.strict] weakness 10 1
execute if score $level.weakness gm4_ce_data matches 3 on attacker run effect give @s[tag=!smithed.strict] weakness 10 2
execute if score $level.weakness gm4_ce_data matches 4 on attacker run effect give @s[tag=!smithed.strict] weakness 10 3

execute if score $level.instant_health gm4_ce_data matches 1 on attacker run effect give @s[tag=!smithed.strict] instant_health 1 0
execute if score $level.instant_health gm4_ce_data matches 2 on attacker run effect give @s[tag=!smithed.strict] instant_health 1 1
execute if score $level.instant_health gm4_ce_data matches 3 on attacker run effect give @s[tag=!smithed.strict] instant_health 1 2
execute if score $level.instant_health gm4_ce_data matches 4 on attacker run effect give @s[tag=!smithed.strict] instant_health 1 3
