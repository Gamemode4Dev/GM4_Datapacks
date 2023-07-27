# remove this totem because players went too far away
# @s = totem armor stand
# at @s
# run from armor/modifier/type/totem/process

particle minecraft:poof ~ ~0.2 ~ 0.2 0.2 0.2 0.01 5
execute on passengers run kill @s
kill @s
