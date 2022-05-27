# keep damage shield active while player has food
# @s = player being checked
# run from armor/check_modifier

# resistance 5 if player has food haunches
execute if score @s gm4_ce_hunger matches 1.. run effect give @s resistance 1 3

# hunger 100 if player took damage, upped to 150 if at full hunger
execute if score @s gm4_ce_hurt matches 1.. if score @s gm4_ce_hunger matches ..19 run effect give @s hunger 1 99 true
execute if score @s gm4_ce_hurt matches 1.. if score @s gm4_ce_hunger matches 20.. run effect give @s hunger 1 149 true

# particles
particle dust 0.000 0.000 0.000 1 ~ ~1 ~ 0.25 0.5 0.25 1 15 normal
