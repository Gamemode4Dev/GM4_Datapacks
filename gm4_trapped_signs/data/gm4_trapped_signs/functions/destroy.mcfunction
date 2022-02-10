# @s = trapped sign that needs to be broken
# run from process

execute if entity @s[tag=gm4_trapped_signs_pulsed] at @s run function gm4_trapped_signs:deactivate

summon area_effect_cloud ~ ~ ~ {Passengers:[{id:"minecraft:item",Item:{id:"minecraft:redstone",Count:3b}},{id:"minecraft:item",Item:{id:"minecraft:tripwire_hook",Count:2b}}]}
execute if entity @s[tag=gm4_secret_trapped_sign] run summon area_effect_cloud ~ ~ ~ {Passengers:[{id:"minecraft:item",Item:{id:"minecraft:black_dye",Count:1b}}]}
kill @s
