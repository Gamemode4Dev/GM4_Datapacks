# @s = beehive that is being processed
# at @s
# run from check_hive_health
scoreboard players set inverse gm4_bee_data 100
#find the numbers of flowers and air blocks around the hive
execute store result score flower_count gm4_bee_data run clone ~3 ~1 ~3 ~-3 ~-1 ~-3 ~-3 ~-1 ~-3 filtered #ambrosia:flowers force
execute store result score air_count gm4_bee_data run clone ~3 ~1 ~3 ~-3 ~-1 ~-3 ~-3 ~-1 ~-3 filtered #ambrosia:air force

# get flower to air ratio (100 being 1:1)
scoreboard players operation flower_ratio gm4_bee_data = flower_count gm4_bee_data
scoreboard players operation flower_ratio gm4_bee_data *= #10000 gm4_bee_data
scoreboard players operation air_count gm4_bee_data *= #100 gm4_bee_data
scoreboard players operation flower_ratio gm4_bee_data /= air_count gm4_bee_data

# take to inverse if "> 1" space
scoreboard players set #score_inverted gm4_bee_data 0
execute store success score #score_inverted gm4_bee_data if score flower_ratio gm4_bee_data < #100 gm4_bee_data run scoreboard players operation inverse gm4_bee_data /= flower_ratio gm4_bee_data
# scale back to integer if >= 100
execute if score flower_ratio gm4_bee_data >= #100 gm4_bee_data run scoreboard players operation flower_ratio gm4_bee_data /= #100 gm4_bee_data

# put ratio back into flower_ratio if inverted
execute if score #score_inverted gm4_bee_data matches 1.. run scoreboard players operation flower_ratio gm4_bee_data = inverse gm4_bee_data

# get original flower count and apply to original flower count
scoreboard players operation flower_count gm4_bee_data /= flower_ratio gm4_bee_data
scoreboard players operation flower_count gm4_bee_data /= #16 gm4_bee_data

# spawn hive loot and add new bees to hive
execute if score flower_count gm4_bee_data matches 1.. run function ambrosia:hive/spawn_hive_loot
execute unless score @s gm4_bees matches 50.. run scoreboard players operation @s gm4_bees += flower_count gm4_bee_data

# debug bee display. Enable this for easy debugging.  For more debug displays view ambrosia:hive/fprocess_hive
#execute unless score @s gm4_bees matches ..-1 run title @a[distance=..4] actionbar ["",{"text":"Added: "},{"score":{"name":"flower_count","objective":"gm4_bee_data"}}]
