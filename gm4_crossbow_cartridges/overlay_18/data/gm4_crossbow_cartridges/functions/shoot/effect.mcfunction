# @s = player using the crossbow with a tipped arrow
# at @s
# run from shoot/tipped

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:1,Amplifier:0b,Duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:1,Amplifier:0b,Duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:1,Amplifier:1b,Duration:220}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:2,Amplifier:0b,Duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:2,Amplifier:0b,Duration:600}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:2,Amplifier:3b,Duration:40}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:5,Amplifier:0b,Duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:5,Amplifier:0b,Duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:5,Amplifier:1b,Duration:220}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:healing"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:6,Amplifier:0b,Duration:1}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_healing"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:6,Amplifier:1b,Duration:1}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:harming"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:7,Amplifier:0b,Duration:1}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_harming"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:7,Amplifier:1b,Duration:1}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:8,Amplifier:0b,Duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:8,Amplifier:0b,Duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:8,Amplifier:1b,Duration:220}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:10,Amplifier:0b,Duration:100}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:10,Amplifier:0b,Duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:10,Amplifier:1b,Duration:40}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:fire_resistance"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:12,Amplifier:0b,Duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_fire_resistance"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:12,Amplifier:0b,Duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:water_breathing"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:13,Amplifier:0b,Duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_water_breathing"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:13,Amplifier:0b,Duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:invisibility"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:14,Amplifier:0b,Duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_invisibility"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:14,Amplifier:0b,Duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:night_vision"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:16,Amplifier:0b,Duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_night_vision"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:16,Amplifier:0b,Duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:weakness"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:18,Amplifier:0b,Duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_weakness"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:18,Amplifier:0b,Duration:600}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:19,Amplifier:0b,Duration:100}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:19,Amplifier:0b,Duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:19,Amplifier:1b,Duration:40}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:slow_falling"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:28,Amplifier:0b,Duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_slow_falling"} run data modify storage gm4_crossbow_cartridges:temp projectile.ActiveEffects set value [{Id:28,Amplifier:0b,Duration:600}]
