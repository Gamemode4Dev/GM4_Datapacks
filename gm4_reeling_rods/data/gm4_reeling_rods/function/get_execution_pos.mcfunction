# stores position of a newly summoned marker and kills it
# @s = new marker
# at @s 
# run from get_motion_to_player and reeling/enderman/action

data modify storage gm4_reeling_rods:temp position set from entity @s Pos
kill @s
