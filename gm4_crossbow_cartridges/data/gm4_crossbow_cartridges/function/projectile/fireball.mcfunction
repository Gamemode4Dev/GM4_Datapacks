# Shoot fire charge
# @s = player using the crossbow
# at arrow
# run from check_projectile

tag @s add gm4_cb_use
data modify storage gm4_crossbow_cartridges:temp projectile.UUID set from entity @s UUID

# replace arrow with small_fireball and copy data
summon minecraft:small_fireball ~ ~ ~ {Tags:["gm4_cb_projectile","gm4_cb_fireball"]}
execute as @e[type=minecraft:small_fireball,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# remove fire charge from player
item modify entity @s[gamemode=!creative] weapon.offhand gm4_crossbow_cartridges:remove_item

# fire charge sound
playsound minecraft:item.firecharge.use player @a[distance=..15] ^ ^ ^1

# repeat for multishot
execute if entity @e[tag=gm4_cb_arrow,limit=1,distance=..1] if predicate gm4_crossbow_cartridges:items/fire_charge run function gm4_crossbow_cartridges:projectile/fireball

# remove floating fireballs
schedule function gm4_crossbow_cartridges:projectile/fireball_kill 5s
