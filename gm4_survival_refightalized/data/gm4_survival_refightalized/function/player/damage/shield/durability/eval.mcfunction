# eval shield new durability
# @s = damaged player
# at @s
# run from player/damage/shield/durability/calculate

$execute if score $mainhand_shield gm4_sr_data matches 1 run item modify entity @s weapon.mainhand {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
$execute if score $mainhand_shield gm4_sr_data matches 0 run item modify entity @s weapon.offhand {function:"minecraft:set_components",components:{"minecraft:damage":$(damage)}}
