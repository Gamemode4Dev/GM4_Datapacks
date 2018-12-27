# @s = valid pig tractor above #pig_tractors:tillable block
# at @s positioned ~ ~-.5~
# Called from has_hoe
setblock ~ ~ ~ farmland
playsound minecraft:item.hoe.till block @a[distance=..6]
