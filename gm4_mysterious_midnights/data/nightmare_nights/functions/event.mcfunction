#@s = none
#at world spawn
#called by mysterious midnights base if this expansion was selected. pulsed every 0.8 seconds throughout the night.

#kick players out of beds
effect give @a[nbt={Sleeping:1b}] minecraft:instant_damage 1 0

#initialise nightmare night
execute unless score started_nightmare_night gm4_nights_data matches 1 run function nightmare_nights:initialise
