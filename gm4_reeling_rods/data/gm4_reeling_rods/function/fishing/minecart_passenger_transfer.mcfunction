# transfer old passenger to new minecart
# @s = passengers of *_minecart
# at old *_minecart
# run from fishing/minecart_type

ride @s dismount
ride @s mount @e[type=minecraft:minecart,distance=..0.00001,limit=1]
