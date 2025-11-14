# Stores the size of each parent into a score
# @s = parent of the baby
# at location of player who has fed the parent
# run from gm4_lavish_livestock:{{ entity_id }}/revoke_advancement

# store size of parent into fixed fake player (only one of these triggers, the other one triggers for the other parent)
execute unless score $parent_a gm4_lavish_livestock_size matches -2147483648..2147483647 run scoreboard players operation $parent_a gm4_lavish_livestock_size = @s gm4_lavish_livestock_size
execute unless score $parent_b gm4_lavish_livestock_size matches -2147483648..2147483647 run scoreboard players operation $parent_b gm4_lavish_livestock_size = @s gm4_lavish_livestock_size
