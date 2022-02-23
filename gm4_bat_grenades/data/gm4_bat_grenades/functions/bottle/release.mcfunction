# @s = bat in a bottle item on the ground
# at @s
# run from main

# replace glass_bottle with bat and copy data
kill @s
summon bat ~ ~ ~
data modify entity @e[type=bat,distance=..1,sort=nearest,limit=1] {} merge from entity @s Item.tag.bat_data

# break bottle
particle block glass ~ ~.5 ~ 0.12 0.12 0.12 0 15
playsound block.glass.break block @a[distance=..8] ~ ~ ~ 1 2
