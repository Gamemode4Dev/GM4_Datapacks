# regenerate living entity or damage undead
# @s = spell trident
# at @s
# run from spell_trident/heal/process

scoreboard players add $heal.mana_used gm4_hy_data 1
effect give @s[type=!#gm4_hydromancy:undead] regeneration 2 0
damage @s[type=#gm4_hydromancy:undead] 1 trident
