# @s= player with crystal in off-hand
# run from player/slow_clock

# move to storage
data modify storage gm4_zauber_cauldrons:temp/player/equipment/offhand tag.gm4_zauber_cauldrons set from entity @s Inventory[{Slot:-106b}].tag.gm4_zauber_cauldrons

execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {tag:{gm4_zauber_cauldrons:{type:"resistance"}}} run effect give @s resistance 14 1
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {tag:{gm4_zauber_cauldrons:{type:"speed"}}} run effect give @s speed 14 1
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {tag:{gm4_zauber_cauldrons:{type:"regeneration"}}} run effect give @s regeneration 14 1
execute if data storage gm4_zauber_cauldrons:temp/player/equipment/offhand {tag:{gm4_zauber_cauldrons:{type:"fire_resistance"}}} run effect give @s fire_resistance 14 1

# clear storage
data remove storage gm4_zauber_cauldrons:temp/player/equipment/offhand tag
