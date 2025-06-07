# transfer old passenger to new cow
# @s = passengers of mooshroom
# at old mooshroom
# run from fished/mooshroom/action

ride @s dismount
ride @s mount @e[type=minecraft:cow,distance=..0.00001,limit=1]
