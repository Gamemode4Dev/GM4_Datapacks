# code taken from sweethearts
# @s = player to heal
# at unspecified
# run from any armor/active/heal/heal_calc

# if wearing half armor keep player below half
execute if predicate gm4_combat_expanded:modified_armor/half run function gm4_combat_expanded:armor/modifier/type/half/limit_heal

# calculate max health to get player to new health
scoreboard players operation $remove_health gm4_ce_data = @s gm4_ce_health.max
scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_health.current
execute store result storage gm4_combat_expanded:temp heal_player.remove_health int 1 run scoreboard players operation $remove_health gm4_ce_data -= @s gm4_ce_healstore

execute unless score $remove_health gm4_ce_data matches 0 run function gm4_combat_expanded:player/heal/eval with storage gm4_combat_expanded:temp heal_player
data remove storage gm4_combat_expanded:temp heal_player.remove_health

# prepare reverting
tag @s add gm4_ce_healed
schedule function gm4_combat_expanded:player/heal/context 1t
