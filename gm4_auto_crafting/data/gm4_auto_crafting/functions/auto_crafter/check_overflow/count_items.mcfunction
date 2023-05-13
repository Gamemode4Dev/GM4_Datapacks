# counts the total number of items in the container
# @s = auto crafter that finished crafting
# located at @s
# run from gm4_auto_crafting:auto_crafter/process_output

execute store result score $add gm4_ac_buffer run data get storage gm4_auto_crafting:temp output.check[0].Count
scoreboard players operation $overflow_check gm4_ac_buffer += $add gm4_ac_buffer
data remove storage gm4_auto_crafting:temp output.check[0]
execute if data storage gm4_auto_crafting:temp output.check[-1] run function gm4_auto_crafting:auto_crafter/check_overflow/count_items
