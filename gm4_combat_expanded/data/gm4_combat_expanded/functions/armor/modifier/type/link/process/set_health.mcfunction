# set player to link health
# @s = player in this link
# at unspecified
# run from armor/modifier/type/link/process/process_link

# remove tag as processing is done
tag @s remove gm4_ce_link.process

# calculate how health needs to change for this link
scoreboard players operation $health_change gm4_ce_data = @s gm4_ce_health.current
scoreboard players operation $health_change gm4_ce_data -= $link_health gm4_ce_data
scoreboard players operation @s gm4_ce_healstore -= $health_change gm4_ce_data

# pause regen next tick if damaged
tag @s[scores={gm4_ce_healstore=..-1}] add gm4_ce_pause_nat_regen

# change player health
execute if score @s gm4_ce_healstore matches 1.. run function gm4_combat_expanded:player/heal/heal_calc
execute if score @s gm4_ce_healstore matches ..-1 run function gm4_combat_expanded:player/damage/activate

# cleanup
scoreboard players reset @s gm4_ce_healstore
