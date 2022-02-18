# executes as "right click detection" wandering trader
# @s = "right click detection" wandering trader
# at @s
# run from gm4_rope_ladders:main

execute unless entity @a[tag=gm4_rol_holding_ladder,distance=..10] run tp @s ~ -1000 ~
execute unless block ~ ~ ~ ladder run tp @s ~ -1000 ~
execute if block ~ ~-1 ~ ladder unless block ~ ~1 ~ #gm4_rope_ladders:air run tp @s ~ -1000 ~
