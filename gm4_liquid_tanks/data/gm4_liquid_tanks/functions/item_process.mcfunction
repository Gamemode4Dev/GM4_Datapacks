#@s = liquid tank with item in first slot
#run from liquid_tanks:process

# get stack count for smart interface
execute store result score $stack_size gm4_lt_value run data get storage gm4_liquid_tanks:temp/tank input_slot.Count 1.0

#tank init
execute if score @s[tag=gm4_lt_empty] gm4_lt_value matches 0 unless entity @s[tag=gm4_lt_fill] run function #gm4_liquid_tanks:tank_init

#item drain
execute unless entity @s[tag=gm4_lt_fill] run function #gm4_liquid_tanks:item_drain

#item fill
execute unless entity @s[tag=gm4_lt_drain] run function #gm4_liquid_tanks:item_fill

#storage cleanup
data remove storage gm4_liquid_tanks:temp/tank input_slot
data remove storage gm4_liquid_tanks:temp/tank output
