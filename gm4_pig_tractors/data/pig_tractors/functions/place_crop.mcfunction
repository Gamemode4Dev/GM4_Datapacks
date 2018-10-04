# @s = @a[tag=gm4_on_pig,tag=gm4_has_hoe,scores={gm4_sel_crop=1..4}]
# Called from on_tractor
execute if score @s gm4_sel_crop matches 1 run function pig_tractors:crops/carrots
execute if score @s gm4_sel_crop matches 2 run function pig_tractors:crops/beetroots
execute if score @s gm4_sel_crop matches 3 run function pig_tractors:crops/wheat
execute if score @s gm4_sel_crop matches 4 run function pig_tractors:crops/potatoes
