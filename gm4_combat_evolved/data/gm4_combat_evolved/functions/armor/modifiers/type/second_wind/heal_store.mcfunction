# run from armor/modifiers/type/second_wind/heal_check
# @s = player wearing second_wind piece

# store healing for later
scoreboard players add @s gm4_ce_healstore 1

# get level of piece and store cooldown
execute store result score $level gm4_ce_data run data get storage gm4_combat_evolved:temp tag.gm4_combat_evolved.level
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.cooldown set value 5
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.cooldown set value 4
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.cooldown set value 3
execute if score $level gm4_ce_data matches 4 run data modify storage gm4_combat_evolved:temp tag.gm4_combat_evolved.cooldown set value 2
scoreboard players set $change gm4_ce_data 1
