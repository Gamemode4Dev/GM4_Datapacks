# Run from as_gm4_can_be_absorbed
# @s = All items with a tag "gm4_can_become_shiny" within 2 blocks of an XP Orb with the tag "as_gm4_can_be_absorbed"

execute if entity @s[scores={gm4_absorbed_xp=0..15}] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 0.4
execute if entity @s[scores={gm4_absorbed_xp=16..30}] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 0.7
execute if entity @s[scores={gm4_absorbed_xp=31..45}] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 1
execute if entity @s[scores={gm4_absorbed_xp=46..60}] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 1.2
execute if entity @s[scores={gm4_absorbed_xp=61..75}] run playsound minecraft:entity.puffer_fish.blow_up ambient @a[distance=..15] ~ ~ ~ .2 1.5
