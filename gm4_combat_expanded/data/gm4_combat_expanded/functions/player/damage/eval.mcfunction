# reduce max health of player to their new health
# @s = player to heal
# at unspecified
# run from player/damage/activate

$attribute @s minecraft:generic.max_health modifier add e5e51e08-7ef8-4f88-82d2-1b5e104d5e4b "gm4_ce_remove_health" -$(remove_health) add_value
