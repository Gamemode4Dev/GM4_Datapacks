schedule function gm4_armor_identification:tick 1t

# scoreboards
scoreboard players reset @a gm4_ai_damaged
scoreboard players reset @a gm4_ai_absorped

# beacon lights
execute at @a[tag=gm4_ai_beacon_active] run function gm4_armor_identification:armor/modifiers/type/beacon/spawn
