# @s = soul forge without fire with extra blaze powder in storage
# run from soul_forge/destroy

# summon zombie
function gm4_orb_of_ankou:soul_forge/entities/fire_sprite

# loop
scoreboard players remove @s gm4_oa_powder 1
execute if score @s gm4_oa_powder matches 1.. run function gm4_orb_of_ankou:soul_forge/entities/summon_powder_sprite
