schedule function gm4_combat_evolved:tick 1t

# scoreboards
scoreboard players reset @a gm4_ce_damaged
scoreboard players reset @a gm4_ce_absorped
scoreboard players reset @a gm4_ce_shielded_hit

# beacon lights
execute at @a[gamemode=!spectator,tag=gm4_ce_beacon_active] run function gm4_combat_evolved:armor/modifiers/type/beacon/spawn

# slime landings
execute as @e[type=#gm4_combat_evolved:cubes,tag=gm4_ce_poison_landing] at @s run function gm4_combat_evolved:mobs/effects/poison_landing/process

# spores
execute as @e[type=item,tag=!gm4_ce_item_checked] run function gm4_combat_evolved:mobs/effects/spores/check

# advance delayed strikes
execute as @e[tag=gm4_cd_delay_active] at @s run function gm4_combat_evolved:weapon/modifiers/delay/tick
