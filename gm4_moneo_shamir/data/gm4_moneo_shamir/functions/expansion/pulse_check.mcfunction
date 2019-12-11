
# compares assigned run tick to current tick and calls main
execute if score current_tick gm4_clock_tick = metallurgy gm4_clock_tick run function gm4_moneo_shamir:expansion/main

# checks for moneo tools and provides maximum durability
execute as @e[type=item,tag=!gm4_moneo_checked] run function gm4_moneo_shamir:item_check
