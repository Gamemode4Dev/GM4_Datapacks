
# revoke advancement
advancement revoke @s only gm4_rope_ladders:right_click_detection

# find rcd
function gm4_rope_ladders:mechanics/ladder_placement/detect_ladder_raycast/init

# play audio if ladder placed
execute if score $ladder_placed gm4_rol_data matches 1 run playsound minecraft:block.ladder.place ambient @a[distance=..15] ~ ~ ~
