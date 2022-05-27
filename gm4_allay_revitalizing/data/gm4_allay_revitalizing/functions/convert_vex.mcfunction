# replaces vexes with allays
# @s = allays near a jukebox
# at @s
# run from process_jukebox

summon allay ~ ~ ~ {Tags:["gm4_ar_new"]}

tp @e[type=allay,distance=..1,tag=gm4_ar_new,limit=1] @s
data modify entity @e[type=allay,tag=gm4_ar_new,limit=1] {} merge from entity @s {}
tag @e[type=allay,distance=..1] remove gm4_ar_new

# tweak particles and sounds
particle electric_spark ~ ~.5 ~ 1 .3 1 0 1
playsound minecraft:entity.allay.item_taken neutral @a[distance=..8]
tp @s ~ ~-2050 ~
kill @s
