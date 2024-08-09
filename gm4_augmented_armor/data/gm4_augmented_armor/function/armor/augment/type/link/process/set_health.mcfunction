# set player to link health
# @s = player in this link
# at unspecified
# run from armor/augment/type/link/process/process_link

# remove tag as processing is done
tag @s remove gm4_aa_link.process

# calculate how health needs to change for this link
scoreboard players operation $damage_health gm4_aa_data = @s gm4_aa_health.current
scoreboard players operation $damage_health gm4_aa_data -= $link_health gm4_aa_data
scoreboard players operation @s gm4_aa_healstore -= $damage_health gm4_aa_data

# pause regen next tick if damaged
tag @s[scores={gm4_aa_healstore=..-1}] add gm4_aa_pause_nat_regen

# change player health
execute if score @s gm4_aa_healstore matches 1.. run function gm4_augmented_armor:player/heal/heal_calc
execute if score @s gm4_aa_healstore matches ..-1 run function gm4_augmented_armor:player/damage/activate

# cleanup
scoreboard players reset @s gm4_aa_healstore
