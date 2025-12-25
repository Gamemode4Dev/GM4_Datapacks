# Stores the size of each parent into a score
# @s = parent of the baby
# at location of player who has fed the parent
# run from gm4_lavish_livestock:{{ entity_id }}/revoke_advancement

# init score if parent does not have a score
scoreboard players add @s gm4_lavish_livestock_size 0

# store size of parent into fixed fake player (only one of these triggers, the other one triggers for the other parent)
execute if score $parent_a gm4_lavish_livestock_size matches -1 run return run scoreboard players operation $parent_a gm4_lavish_livestock_size = @s gm4_lavish_livestock_size
execute if score $parent_b gm4_lavish_livestock_size matches -1 run return run scoreboard players operation $parent_b gm4_lavish_livestock_size = @s gm4_lavish_livestock_size
