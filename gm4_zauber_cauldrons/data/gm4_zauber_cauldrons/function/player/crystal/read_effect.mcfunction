# @s = player with crystal in off-hand
# run from player/crystal/process

# read and apply effects
execute if items entity @s weapon.offhand *[custom_data~{gm4_zauber_cauldrons:{type:"instant_damage"}}] run effect give @s instant_damage 1 1
execute if items entity @s weapon.offhand *[custom_data~{gm4_zauber_cauldrons:{type:"instant_health"}}] run function gm4_zauber_cauldrons:player/crystal/effect/instant_health
execute if items entity @s weapon.offhand *[custom_data~{gm4_zauber_cauldrons:{type:"jump_boost"}}] run effect give @s jump_boost 7 1
execute if items entity @s weapon.offhand *[custom_data~{gm4_zauber_cauldrons:{type:"poison"}}] run effect give @s poison 7 1
execute if items entity @s weapon.offhand *[custom_data~{gm4_zauber_cauldrons:{type:"regeneration"}}] run effect give @s regeneration 7 1
execute if items entity @s weapon.offhand *[custom_data~{gm4_zauber_cauldrons:{type:"speed"}}] run function gm4_zauber_cauldrons:player/crystal/effect/speed
execute if items entity @s weapon.offhand *[custom_data~{gm4_zauber_cauldrons:{type:"strength"}}] run function gm4_zauber_cauldrons:player/crystal/effect/strength

# reset score
data remove storage gm4_zauber_cauldrons:temp/player/equipment/offhand gm4_zauber_cauldrons
scoreboard players set @s gm4_zc_crystal 0
