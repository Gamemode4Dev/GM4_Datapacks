# eval stats on this new horse
# @s = new gm4_horse
# at @s
# run from level/init_horse

# remove base stats
$attribute @s max_health modifier add gm4_horse:health.remove_base -$(health_base) add_value
$attribute @s movement_speed modifier add gm4_horse:speed.remove_base -$(speed_base) add_value
$attribute @s jump_strength modifier add gm4_horse:jump.remove_base -$(jump_base) add_value

# add boosts for wild horses
attribute @s max_health modifier add gm4_horse:untamed 10 add_value
$attribute @s movement_speed modifier add gm4_horse:untamed $(speed_base) add_value

# add base stats
attribute @s max_health modifier add gm4_horse:health 11.01 add_value
$attribute @s movement_speed modifier add gm4_horse:speed $(speed_start) add_value
$attribute @s jump_strength modifier add gm4_horse:jump $(jump_start) add_value

# randomize scale slightly
$attribute @s scale modifier add gm4_horse:scale $(scale) add_value
