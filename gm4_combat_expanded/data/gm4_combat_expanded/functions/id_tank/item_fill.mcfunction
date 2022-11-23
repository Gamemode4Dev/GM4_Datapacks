# check if an identifyable Combat Expanded item was added to an experience tank with enough XP points
# @s = liquid tank marker
# at @s
# run from liquid_tanks:item_process

execute if entity @s[tag=gm4_lt_experience,scores={gm4_lt_value=100..}] if data storage gm4_liquid_tanks:temp/tank {input_slot:{tag:{gm4_combat_expanded:{identified:0}}}} run function gm4_combat_expanded:id_tank/check_item
say t
