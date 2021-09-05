# Shoot lingering potion
# @s = player using the crossbow
# at @s
# run from check_projectile

# summon potion at player's location and copy potion type
summon minecraft:potion ~ ~1.2 ~ {Tags:["gm4_cb_proj"],Item:{id:"minecraft:lingering_potion",Count:1b,tag:{Potion:"minecraft:water"}}}
data modify entity @e[type=minecraft:potion,tag=gm4_cb_proj,distance=..2,sort=nearest,limit=1] Item.tag.Potion set from entity @s Inventory[{Slot:-106b}].tag.Potion

# remove potion from player's offhand
item replace entity @s[gamemode=!creative,nbt={Inventory:[{Slot:-106b,id:"minecraft:lingering_potion"}]}] weapon.offhand with minecraft:air

# move motion of arrow to potion
function gm4_crossbow_cartridges:projectile/arrow_motion

# potion throw sound
playsound minecraft:entity.lingering_potion.throw player @a[distance=..15] ~ ~ ~ .5 0
