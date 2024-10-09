# damage from volatile pillar
# @s = player that was hit
# at @s
# run from mob/process/elite/volatile/pillar_explode

damage @s 3 explosion
effect give @s slowness 2 2
effect give @s nausea 4 0
