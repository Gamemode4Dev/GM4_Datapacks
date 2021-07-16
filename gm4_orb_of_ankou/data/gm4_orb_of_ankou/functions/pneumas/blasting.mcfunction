# @s = player who shot a crossbow with blasting pneuma and blaze powder
# run from advancement_triggers/shoot_crossbow

# summon fireball at player's location
summon minecraft:small_fireball ~ ~1 ~ {Tags:["gm4_oa_fireball"],power:[0.0,0.0,0.0],Motion:[0.0,0.0,0.0]}

# copy motion of arrow to fireball
data modify entity @e[type=small_fireball,tag=gm4_oa_fireball,distance=..2,limit=1] power set from entity @e[type=minecraft:arrow,limit=1,distance=..2] Motion
kill @e[type=arrow,distance=..2,limit=1]

# clear blaze powder from player
clear @s[gamemode=!creative,gamemode=!spectator] minecraft:blaze_powder 1

# make player who shot it the owner of the fireball
data modify entity @e[type=small_fireball,tag=gm4_oa_fireball,distance=..2,limit=1] Owner set from entity @s UUID

#firecharge sound
playsound minecraft:item.firecharge.use player @a[distance=..15]
