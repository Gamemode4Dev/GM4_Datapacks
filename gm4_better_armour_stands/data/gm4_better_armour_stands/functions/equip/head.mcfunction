# @s = armor_stand ..1 from writable_book
tag @e[limit=1,distance=..1,type=item,sort=nearest,tag=!gm4_bas_book] add gm4_bas_select
data modify entity @s ArmorItems[3] set from entity @e[distance=..1,tag=gm4_bas_select,limit=1] Item
kill @e[limit=1,distance=..1,tag=gm4_bas_select]
