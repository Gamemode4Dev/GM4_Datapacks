# activate armor effects
# @s = arrow shot by player wearing armor
# at @s
# run from armor/modifier/type/archer/find_arrow

# if not shot by the player do not double
execute on origin unless entity @s[tag=gm4_ce_target] run return 0

# multishot support (spawns half as many arrows, so 1 per level)
scoreboard players add $storm_arrow_fired gm4_ce_data 1
execute if score $storm_arrow_fired gm4_ce_data matches 2 run scoreboard players operation $storm_arrow_target gm4_ce_data /= #2 gm4_ce_data

tag @s add gm4_ce_archer_arrow
data modify storage gm4_combat_expanded:temp archer_arrow set from entity @s {}
function gm4_combat_expanded:armor/modifier/type/archer/spawn_arrows
data remove storage gm4_combat_expanded:temp archer_arrow
