# Shoot tnt
# @s = player using the crossbow
# at arrow
# run from check_projectile

tag @s add gm4_cb_use

# replace arrow with tnt and copy data
summon minecraft:tnt ~ ~ ~ {Tags:["gm4_cb_projectile"],Fuse:80s}
execute as @e[type=minecraft:tnt,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# remove tnt from player
item modify entity @s[gamemode=!creative] weapon.offhand gm4_crossbow_cartridges:remove_item

# primed tnt sound
playsound minecraft:entity.tnt.primed block @a[distance=..15] ^ ^ ^1

# repeat for multishot
execute if entity @e[tag=gm4_cb_arrow,limit=1,distance=..1] if predicate gm4_crossbow_cartridges:items/tnt run function gm4_crossbow_cartridges:projectile/tnt
