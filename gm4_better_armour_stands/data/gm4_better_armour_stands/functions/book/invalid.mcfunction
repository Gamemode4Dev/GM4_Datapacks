# @s = armor_stand to be modified
# at @s
# run from book/process

particle minecraft:block_marker minecraft:barrier ~ ~.7 ~ 0 0 0 0 1 force @a[tag=gm4_bas_active,limit=1]
playsound minecraft:item.book.put player @a[tag=gm4_bas_active,limit=1] ~ ~ ~ 1 .8
title @a[tag=gm4_bas_active,limit=1] actionbar {"translate":"tooltip.gm4.better_armour_stands.invalid_code","fallback":"Invalid code"}
