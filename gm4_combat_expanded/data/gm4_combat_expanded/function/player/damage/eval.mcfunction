# reduce max health of player to their new health
# @s = player to heal
# at unspecified
# run from player/damage/activate

$attribute @s minecraft:generic.max_health modifier add gm4_combat_expanded:remove_health -$(remove_health) add_value
