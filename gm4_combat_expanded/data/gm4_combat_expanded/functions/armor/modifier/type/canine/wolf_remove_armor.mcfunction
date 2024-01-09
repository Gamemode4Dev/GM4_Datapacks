# remove armor from wolf
# @s = wolf that is waering armor
# at @s
# run from armor/type/canine/wolf_interact_check

##TODO: 1.20.5
data modify entity @s armor set value 0b
summon item ~ ~0.6 ~ {Item:{id:"minecraft:wolf_armor",Count:1b}}
