# shield breaks from durability damage
# @s = damaged player
# at @s
# run from player/damage/shield/durability/calculate

playsound minecraft:item.shield.break player @s ~ ~ ~ 1 1
execute if score $mainhand_shield gm4_sr_data matches 1 run item replace entity @s weapon.mainhand with air
execute if score $mainhand_shield gm4_sr_data matches 0 run item replace entity @s weapon.offhand with air
