#@s = liquid tank with item in first slot
#run from liquid_tanks:process

#tank init
execute if score @s[tag=gm4_lt_empty] gm4_lt_value matches 0 unless entity @s[tag=gm4_lt_fill] run function #gm4_liquid_tanks:tank_init

#item drain
execute unless entity @s[tag=gm4_lt_fill] run function #gm4_liquid_tanks:item_drain

#item fill
execute unless entity @s[tag=gm4_lt_drain] run function #gm4_liquid_tanks:item_fill
