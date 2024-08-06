schedule function gm4_monsters_unbound:tick 1t

# check for items on the ground
execute as @e[type=item,tag=!gm4_mu_item_checked] run function gm4_monsters_unbound:check_item

# check for arrows
execute as @e[type=arrow,tag=!gm4_mu_arrow_checked] run function gm4_monsters_unbound:check_arrow
