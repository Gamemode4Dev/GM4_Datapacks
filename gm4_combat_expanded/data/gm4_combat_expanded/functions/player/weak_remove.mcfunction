# remove weakness from player
# @s = weak player with 1+ attack damage
# at world spawn
# run from player/process

attribute @s generic.attack_speed modifier remove 6f512c49-960b-4792-91d3-1f8c73b252ac
tag @s remove gm4_ce_weak
