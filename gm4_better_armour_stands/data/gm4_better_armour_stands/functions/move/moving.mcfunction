# @s = player moving armor_stand
# at @s positioned ~ ~1 ~
# run from tick

tp @e[type=armor_stand,tag=gm4_bas_move,sort=nearest,limit=1] ^ ^ ^2

execute if predicate gm4_better_armour_stands:sneaking as @e[type=armor_stand,tag=gm4_bas_move,sort=nearest,limit=1] run function gm4_better_armour_stands:move/snap
