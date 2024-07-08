# set player to link health
# @s = player in this link
# at unspecified
# run from armor/modifier/type/link/process/process_link

# remove tag as processing is done
tag @s remove gm4_ae_link.process

# calculate how health needs to change for this link
scoreboard players operation $damage_health gm4_ae_data = @s gm4_ae_health.current
scoreboard players operation $damage_health gm4_ae_data -= $link_health gm4_ae_data
scoreboard players operation @s gm4_ae_healstore -= $damage_health gm4_ae_data

# pause regen next tick if damaged
tag @s[scores={gm4_ae_healstore=..-1}] add gm4_ae_pause_nat_regen

# change player health
execute if score @s gm4_ae_healstore matches 1.. run function gm4_armor_expanded:player/heal/heal_calc
execute if score @s gm4_ae_healstore matches ..-1 run function gm4_armor_expanded:player/damage/activate

# cleanup
scoreboard players reset @s gm4_ae_healstore
