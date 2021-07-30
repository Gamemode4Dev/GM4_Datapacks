#run from gm4_undead_players:main
#@s = undead player being checked for drowned conversion

# Store DrownedConversionTime in a temporary scoreboard to check its value.
execute store result score #conversion_time gm4_undead_drown run data get entity @s DrownedConversionTime
execute if score #conversion_time gm4_undead_drown matches 0.. run function gm4_undead_players:process_drowning
