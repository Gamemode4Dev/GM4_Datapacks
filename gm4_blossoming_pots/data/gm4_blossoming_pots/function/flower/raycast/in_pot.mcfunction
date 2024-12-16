# Checks the temp markers physical location in the block, to see if it is in the collision box of the flower pot
# @s = temp marker summoned in parent function
# at @s
# run from flower/raycast/is_flower_pot

# merge marker data for if it doesn't get killed
    # item id of players main hand is stored on the temp marker and set to null until it is overwritten in flower/raycast/player_rotation. It is set to null here in case the players hand is empty
    # id is not used by flower/vanilla_pots at all
data merge entity @s {Tags:["gm4_blossoming_pots.temp.flower_pot","smithed.strict","smithed.entity"],CustomName:'{"text":"gm4_blossoming_pots.temp_marker"}',data:{id:null}}

# if temp marker in physical hit box, return 1
# dxdydz all 0 bc of MC-123441.
execute at @s align xyz positioned ~0.312499 ~ ~0.312499 if entity @s[dx=0,dy=0,dz=0] \
    at @s align xyz positioned ~-0.312499 ~-0.625 ~-0.312499 if entity @s[dx=0,dy=0,dz=0] \
    run return 1

# else, kill marker, return fail
kill @s
return fail
