# run from armor/check_modifier
# @s = player being checked

# resistance 5 if player has food haunches
execute if score @s gm4_ce_hunger matches 1.. run effect give @s resistance 1 3 true

# hunger 255 if player took damage
execute if score @s gm4_ce_hurt matches 1.. run effect give @s hunger 1 255 true
