# Checks the temp markers physical location in the block, to see if it is in the collision box of the decorated pot
# @s = temp marker summoned in parent function
# at @s
# run from decorated/raycast

# merge marker data for if it doesn't get killed
data merge entity @s {Tags:["gm4_blossoming_pots.temp.decorated_pot","smithed.strict","smithed.entity"],CustomName:{"text":"gm4_blossoming_pots.temp_marker"}}

# if temp marker in physical hit box, return 1
# dxdydz all 0 bc of MC-123441.
execute at @s align xyz positioned ~0.062499 ~ ~0.062499 if entity @s[dx=0,dy=0,dz=0] \
    at @s align xyz positioned ~-0.062499 ~ ~-0.062499 if entity @s[dx=0,dy=0,dz=0] \
    run return 1

# else, kill marker, return fail
kill @s
return fail
