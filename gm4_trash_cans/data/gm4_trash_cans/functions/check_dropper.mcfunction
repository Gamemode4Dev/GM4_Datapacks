# @s = trash_can
# run from update

tag @s[tag=gm4_trash_disable] remove gm4_trash_disable
function gm4_trash_cans:disable

execute unless entity @s[tag=gm4_trash_disable] run particle flame ~ ~1.1 ~ 0 0 0 0.01 1
execute if block ~ ~ ~ dropper[triggered=true] run particle dust 1 0 0 1 ~ ~1.1 ~ 0 0 0 0.05 1

execute unless entity @s[tag=gm4_trash_disable] if data block ~ ~ ~ Items[0].Count run function gm4_trash_cans:check_rate