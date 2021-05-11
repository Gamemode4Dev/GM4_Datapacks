
execute as @s at @s run data modify entity @s Type set from storage gm4_boat_chests:temp NBT.Type
execute as @s at @s run data modify entity @s Rotation set from storage gm4_boat_chests:temp NBT.Rotation
tag @s add gm4_bc_boat
tag @s remove gm4_bc_new
