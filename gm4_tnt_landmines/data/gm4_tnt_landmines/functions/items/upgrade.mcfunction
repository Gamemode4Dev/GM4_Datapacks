# @s = soft defuser item
# at tnt landmine armor stand
# run from checks/landmine

kill @s
tag @e[type=armor_stand,tag=gm4_tnt_mine,distance=..0.1,limit=1,sort=nearest] add gm4_no_damage

# visuals
playsound minecraft:entity.shulker_bullet.hurt block @a[distance=..8] ~ ~ ~ 1 0.4
particle minecraft:smoke ~ ~1.5 ~ 0.1 0.5 0.1 0.02 5
