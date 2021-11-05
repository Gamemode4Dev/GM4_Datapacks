# @s =  player with crystal in off-hand
# run from player/crystal/process

# move to storage
data modify storage gm4_zauber_cauldrons:temp/player/equipment/offhand gm4_zauber_cauldrons set from entity @s Inventory[{Slot:-106b}].tag.gm4_zauber_cauldrons

execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {gm4_zauber_cauldrons:{type:"instant_damage"}} run effect give @s instant_damage 1 1
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {gm4_zauber_cauldrons:{type:"instant_health"}} run function gm4_zauber_cauldrons:player/crystal/effect/instant_health
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {gm4_zauber_cauldrons:{type:"jump_boost"}} run effect give @s jump_boost 7 1
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {gm4_zauber_cauldrons:{type:"poison"}} run effect give @s poison 7 1
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {gm4_zauber_cauldrons:{type:"regeneration"}} run effect give @s regeneration 7 1
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {gm4_zauber_cauldrons:{type:"speed"}} run function gm4_zauber_cauldrons:player/crystal/effect/speed
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {gm4_zauber_cauldrons:{type:"strength"}} run function gm4_zauber_cauldrons:player/crystal/effect/strength

# clear storage and reset score
data remove storage gm4_zauber_cauldrons:temp/player/equipment/offhand gm4_zauber_cauldrons
scoreboard players set @s gm4_zc_crystal 0
