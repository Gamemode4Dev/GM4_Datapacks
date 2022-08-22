# despawn wolves without matching armor pieces, if the matching player is online
# @s = wolf without corresponding armor piece
# at @s
# run from armor/type/canine/process

# spawn nametag if wolf had a name
execute if data entity @s CustomName run loot spawn ~ ~0.2 ~ loot gm4_combat_expanded:technical/canine_nametag

# set owner UUID to Notch to not display death message
data modify entity @s Owner set value [I;110787060,1156138790,-1514210135,238594805]

# remove wolf
particle minecraft:poof ~ ~0.25 ~ 0.2 0.2 0.2 0.1 4
tp @s ~ -2050 ~
kill @s
