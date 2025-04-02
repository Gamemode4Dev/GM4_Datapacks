
# gm4_sr_stat.armor_recharge_change is normally 0, but can be changed by expansions
scoreboard players set $armor_recharge gm4_sr_data 100
scoreboard players operation $armor_recharge gm4_sr_data += @s gm4_sr_stat.armor_recharge_change
scoreboard players operation $armor_recharge gm4_sr_data > #0 gm4_sr_data
scoreboard players operation @s[scores={gm4_sr_armor.reduction_timer=1..}] gm4_sr_armor.reduction_timer -= $armor_recharge gm4_sr_data
execute unless score @s gm4_sr_armor.reduction_timer matches 1.. run function gm4_survival_refightalized:player/armor/recharge
