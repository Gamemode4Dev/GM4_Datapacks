# process thrown spell trident
# @s = spell trident
# at @s
# run from spell_trident/process

# track used mana
scoreboard players add @s gm4_hy_mana_used 1

# if trident is dismounted or mana runs out stop spell
execute unless data entity @s Passengers run function gm4_hydromancy:spell_trident/ride/dismounted
execute if score @s gm4_hy_mana_used >= @s gm4_hy_charge run function gm4_hydromancy:spell_trident/ride/dismounted

# stop processing when trident hits the ground
tag @s[nbt={inGround:1b}] remove gm4_hy_spell_trident

# process used mana once spell ends
execute unless entity @s[tag=gm4_hy_spell_trident] run function gm4_hydromancy:spell_trident/update_mana
