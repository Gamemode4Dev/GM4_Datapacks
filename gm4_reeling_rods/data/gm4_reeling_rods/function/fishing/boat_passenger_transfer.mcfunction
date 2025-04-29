# transfer old passenger to new boat
# @s = passengers of chest boat type
# at old chest boat type
# run from fishing/chest_boat

ride @s dismount
ride @s mount @e[type=#gm4:boats,distance=..0.00001,limit=1]
