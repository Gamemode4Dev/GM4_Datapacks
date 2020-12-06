execute if predicate gm4_everstone:is_full_moon as @a[scores={gm4_es_mine=1..}] at @s anchored eyes positioned ^ ^ ^3 at @e[type=item,distance=..3.5,limit=1,nbt={Age:0s,Item:{id:"minecraft:cobblestone",Count:1b}}] run loot spawn ~ ~ ~ fish gm4_everstone:drop_chance ~ ~ ~ mainhand
scoreboard players reset @a gm4_es_mine

schedule function gm4_everstone:tick 1t
