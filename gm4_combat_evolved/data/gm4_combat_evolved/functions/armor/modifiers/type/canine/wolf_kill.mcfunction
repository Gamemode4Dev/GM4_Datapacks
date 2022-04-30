# despawn wolves without matching armor pieces, if the matching player is online
# @s = wolf without corresponding armor piece
# at @s
# run from armor/active/canine/check

# spawn nametag if wolf had a name
execute if data entity @s CustomName run function gm4_combat_evolved:armor/modifiers/type/canine/spawn_nametag

# remove wolf
particle minecraft:poof ~ ~0.25 ~ 0.2 0.2 0.2 0.1 4
data modify entity @s Owner set value [I;110787060,1156138790,-1514210135,238594805]
tp @s ~ -1000 ~
kill @s
