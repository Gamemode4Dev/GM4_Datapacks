# eval stats on this new horse
# @s = new gm4_horse
# at @s
# run from level/level_up

$attribute @s max_health modifier add gm4_horse.health $(health) add_value
$attribute @s movement_speed modifier add gm4_horse.speed $(speed) add_value
$attribute @s jump_strength modifier add gm4_horse.jump $(jump) add_value
