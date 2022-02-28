schedule function gm4_armor_identification:tick 1t

# scoreboards
scoreboard players reset @a gm4_ai_damaged
scoreboard players reset @a gm4_ai_absorped

# beacon lights
execute at @a[tag=gm4_ai_beacon_active] run function gm4_armor_identification:armor/modifiers/type/beacon/spawn

# slime landings
execute as @e[type=#gm4_armor_identification:cubes,tag=gm4_ai_poison_landing] at @s run function gm4_armor_identification:mobs/effects/poison_landing/process

# spores
execute as @e[type=item,tag=!gm4_ai_item_checked] run function gm4_armor_identification:mobs/effects/spores/check
