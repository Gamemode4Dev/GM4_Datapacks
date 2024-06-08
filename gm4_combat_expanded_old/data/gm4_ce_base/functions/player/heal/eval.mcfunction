# reduce max health of player to their new health
# @s = player to heal
# at unspecified
# run from armor/type/heal/activate

$attribute @s minecraft:generic.max_health modifier add 8a3726c1-9a5c-4b10-86ba-b72a2540eeb2 "gm4_ce_remove_health" -$(remove_health) add_value
