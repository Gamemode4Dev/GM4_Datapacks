execute unless score reeling_rods gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Reeling Rods"}
execute unless score reeling_rods gm4_earliest_version < reeling_rods gm4_modules run scoreboard players operation reeling_rods gm4_earliest_version = reeling_rods gm4_modules
scoreboard players set reeling_rods gm4_modules 1


scoreboard objectives add gm4_reeling_rods.math dummy "gm4_reeling math"
scoreboard objectives add gm4_reeling_rods.lookup dummy "gm4_reeling lookup table"
scoreboard objectives add gm4_reeling_rods.entities dummy "gm4_reeling entity specific"
scoreboard objectives add gm4_reeling_rods.bit_count dummy "gm4_reeling_rods bit count"

# set_lookup_table generated in generate_files.py
function gm4_reeling_rods:set_lookup_table

schedule function gm4_reeling_rods:tick 1t
