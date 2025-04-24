
scoreboard players set $mainhand_shield gm4_sr_data 0
item replace block 29999998 1 7134 container.4 from entity @s weapon.offhand
execute unless items block 29999998 1 7134 container.4 shield store result score $mainhand_shield gm4_sr_data run item replace block 29999998 1 7134 container.4 from entity @s weapon.mainhand
data modify storage gm4_survival_refightalized:temp Items set from block 29999998 1 7134 Items
function gm4_survival_refightalized:player/damage/shield/durability/calculate
data remove block 29999998 1 7134 Items
data remove storage gm4_survival_refightalized:temp Items
