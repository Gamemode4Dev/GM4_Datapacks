# Shoot beehive
# @s = player using the crossbow
# at arrow
# run from check_projectile

tag @s add gm4_cb_use
data modify storage gm4_crossbow_cartridges:temp bees set from entity @s Inventory[{Slot:-106b}].components."minecraft:bees"
data modify storage gm4_crossbow_cartridges:temp projectile set from storage gm4_crossbow_cartridges:temp bees[0].entity_data
data remove storage gm4_crossbow_cartridges:temp bees[0]

# replace arrow with bee and copy data
summon minecraft:bee ~ ~ ~ {Tags:["gm4_cb_projectile"]}
execute as @e[type=minecraft:bee,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# remove bee from beehive
execute if entity @s[gamemode=!creative] run function gm4_crossbow_cartridges:set_bees with storage gm4_crossbow_cartridges:temp
data remove storage gm4_crossbow_cartridges:temp bees

# bee sting sound
playsound minecraft:entity.bee.hurt player @a[distance=..15] ^ ^ ^1 .5

# repeat for multishot
execute if entity @e[tag=gm4_cb_arrow,limit=1,distance=..1] if predicate gm4_crossbow_cartridges:items/beehive run function gm4_crossbow_cartridges:projectile/beehive
