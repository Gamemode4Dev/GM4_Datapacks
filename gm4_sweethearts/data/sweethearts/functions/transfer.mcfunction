# @s = player recieving health
# run from sneaking
effect give @s minecraft:regeneration 1 3 true
effect give @s minecraft:poison 1 1 true
effect give @a[tag=sweethearts_donor,limit=1] absorption 1 0 true
effect give @a[tag=sweethearts_donor,limit=1] instant_damage 1 0 true
particle heart ~ ~2 ~ 0.2 0.2 0.2 1 2
execute at @a[tag=sweethearts_donor,limit=1] run particle damage_indicator ~ ~2 ~ 0 0 0 .255 10
advancement grant @a[tag=sweethearts_donor,limit=1,scores={gm4_health=..2}] only gm4:sweethearts_selfless
