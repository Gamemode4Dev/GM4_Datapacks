#compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = custom_crafters_plus gm4_clock_tick run function custom_crafters_plus:main


#basic layout
execute as @e[tag=gm4_craftingstand,type=armor_stand] at @s run function custom_crafters_plus:panes
