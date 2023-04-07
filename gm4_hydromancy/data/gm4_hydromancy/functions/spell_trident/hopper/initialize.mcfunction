# initialize this spell trident spell
# @s = spell trident
# at @s
# run from spell_trident/init_trident

tag @s add gm4_hy_spell_trident.hopper
tag @s add gm4_hy_spell_trident.process_fast

data modify entity @s pickup set value 0b
data modify entity @s damage set value 4.0d
