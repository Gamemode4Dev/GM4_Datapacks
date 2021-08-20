# run from liquid_tanks:smart_item_drain and smart_item_fill
# @s = processing tank

# merge count from input and set to tank
data modify storage gm4_liquid_tanks:temp/tank output.Count set from storage gm4_liquid_tanks:temp/tank input_slot.Count
data modify block ~ ~ ~ Items[{Slot:0b}] set from storage gm4_liquid_tanks:temp/tank output

# apply value delta
scoreboard players operation @s gm4_lt_value += $stack_value gm4_lt_value

# record success
scoreboard players set $smart_success gm4_lt_value 1
