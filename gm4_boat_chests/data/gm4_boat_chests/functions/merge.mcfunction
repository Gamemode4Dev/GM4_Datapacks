
advancement grant @a[distance=..5] only gm4:boat_chests

tag @s add gm4_bc_old_boat
function gm4_boat_chests:old_boat

execute as @e[type=chest_minecart,distance=..3,sort=nearest,limit=1,tag=!gm4_bc_chest] run function gm4_boat_chests:old_minecart

summon boat ~ ~ ~ {Type:"oak",Tags:["gm4_bc_boat","gm4_bc_new"],Passengers:[{id:"minecraft:chest_minecart",Tags:["gm4_bc_chest","gm4_bc_new"]}]}

execute as @e[tag=gm4_bc_boat,tag=gm4_bc_new] run function gm4_boat_chests:new_boat
execute as @e[tag=gm4_bc_chest,tag=gm4_bc_new] run function gm4_boat_chests:new_minecart
