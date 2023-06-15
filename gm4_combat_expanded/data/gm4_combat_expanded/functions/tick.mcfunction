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

# archer armor
execute as @a[tag=gm4_ce_wearing_archer,scores={gm4_ce_used_bow=1..}] unless score @s gm4_ce_t_hurt matches 1.. at @s anchored eyes positioned ^ ^ ^2 as @e[type=#gm4_combat_expanded:arrow,tag=!gm4_ce_archer_arrow,distance=..2.5,limit=1] run function gm4_combat_expanded:armor/modifier/type/archer/apply
scoreboard players reset @a gm4_ce_used_bow

# store giant weapon damage
execute as @a[scores={gm4_ce_giant_damage=1..}] run scoreboard players operation @s gm4_ce_giant_damage_stored = @s gm4_ce_giant_damage
scoreboard players reset @a gm4_ce_giant_damage
