# Initializes and saves trader data 
# run from gm4_balloon_animal:debug/summon_trader_with_llamas

data modify entity @s DespawnDelay set value 48000
data modify storage gm4_balloon_animals:temp trader_uuid set from entity @s UUID
