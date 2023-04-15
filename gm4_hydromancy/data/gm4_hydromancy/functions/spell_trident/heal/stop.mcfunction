# stop spell once interaction entity is lost
# @s = spell trident
# at @s
# run from spell_trident/heal/process

# allow picking up of trident
data modify entity @s pickup set value 1b
tag @s remove gm4_hy_spell_trident.process

# delete interaction entities that lost their trident
execute as @e[type=interaction,tag=gm4_hy_heal.interact] at @s unless entity @e[type=trident,tag=gm4_hy_spell_trident.heal,tag=gm4_hy_spell_trident.process,distance=..0.06] run kill @s

# calculate mana
scoreboard players operation @s gm4_hy_mana_used < @s gm4_hy_charge
function gm4_hydromancy:spell_trident/update_mana
