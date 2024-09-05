# activate burn armor on mob kill
# @s = player wearing armor
# at @s
# run from armor/modifier/killing

scoreboard players operation @s gm4_ce_burning.level += @s gm4_ce_kill
scoreboard players set @s[scores={gm4_ce_burning.level=9..}] gm4_ce_burning.level 8
scoreboard players set @s gm4_ce_burning.duration 20

execute unless score $keep_tick.burn gm4_ce_keep_tick matches 1 run schedule function gm4_combat_expanded:clocks/temp/burn 1t
