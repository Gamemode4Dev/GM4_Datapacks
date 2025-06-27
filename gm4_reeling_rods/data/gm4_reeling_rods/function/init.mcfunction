execute unless score reeling_rods gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Reeling Rods"}
execute unless score reeling_rods gm4_earliest_version < reeling_rods gm4_modules run scoreboard players operation reeling_rods gm4_earliest_version = reeling_rods gm4_modules
scoreboard players set reeling_rods gm4_modules 1

scoreboard objectives add gm4_reeling_rods.math dummy
scoreboard objectives add gm4_reeling_rods.lookup dummy
scoreboard objectives add gm4_reeling_rods.barbed_damage_timer dummy
scoreboard objectives add gm4_reeling_rods.barbed_damage_period dummy
scoreboard objectives add gm4_reeling_rods.barbed_attacker_uuid0 dummy
scoreboard objectives add gm4_reeling_rods.barbed_attacker_uuid1 dummy
scoreboard objectives add gm4_reeling_rods.barbed_attacker_uuid2 dummy
scoreboard objectives add gm4_reeling_rods.barbed_attacker_uuid3 dummy
scoreboard objectives add gm4_reeling_rods.rods_cast minecraft.used:minecraft.fishing_rod
# id
scoreboard objectives add gm4_reeling_rods.id_bit.0 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.1 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.2 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.3 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.4 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.5 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.6 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.7 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.8 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.9 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.10 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.11 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.12 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.13 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.14 dummy
scoreboard objectives add gm4_reeling_rods.id_bit.15 dummy

# set_lookup_table is generated in generate_files.py
function gm4_reeling_rods:set_lookup_table

schedule function gm4_reeling_rods:tick 5t
