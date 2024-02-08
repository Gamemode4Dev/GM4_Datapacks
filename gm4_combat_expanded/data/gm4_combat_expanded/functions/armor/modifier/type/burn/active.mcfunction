# process active burn armor
# @s = player with active burn armor
# at @s
# run from armor/modifier/type/burn/clock

# reduce duration
scoreboard players remove @s gm4_ce_burning.duration 1

# fire damage to nearby entities
execute store result storage gm4_combat_expanded:temp burn.damage float 0.5 run scoreboard players get @s gm4_ce_burning.level
tag @s add gm4_ce_self
execute as @e[tag=!gm4_ce_self,type=!#gm4_combat_expanded:effect_immune,predicate=!gm4_combat_expanded:modified_armor/burn,predicate=gm4_combat_expanded:technical/pvp_able,team=!gm4_ce_team_check,tag=!smithed.strict,distance=..5.25] run function gm4_combat_expanded:armor/modifier/type/burn/eval with storage gm4_combat_expanded:temp burn
tag @s remove gm4_ce_self
data remove storage gm4_combat_expanded:temp burn

# remove level if duration ran out
scoreboard players reset @s[scores={gm4_ce_burning.duration=0}] gm4_ce_burning.level
