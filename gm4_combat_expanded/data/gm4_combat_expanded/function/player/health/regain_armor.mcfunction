
scoreboard players remove @s[scores={gm4_ce_armor_reduced=1..}] gm4_ce_armor_reduced 1

# if no armor reduction is left don't apply armor
attribute @s generic.armor modifier remove gm4_ce_armor_reduced
execute if entity @s[scores={gm4_ce_armor_reduced=0}] run return run tag @s remove gm4_ce_armor_reduced

execute store result storage gm4_combat_expanded:temp set.armor_reduction int 1 run scoreboard players get @s gm4_ce_armor_reduced
function gm4_combat_expanded:player/health/eval_armor_reduction with storage gm4_combat_expanded:temp set
data remove storage gm4_combat_expanded:temp set

# reapply resistance
effect give @s resistance 2 255 true
