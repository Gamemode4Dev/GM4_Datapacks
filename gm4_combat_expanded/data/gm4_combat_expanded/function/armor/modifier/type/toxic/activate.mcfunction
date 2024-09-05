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
execute if data storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:toxic} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:0b}].components."minecraft:custom_data".gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run scoreboard players add $level.poison gm4_ce_data 1
execute if score $level gm4_ce_data matches 2 run scoreboard players add $level.weakness gm4_ce_data 1
execute if score $level gm4_ce_data matches 3 run scoreboard players add $level.instant_health gm4_ce_data 1

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:toxic} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:1b}].components."minecraft:custom_data".gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run scoreboard players add $level.poison gm4_ce_data 1
execute if score $level gm4_ce_data matches 2 run scoreboard players add $level.weakness gm4_ce_data 1
execute if score $level gm4_ce_data matches 3 run scoreboard players add $level.instant_health gm4_ce_data 1

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:toxic} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:2b}].components."minecraft:custom_data".gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run scoreboard players add $level.poison gm4_ce_data 1
execute if score $level gm4_ce_data matches 2 run scoreboard players add $level.weakness gm4_ce_data 1
execute if score $level gm4_ce_data matches 3 run scoreboard players add $level.instant_health gm4_ce_data 1

scoreboard players set $level gm4_ce_data 0
execute if data storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded{modifier:toxic} store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp Items[{Slot:3b}].components."minecraft:custom_data".gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run scoreboard players add $level.poison gm4_ce_data 1
execute if score $level gm4_ce_data matches 2 run scoreboard players add $level.weakness gm4_ce_data 1
execute if score $level gm4_ce_data matches 3 run scoreboard players add $level.instant_health gm4_ce_data 1

# grant effect
tag @s add gm4_ce_self
execute if score $level.poison gm4_ce_data matches 1 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self,tag=!gm4_ce_immune_poison] poison 6 0
execute if score $level.poison gm4_ce_data matches 2 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self,tag=!gm4_ce_immune_poison] poison 6 1
execute if score $level.poison gm4_ce_data matches 3 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self,tag=!gm4_ce_immune_poison] poison 6 2
execute if score $level.poison gm4_ce_data matches 4 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self,tag=!gm4_ce_immune_poison] poison 6 3

execute if score $level.weakness gm4_ce_data matches 1 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self,tag=!gm4_ce_immune_weakness] weakness 10 0
execute if score $level.weakness gm4_ce_data matches 2 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self,tag=!gm4_ce_immune_weakness] weakness 10 1
execute if score $level.weakness gm4_ce_data matches 3 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self,tag=!gm4_ce_immune_weakness] weakness 10 2
execute if score $level.weakness gm4_ce_data matches 4 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self,tag=!gm4_ce_immune_weakness] weakness 10 3

execute if score $level.instant_health gm4_ce_data matches 1 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self] instant_health 1 0
execute if score $level.instant_health gm4_ce_data matches 2 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self] instant_health 1 1
execute if score $level.instant_health gm4_ce_data matches 3 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self] instant_health 1 2
execute if score $level.instant_health gm4_ce_data matches 4 on attacker run effect give @s[tag=!smithed.strict,tag=!gm4_ce_self] instant_health 1 3
tag @s remove gm4_ce_self
