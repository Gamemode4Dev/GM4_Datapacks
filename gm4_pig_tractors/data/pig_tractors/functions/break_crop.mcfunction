# @s = @a[tag=gm4_on_pig,tag=gm4_has_hoe]
# Called from on_tractor
setblock ~ ~ ~ air destroy
execute align xyz run tp @e[type=item,distance=..1.1] @s
