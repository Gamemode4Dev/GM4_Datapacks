# @s = soul essence item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from soul_forge/recipes/check_soul_essence

data modify entity @e[type=armor_stand,tag=gm4_soul_forge,limit=1,sort=nearest,distance=..1] ArmorItems[0] set from entity @s Item
data modify entity @e[type=armor_stand,tag=gm4_soul_forge,limit=1,sort=nearest,distance=..1] ArmorItems[1] set from entity @s Item
