# stop trident movement when player dismounts or mana runs out
# @s = spell trident
# at @s
# run from spell_trident/ride/process

data modify entity @s Motion set value [0.0,0.0,0.0]
tag @s remove gm4_hy_spell_trident.process
tag @s add gm4_hy_spell_trident.landed
execute on passengers run ride @s dismount
