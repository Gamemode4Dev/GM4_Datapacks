#no @s.
#at world spawn
#called by init

#randomly marks flower types as poisonous on module installation

# initialize randomizer
random reset gm4_zauber_cauldrons:flowers/poisonous_flowers 0 true true

# assign poisonous/lucky score
# NOTE the order these flowers are assigned scores in MUST be the same as the one in Zauber Cauldrons, otherwise the lucky/unlucky flowers won't match up
# in the future we should probably find a way to not make this depend on the order these flowers have their values rolled in
# as spawner minecarts should receive a complete overhaul soon anyways, this fix was put in place to ensure lucky flower parity between Zauber & Spawner Minecarts for now
# -Bloo, Feb 2024
execute store result score dandelion gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score poppy gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score blue_orchid gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score allium gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score azure_bluet gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score red_tulip gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score orange_tulip gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score white_tulip gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score pink_tulip gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score oxeye_daisy gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score cornflower gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers
execute store result score lily_of_the_valley gm4_sm_flowers run random value 0..1 gm4_zauber_cauldrons:flowers/poisonous_flowers

# calculate amount of required flowers
scoreboard players set required_flowers gm4_sm_flowers 12

scoreboard players operation required_flowers gm4_sm_flowers -= dandelion gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= poppy gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= blue_orchid gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= allium gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= azure_bluet gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= red_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= orange_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= white_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= pink_tulip gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= oxeye_daisy gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= cornflower gm4_sm_flowers
scoreboard players operation required_flowers gm4_sm_flowers -= lily_of_the_valley gm4_sm_flowers
