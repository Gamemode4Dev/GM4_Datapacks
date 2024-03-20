# remove this coral vine block
# @s = coral vine
# at @s
# run from coral_vine/check_connection
# run from coral_vine/flower/discharge

# vfx
particle block mangrove_roots ~ ~ ~ 0.35 0.35 0.35 0.1 8
playsound block.mangrove_roots.break block @a ~ ~ ~ 0.6 0.8

# set block to dead coral vine
setblock ~ ~ ~ mangrove_roots[waterlogged=true]
tag @s remove gm4_hy_coral_vine.alive
tag @s remove gm4_hy_coral_vine.connected
tag @s remove gm4_hy_coral_vine.rooted

# if flowering remove flowers
execute if entity @s[tag=gm4_hy_coral_vine.flowering] align xyz run kill @e[type=block_display,tag=gm4_hy_coral_flower,dx=0,dy=0,dz=0]
