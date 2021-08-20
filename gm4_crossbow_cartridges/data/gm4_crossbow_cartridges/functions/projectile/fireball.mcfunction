# Shoot fire charge
# @s = player using the crossbow
# at @s
# run from check_projectile

# summon fireball at player's location
summon minecraft:small_fireball ~ ~1 ~ {Tags:["gm4_cb_proj"]}

# clear fire charge from player
clear @s[gamemode=!creative] minecraft:fire_charge 1

# copy motion of arrow to fireball
function gm4_crossbow_cartridges:projectile/arrow_motion

# fire charge sound
playsound minecraft:item.firecharge.use player @a[distance=..15]
