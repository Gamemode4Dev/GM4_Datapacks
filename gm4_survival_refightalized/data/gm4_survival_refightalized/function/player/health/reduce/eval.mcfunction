# reduce max health of player to their new health
# @s = player to heal
# at unspecified
# run from player/health/reduce/activate

$attribute @s minecraft:generic.max_health modifier add gm4_survival_refightalized:remove_health -$(remove_health) add_value
