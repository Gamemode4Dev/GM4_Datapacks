#updates charge of impulse core
#@s - impulse core item on beacon
#called by impulse_cores:main

#audiovisuals
particle minecraft:cloud ~ ~.5 ~
particle minecraft:witch ~ ~.75 ~ .25 .25 .25 0 1 normal @a

#functionality
tp @s ~ ~.15 ~ ~5 ~
execute unless block ~ ~1 ~ #impulse_cores:air run function impulse_cores:item/charge/fail

#tick score
scoreboard players add @s gm4_ic_chrg_up 1
#finish
execute if entity @s[scores={gm4_ic_chrg_up=160..}] run function impulse_cores:item/charge/success
