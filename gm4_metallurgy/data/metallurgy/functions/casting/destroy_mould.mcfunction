# @s = moulds that need destroying.
# run from sustain_mould

#check for metal values in mold, drop corresponding items

#mould contains no metal
execute if score @s gm4_ml_heat matches ..89 if entity @s[scores={gm4_ml_ore_cu=0,gm4_ml_ore_al=0,gm4_ml_ore_ba=0,gm4_ml_ore_th=0}] run summon item ~ ~ ~ {Item:{id:"minecraft:obsidian",Count:1b,tag:{display:{Lore:["slightly damaged obsidian"]}}}}


#set mould with metal in it
execute if score @s gm4_ml_heat matches ..49 unless entity @s[scores={gm4_ml_ore_cu=0,gm4_ml_ore_al=0,gm4_ml_ore_ba=0,gm4_ml_ore_th=0}] run function metallurgy:casting/set_mould


#heated mould is broken with metal in it
execute if score @s gm4_ml_heat matches 50..89 unless entity @s[scores={gm4_ml_ore_cu=0,gm4_ml_ore_al=0,gm4_ml_ore_ba=0,gm4_ml_ore_th=0}] run function metallurgy:casting/overheat_mould


#mould exceeds heat capacity
execute if score @s gm4_ml_heat matches 90.. run function metallurgy:casting/overheat_mould

#kill mould
playsound item.hoe.till block @a ~ ~ ~ .25 .9
data merge entity @s {Health:0.0f,DeathTime:19s}
