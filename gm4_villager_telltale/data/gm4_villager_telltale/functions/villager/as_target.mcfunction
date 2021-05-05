

data modify entity @s Pos set from storage gm4_villager_telltale:temp/villager Look
execute at @s run tp @s ~.5 ~ ~.5
execute at @s unless block ~ ~ ~ air run particle happy_villager ~ ~1.1 ~ .2 0 .2 .1 3
execute at @s if block ~ ~ ~ air run particle barrier ~ ~.5 ~