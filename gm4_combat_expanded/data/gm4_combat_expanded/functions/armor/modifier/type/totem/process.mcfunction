
particle minecraft:effect ~ ~1.2 ~ 1 1 1 0 12

execute if entity @s[tag=gm4_ce_totem.regeneration] run effect give @a[distance=..12,gamemode=!spectator] regeneration 2 1 true
execute if entity @s[tag=gm4_ce_totem.resistance] run effect give @a[distance=..12,gamemode=!spectator] resistance 6 0 true
execute if entity @s[tag=gm4_ce_totem.speed] run effect give @a[distance=..12,gamemode=!spectator] speed 6 0 true
execute if entity @s[tag=gm4_ce_totem.strength] run effect give @a[distance=..12,gamemode=!spectator] strength 6 0 true

execute unless entity @a[distance=..12,gamemode=!spectator] on passengers run kill @s
execute unless entity @a[distance=..12,gamemode=!spectator] run kill @s
