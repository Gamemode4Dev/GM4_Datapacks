# process totems
# @s = totem armor stand
# at @s
# run from clocks/temp/totem

tp @s ~ ~ ~ ~90 ~
playsound minecraft:block.beacon.ambient block @a ~ ~ ~ 0.4 2
playsound minecraft:block.beacon.ambient block @a ~ ~ ~ 0.8 0.6

execute if entity @s[tag=gm4_ce_totem.regeneration] run effect give @a[distance=..18,gamemode=!spectator] regeneration 7 0 true
execute if entity @s[tag=gm4_ce_totem.resistance] run effect give @a[distance=..18,gamemode=!spectator] resistance 7 0 true
execute if entity @s[tag=gm4_ce_totem.speed] run effect give @a[distance=..18,gamemode=!spectator] speed 7 0 true
execute if entity @s[tag=gm4_ce_totem.strength] run effect give @a[distance=..18,gamemode=!spectator] strength 7 0 true

execute if entity @s[tag=gm4_ce_totem.regeneration] run particle entity_effect{color:[0.8,0.36,0.67,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12
execute if entity @s[tag=gm4_ce_totem.resistance] run particle entity_effect{color:[0.56,0.27,0.93,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12
execute if entity @s[tag=gm4_ce_totem.speed] run particle entity_effect{color:[0.2,0.92,1.0,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12
execute if entity @s[tag=gm4_ce_totem.strength] run particle entity_effect{color:[1.0,0.78,0.0,0.33]} ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12

execute unless entity @a[distance=..32,gamemode=!spectator] run function gm4_combat_expanded:armor/modifier/type/totem/remove
