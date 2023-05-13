schedule function gm4_combat_expanded:tick 1t

# scoreboards
scoreboard players reset @a gm4_ce_damaged
scoreboard players reset @a gm4_ce_absorped
scoreboard players reset @a gm4_ce_shielded_hit

# beacon lights
execute at @a[gamemode=!spectator,tag=gm4_ce_beacon_active] run function gm4_combat_expanded:armor/modifier/type/beacon/spawn
# immune effect clears
execute as @a[gamemode=!spectator,tag=gm4_ce_immune_active] run function gm4_combat_expanded:armor/modifier/type/immune/apply

# slime landings
execute as @e[type=slime,tag=gm4_ce_poison_landing] at @s run function gm4_combat_expanded:mob/effect/poison_landing/process

# check for spores
execute as @e[type=item,tag=!gm4_ce_item_checked] run function gm4_combat_expanded:mob/effect/spores/check

# advance delayed strikes
execute as @e[tag=gm4_cd_delay_active] at @s run function gm4_combat_expanded:weapon/modifier/delay/tick
