#run from tick

#@s = An item that looses the tag "gm4_can_become_shiny" because a player tries to pick it up

playsound minecraft:entity.puffer_fish.blow_out ambient @a[distance=..15] ~ ~ ~ .3 .8

data remove entity @s Item.tag.HideFlags

summon minecraft:experience_orb ~ ~ ~ {Value:0,Tags:["gm4_refund_xp","gm4_shiny_blacklist"]}
execute as @s at @s store result entity @e[type=minecraft:experience_orb,sort=nearest,limit=1,tag=gm4_refund_xp] Value short 1 run scoreboard players get @s gm4_absorbed_xp
execute as @s at @s as @e[type=minecraft:experience_orb,sort=nearest,limit=1,tag=gm4_refund_xp] run tag @s remove gm4_refund_xp

scoreboard players reset @s gm4_absorbed_xp 

tag @s add gm4_shiny_blacklist
tag @s remove gm4_can_become_shiny