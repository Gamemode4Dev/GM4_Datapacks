# @s = player using the crossbow with a tipped arrow
# at @s
# run from shoot/tipped

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:speed',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:speed',amplifier:0b,duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_swiftness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:speed',amplifier:1b,duration:220}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:0b,duration:600}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_slowness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:3b,duration:40}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:strength',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:strength',amplifier:0b,duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_strength"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:strength',amplifier:1b,duration:220}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:healing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:instant_health',amplifier:0b,duration:1}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_healing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:instant_health',amplifier:1b,duration:1}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:harming"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:instant_damage',amplifier:0b,duration:1}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_harming"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:instant_damage',amplifier:1b,duration:1}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:jump_boost',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:jump_boost',amplifier:0b,duration:1200}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_leaping"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:jump_boost',amplifier:1b,duration:220}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:regeneration',amplifier:0b,duration:100}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:regeneration',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_regeneration"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:regeneration',amplifier:1b,duration:40}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:fire_resistance"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:fire_resistance',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_fire_resistance"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:fire_resistance',amplifier:0b,duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:water_breathing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:water_breathing',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_water_breathing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:water_breathing',amplifier:0b,duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:invisibility"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:invisibility',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_invisibility"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:invisibility',amplifier:0b,duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:night_vision"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:night_vision',amplifier:0b,duration:440}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_night_vision"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:night_vision',amplifier:0b,duration:1200}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:weakness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:weakness',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_weakness"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:weakness',amplifier:0b,duration:600}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:poison',amplifier:0b,duration:100}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:poison',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_poison"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:poison',amplifier:1b,duration:40}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:slow_falling"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slow_falling',amplifier:0b,duration:220}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_slow_falling"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slow_falling',amplifier:0b,duration:600}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:turtle_master"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:3b,duration:40},{id:'minecraft:resistance',amplifier:2b,duration:40}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:long_turtle_master"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:3b,duration:100},{id:'minecraft:resistance',amplifier:2b,duration:100}]
execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:strong_turtle_master"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:slowness',amplifier:5b,duration:40},{id:'minecraft:resistance',amplifier:3b,duration:40}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:luck"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:luck',amplifier:0b,duration:740}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:wind_charged"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:wind_charged',amplifier:0b,duration:440}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:weaving"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:weaving',amplifier:0b,duration:440}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:ozzing"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:ozzing',amplifier:0b,duration:440}]

execute if data storage gm4_crossbow_cartridges:temp potion_contents{potion:"minecraft:infestation"} run data modify storage gm4_crossbow_cartridges:temp projectile.active_effects set value [{id:'minecraft:infestation',amplifier:0b,duration:440}]
