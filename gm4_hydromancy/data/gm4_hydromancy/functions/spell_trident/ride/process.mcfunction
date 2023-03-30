# process thrown spell trident
# @s = spell trident
# at @s
# run from spell_trident/process_slow

# track used mana
scoreboard players add @s gm4_hy_mana_used 1

# if trident is dismounted or mana runs out stop spell
scoreboard players set $passengers gm4_hy_data 0
execute on passengers run scoreboard players set $passengers gm4_hy_data 1
execute if score $passengers gm4_hy_data matches 0 run function gm4_hydromancy:spell_trident/ride/dismounted
execute if score @s gm4_hy_mana_used >= @s gm4_hy_charge run function gm4_hydromancy:spell_trident/ride/dismounted

# stop processing when trident hits the ground
tag @s[tag=gm4_hy_spell_trident.landed] remove gm4_hy_spell_trident.process

# process used mana once spell ends
execute unless entity @s[tag=gm4_hy_spell_trident.process] run function gm4_hydromancy:spell_trident/update_mana

# vfx
particle large_smoke ~ ~ ~ 0.1 0.1 0.1 0.15 1
