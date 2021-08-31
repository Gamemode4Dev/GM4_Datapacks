#run from gm4_undead_players:main
#@s = undead player who is undergoing drowned conversion

# Store DrownedConversionTime in a temporary scoreboard to use in calculations.
execute store result score #conversion_time gm4_undead_drown run data get entity @s DrownedConversionTime

# Initialize drowning score to (15s * 20t/s) if the zombie just started drowning.
execute unless score @s gm4_undead_drown = @s gm4_undead_drown run scoreboard players set @s gm4_undead_drown 300

# Calculate how much the zombie has drowned since the last call to this function.
scoreboard players set #conversion_diff gm4_undead_drown 300
scoreboard players operation #conversion_diff gm4_undead_drown -= #conversion_time gm4_undead_drown
scoreboard players operation @s gm4_undead_drown -= #conversion_diff gm4_undead_drown

# Reset the zombie's DrownedConversionTime so it doesn't drown naturally.
execute if score @s gm4_undead_drown matches 0.. run data modify entity @s DrownedConversionTime set value 300

# The conversion is now complete; spawn a new drowned and copy the zombie's data.
execute if score @s gm4_undead_drown matches ..-1 at @s run function gm4_undead_players:summon_drowned
