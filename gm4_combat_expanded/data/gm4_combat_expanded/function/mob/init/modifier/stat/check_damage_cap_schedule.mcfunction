# schedule damage cap check 1t later to allow mainhand changes to apply
# @s = unspecified
# at unspecified
# schedule from main

execute as @e[tag=gm4_ce_check_damage_cap] run function gm4_combat_expanded:mob/init/modifier/stat/check_damage_cap
