#@s = charged creepers from lightning curse effect
#Run from main



scoreboard players add @s gm4_charge_level 1
tag @s[scores={gm4_charge_level=2..}] remove gm4_removePower
data merge entity @s[scores={gm4_charge_level=2..}] {powered:0b}
scoreboard players reset @s[scores={gm4_charge_level=2..}] gm4_charge_level