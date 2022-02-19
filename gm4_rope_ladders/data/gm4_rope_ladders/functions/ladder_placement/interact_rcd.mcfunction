# player that interacted with the "right click detection" wandering trader while holding rope ladder
# @s =  player holding rope ladder (having right clicked on ladder)
# at @s
# run from advancement gm4_rope_ladders:rcd_ladder

advancement revoke @s only gm4_rope_ladders:rcd_ladder

scoreboard players set $ladder_placed gm4_rol_data 0

function gm4_rope_ladders:ladder_placement/raycast/init

execute if score $ladder_placed gm4_rol_data matches 1 run playsound minecraft:block.ladder.place ambient @a[distance=..15] ~ ~ ~
execute if score $ladder_placed gm4_rol_data matches 0 run title @s actionbar {"text":"Rope ladder can only be 64 blocks long","color":"red"}
