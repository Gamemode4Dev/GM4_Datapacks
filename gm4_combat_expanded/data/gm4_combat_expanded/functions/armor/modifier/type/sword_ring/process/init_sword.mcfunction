
data merge entity @s {teleport_duration:2,Tags:["gm4_ce_sword_ring.current_sword","gm4_ce_sword_ring.sword"],transformation:{left_rotation:[0f,0.425f,0f,1f],right_rotation:[1f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:iron_sword",Count:1b}}

# set the scales 
execute store result entity @s transformation.scale[0] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100
execute store result entity @s transformation.scale[1] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100
execute store result entity @s transformation.scale[2] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100

# set scores
scoreboard players operation @s gm4_ce_sword_ring = $current_sword gm4_ce_data
scoreboard players operation @s gm4_ce_id = $player_id gm4_ce_id
