#@s = charged creepers from lightning curse effect
#Run from main

scoreboard players add @s gm4_ee_curse 1
tag @s[scores={gm4_ee_curse=2..}] remove gm4_remove_power
data merge entity @s[scores={gm4_ee_curse=2..}] {powered:0b}
scoreboard players reset @s[scores={gm4_ee_curse=2..}] gm4_ee_curse
