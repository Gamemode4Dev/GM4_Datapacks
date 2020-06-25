#Sleeping players
execute store result score value_sleepers gm4_sleep_count if entity @a[nbt={Dimension:"minecraft:overworld"},tag=gm4_in_bed]

#Total player count & Required player calculation
execute store result score value_players gm4_sleep_count if entity @a[gamemode=!spectator,nbt={Dimension:"minecraft:overworld"},tag=!gm4_afk]
scoreboard players operation value_required gm4_sleep_count = value_players gm4_sleep_count
scoreboard players operation value_required gm4_sleep_count /= value_percentage gm4_sleep_count

#Minimum cut-off
execute if score value_required gm4_sleep_count <= value_minimum gm4_sleep_count run scoreboard players set value_required gm4_sleep_count 1