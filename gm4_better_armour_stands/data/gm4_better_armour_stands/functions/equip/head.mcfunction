# @s = written book ..1 from armor_stand

tag @e[limit=1,distance=..1,type=item,sort=nearest,tag=!gm4_as_book] add gm4_as_select
data modify entity @s ArmorItems[3] set from entity @e[distance=..1,tag=gm4_as_select,limit=1] Item
kill @e[limit=1,distance=..1,tag=gm4_as_select]
