# store 1 health in 'healstore' which will be healed at the end of player processing (this tick)
# @s = player wearing armor
# at world spawn
# run from armor/modifier/type/second_wind/heal_check

# store healing for later
scoreboard players add @s gm4_ce_healstore 1

# get level of piece and store cooldown
execute store result score $level gm4_ce_data run data get storage gm4_combat_expanded:temp tag.gm4_combat_expanded.level
execute if score $level gm4_ce_data matches 1 run data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.cooldown set value 5
execute if score $level gm4_ce_data matches 2 run data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.cooldown set value 4
execute if score $level gm4_ce_data matches 3 run data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.cooldown set value 3
execute if score $level gm4_ce_data matches 4 run data modify storage gm4_combat_expanded:temp tag.gm4_combat_expanded.cooldown set value 2
scoreboard players set $change gm4_ce_data 1
