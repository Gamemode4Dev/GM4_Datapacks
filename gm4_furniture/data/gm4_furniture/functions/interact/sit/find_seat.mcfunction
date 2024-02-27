# get interacting player to sit at this furniture block
# @s = furniture's interacted interaction entity
# at @s
# run from interact/process

# check if a seat already exists, if so do not allow sitting
execute as @e[type=item_display,tag=gm4_furniture.seat,dx=0,dy=0,dz=0] run function gm4_furniture:interact/sit/check
execute if entity @e[type=item_display,tag=gm4_furniture.seat,dx=0,dy=0,dz=0] run return 0

# spawn a seat for the player to sit on
ride @p[tag=gm4_furniture_target] dismount
execute store result storage gm4_furniture:temp sit.height int 1 run scoreboard players get @s gm4_furniture_sit_height
function gm4_furniture:interact/sit/spawn_seat with storage gm4_furniture:temp sit

# mark interaction as resolved
scoreboard players set $interaction_processed gm4_furniture_data 1

# cleanup
data remove storage gm4_furniture:temp sit
