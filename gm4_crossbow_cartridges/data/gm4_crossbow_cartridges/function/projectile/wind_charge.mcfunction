# Shoot wind charge
# @s = player using the crossbow
# at arrow
# run from check_projectile

tag @s add gm4_cb_use
data modify storage gm4_crossbow_cartridges:temp projectile.UUID set from entity @s UUID

# replace arrow with wind_charge and copy data
summon minecraft:wind_charge ~ ~ ~ {Tags:["gm4_cb_projectile","gm4_cb_wind_charge"]}
execute as @e[type=minecraft:wind_charge,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# remove wind charge from player
item modify entity @s[gamemode=!creative] weapon.offhand gm4_crossbow_cartridges:remove_item

# wind charge sound
playsound minecraft:entity.wind_charge.throw player @a[distance=..15] ^ ^ ^1

# repeat for multishot
execute if entity @e[tag=gm4_cb_arrow,limit=1,distance=..1] if predicate gm4_crossbow_cartridges:items/wind_charge run function gm4_crossbow_cartridges:projectile/wind_charge

# remove floating wind charges
schedule function gm4_crossbow_cartridges:projectile/wind_charge_kill 5s
