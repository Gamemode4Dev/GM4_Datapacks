# activate burn armor on mob kill
# @s = player wearing armor
# at @s
# run from armor/modifier/killing

scoreboard players operation @s gm4_ce_burning.level += @s gm4_ce_kill
scoreboard players set @s[scores={gm4_ce_burning.level=19..}] gm4_ce_burning.level 18
scoreboard players set @s gm4_ce_burning.duration 20

execute unless score $keep_tick.burn gm4_ce_data matches 1 run schedule function gm4_combat_expanded:armor/modifier/type/burn/clock 1t
