# @s = @a[tag=gm4_on_pig,tag=gm4_has_hoe,scores={gm4_sel_crop=2}]
# Called from place_crop
setblock ~ ~ ~ air destroy
execute align xyz as @e[type=item,distance=..2] run function pig_tractors:break_crop
setblock ~ ~ ~ beetroots
clear @s beetroot_seeds 1
