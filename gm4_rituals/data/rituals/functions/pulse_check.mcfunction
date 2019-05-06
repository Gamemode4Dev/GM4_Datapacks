#tick stock removal
execute if score $removal_tick gm4_rit_stock matches 600.. run scoreboard players set $removal_tick gm4_rit_stock 600
scoreboard players remove $removal_tick gm4_rit_stock 1
execute unless score $removal_tick gm4_rit_stock matches 1.. run function rituals:altar/remove_stock

#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = rituals gm4_clock_tick run function rituals:main
execute if score current_tick gm4_clock_tick = rituals_4 gm4_clock_tick run function rituals:main
execute if score current_tick gm4_clock_tick = rituals_8 gm4_clock_tick run function rituals:main
execute if score current_tick gm4_clock_tick = rituals_12 gm4_clock_tick run function rituals:main

#reset sneak score
scoreboard players reset @a[scores={gm4_rit_sneak=1..}] gm4_rit_sneak
