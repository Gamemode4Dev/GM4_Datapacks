# removes the Speed Path attribute speed and on_path tag
# @s = player, 2 after no longer being on a speed path
# at @s
# run from apply_effects/check_path

attribute @s minecraft:generic.movement_speed modifier remove dc33007e-5da4-4fad-a850-9c5a058c22ba
tag @s remove gm4_on_path
