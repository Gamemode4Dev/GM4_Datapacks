# eval stats on this new horse
# @s = new gm4_horse
# at @s
# run from level/init_horse

$attribute @s max_health modifier add gm4_horse.health.remove_base $(health_remove_base) add_value
$attribute @s movement_speed modifier add gm4_horse.speed.remove_base $(speed_remove_base) add_value
$attribute @s jump_strength modifier add gm4_horse.jump.remove_base $(jump_remove_base) add_value

attribute @s max_health modifier add gm4_horse.health 11.01 add_value
$attribute @s movement_speed modifier add gm4_horse.speed $(speed_start) add_value
$attribute @s jump_strength modifier add gm4_horse.jump $(jump_start) add_value
