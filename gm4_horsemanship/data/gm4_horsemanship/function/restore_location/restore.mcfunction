# restore player location to before mounting
# @s = marker
# at @s
# run from restore_location/prep

execute positioned as @s run tp @p[tag=gm4_horse_self] ~ ~ ~
kill @s
