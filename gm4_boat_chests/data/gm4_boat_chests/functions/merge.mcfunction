
advancement grant @a[distance=..5] only gm4:boat_chests

function gm4_boat_chests:old_boat

execute as @e[type=chest_minecart,distance=..2,sort=nearest,limit=1,tag=!gm4_bc_chest] run function gm4_boat_chests:old_minecart

summon boat ~ ~ ~ {Type:"oak",Tags:["gm4_bc_new"],Passengers:[{id:"minecraft:chest_minecart",Tags:["gm4_bc_new"]}]}

execute as @e[type=boat,tag=gm4_bc_new,limit=1] run function gm4_boat_chests:new_boat
execute as @e[type=chest_minecart,tag=gm4_bc_new,limit=1] run function gm4_boat_chests:new_minecart
