# send charge from this flowering coral vine to coral flower
# @s = flowering coral vine
# at @s
# run from coral_vine/flower/charge

# charge nearest coral core
execute as @e[type=item_display,tag=gm4_hy_coral_core,limit=1,sort=nearest] at @s run function gm4_hydromancy:coral_core/charge/add
# raycast with limit of 12 blocks
scoreboard players set $raycast_limit gm4_hy_data 120
execute facing entity @e[type=item_display,tag=gm4_hy_coral_core,limit=1,sort=nearest] feet run function gm4_hydromancy:coral_vine/flower/raycast

# remove buds
execute align xyz run kill @e[type=block_display,tag=gm4_hy_coral_flower,dx=0,dy=0,dz=0]
setblock ~ ~ ~ azalea_leaves[waterlogged=true,persistent=true]
tag @s remove gm4_hy_coral_vine.flowering
