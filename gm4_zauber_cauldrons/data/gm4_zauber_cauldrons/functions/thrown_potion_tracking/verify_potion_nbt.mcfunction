# checks if the potion that hit the ground was a zauber potion
# @s = @e[type=marker,tag=gm4_potion_tracker]
# at @s
# run from function tag #gm4_potion_tracking:potion_landed

execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{gm4_zauber_cauldrons:{bottle:{multi_use:1b}}} run function gm4_zauber_cauldrons:soulution/potion_landed
execute if data storage gm4_potion_tracking:temp entity_data.Item.tag{gm4_zauber_cauldrons:{item:"bottled_magicol"}} run function gm4_zauber_cauldrons:bottled_magicol/potion_landed
