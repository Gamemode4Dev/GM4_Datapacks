# Breaks the mace when it runs out of durability
# @s = player holding the blasting mace
# at @s
# run from gm4_blasting_maces:player/durability/calculate with storage

playsound minecraft:entity.item.break player @s ~ ~ ~ 1 1
$item replace entity @s $(slot) with air
