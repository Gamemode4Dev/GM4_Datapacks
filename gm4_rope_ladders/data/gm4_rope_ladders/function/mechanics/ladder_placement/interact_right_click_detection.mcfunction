# @s = player that interacts with a "right click detection" villager while holding ladder
# at @s
# run from advancement: gm4_rope_ladders:right_click_detection

# revoke advancement
advancement revoke @s only gm4_rope_ladders:right_click_detection

# find ladder block
function gm4_rope_ladders:mechanics/ladder_placement/detect_ladder_raycast/init

# play audio if ladder placed
execute if score $ladder_placed gm4_rol_data matches 1 run playsound minecraft:block.ladder.place ambient @a[distance=..15] ~ ~ ~
