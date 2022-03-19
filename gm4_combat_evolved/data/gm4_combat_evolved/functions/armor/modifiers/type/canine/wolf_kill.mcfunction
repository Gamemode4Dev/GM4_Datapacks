# run from armor/active/canine/check
# @s = wolf without corresponding armor piece
# at @s

particle minecraft:poof ~ ~0.25 ~ 0.2 0.2 0.2 0.1 4
data modify entity @s Owner set value [I;110787060,1156138790,-1514210135,238594805]
tp @s ~ -1000 ~
kill @s
