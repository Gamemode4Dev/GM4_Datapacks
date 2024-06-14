# @s = player using the crossbow with a tipped arrow
# at @s
# run from shoot/tipped

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:speed',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:speed',amplifier:0b,duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:speed',amplifier:1b,duration:220}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:0b,duration:600}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:3b,duration:40}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:strength',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:strength',amplifier:0b,duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:strength',amplifier:1b,duration:220}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:healing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:instant_health',amplifier:0b,duration:1}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_healing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:instant_health',amplifier:1b,duration:1}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:harming"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:instant_damage',amplifier:0b,duration:1}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_harming"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:instant_damage',amplifier:1b,duration:1}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:jump_boost',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:jump_boost',amplifier:0b,duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:jump_boost',amplifier:1b,duration:220}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:regeneration',amplifier:0b,duration:100}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:regeneration',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:regeneration',amplifier:1b,duration:40}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:fire_resistance"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:fire_resistance',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_fire_resistance"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:fire_resistance',amplifier:0b,duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:water_breathing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:water_breathing',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_water_breathing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:water_breathing',amplifier:0b,duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:invisibility"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:invisibility',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_invisibility"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:invisibility',amplifier:0b,duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:night_vision"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:night_vision',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_night_vision"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:night_vision',amplifier:0b,duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:weakness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:weakness',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_weakness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:weakness',amplifier:0b,duration:600}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:poison',amplifier:0b,duration:100}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:poison',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:strong_poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:poison',amplifier:1b,duration:40}]

execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:slow_falling"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slow_falling',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp {effect:"minecraft:long_slow_falling"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slow_falling',amplifier:0b,duration:600}]
