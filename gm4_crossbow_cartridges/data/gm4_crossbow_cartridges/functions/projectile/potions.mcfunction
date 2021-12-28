# Shoot splash/lingering potion
# @s = player using the crossbow
# at arrow
# run from check_projectile

tag @s add gm4_cb_use
data modify storage gm4_crossbow_cartridges:temp projectile.Item.tag set from entity @s Inventory[{Slot:-106b}].tag
data modify storage gm4_crossbow_cartridges:temp projectile.Owner set from entity @s UUID

# replace arrow with splash/lingering potion and copy data
execute if predicate gm4_crossbow_cartridges:items/splash_potion run summon minecraft:potion ~ ~ ~ {Tags:["gm4_cb_projectile"],Item:{id:"minecraft:splash_potion",Count:1b,tag:{Potion:"minecraft:water"}}}
execute if predicate gm4_crossbow_cartridges:items/lingering_potion run summon minecraft:potion ~ ~ ~ {Tags:["gm4_cb_projectile"],Item:{id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:water"}}}
execute as @e[type=minecraft:potion,tag=gm4_cb_projectile,limit=1,distance=..1] run function gm4_crossbow_cartridges:projectile/arrow_motion

# remove potion from player's offhand
item modify entity @s[gamemode=!creative] weapon.offhand gm4_crossbow_cartridges:remove_item

# potion throw sound
playsound minecraft:entity.splash_potion.throw player @a[distance=..15] ^ ^ ^1 .5 0
