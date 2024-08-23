schedule function gm4_monsters_unbound:tick 1t

# check for items on the ground
execute as @e[type=item,tag=!gm4_mu_item_checked,tag=!smithed.strict,tag=!smithed.entity] run function gm4_monsters_unbound:check_item
