# Tip arrow
# @s = player using the crossbow
# at @s
# run from check_projectile

tag @s add gm4_cb_use

# copy potion data to arrow
data modify storage gm4_crossbow_cartridges:temp potion set from entity @s Inventory[{Slot:-106b}].tag
execute as @e[type=minecraft:arrow,tag=gm4_cb_arrow,limit=3,distance=..0.1] run data modify entity @s {} merge from storage gm4_crossbow_cartridges:temp potion
data remove storage gm4_crossbow_cartridges:temp potion

# remove potion from player's offhand
item replace entity @s[gamemode=!creative] weapon.offhand with minecraft:glass_bottle

# potion throw sound
playsound minecraft:item.bottle.empty player @a[distance=..15] ^ ^ ^1
