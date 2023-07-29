#  process totems
# @s = totem armor stand
# at @s
# run from armor/modifier/type/totem/clock

particle ambient_entity_effect ~ ~1.2 ~ 0.1 0.1 0.1 0.05 12
tp @s ~ ~ ~ ~90 ~
playsound minecraft:block.beacon.ambient block @a ~ ~ ~ 0.4 2
playsound minecraft:block.beacon.ambient block @a ~ ~ ~ 0.8 0.6

execute if entity @s[tag=gm4_ce_totem.regeneration] run effect give @a[distance=..12,gamemode=!spectator] regeneration 6 0 true
execute if entity @s[tag=gm4_ce_totem.resistance] run effect give @a[distance=..12,gamemode=!spectator] resistance 6 0 true
execute if entity @s[tag=gm4_ce_totem.speed] run effect give @a[distance=..12,gamemode=!spectator] speed 6 0 true
execute if entity @s[tag=gm4_ce_totem.strength] run effect give @a[distance=..12,gamemode=!spectator] strength 6 0 true

execute if entity @s[tag=gm4_ce_totem.regeneration] run particle dust 0.804 0.361 0.671 2 ^0.3 ^1.45 ^0.3 0 0 0 0 0 normal
execute if entity @s[tag=gm4_ce_totem.resistance] run particle dust 0.600 0.271 0.227 2 ^-0.3 ^1.45 ^0.3 0 0 0 0 0 normal
execute if entity @s[tag=gm4_ce_totem.speed] run particle dust 0.486 0.686 0.776 2 ^0.3 ^1.45 ^-0.3 0 0 0 0 0 normal
execute if entity @s[tag=gm4_ce_totem.strength] run particle dust 0.988 0.773 0.000 2 ^-0.3 ^1.45 ^-0.3 0 0 0 0 0 normal

execute unless entity @a[distance=..12,gamemode=!spectator] run function gm4_combat_expanded:armor/modifier/type/totem/remove
