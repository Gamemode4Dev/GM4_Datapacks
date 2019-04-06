#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.
say harvest_moons.event

execute unless score started_harvest_moon gm4_harvest_moon matches 1 run gamerule randomTickSpeed 60
execute unless score started_harvest_moon gm4_harvest_moon matches 1 run scoreboard players set started_harvest_moon gm4_harvest_moon 1
