# initialize this spell trident spell
# @s = spell trident
# at @s
# run from spell_trident/init_trident

tag @s add gm4_hy_spell_trident.firework
tag @s add gm4_hy_spell_trident.process_fast

data modify entity @s damage set value 5.0d
data modify entity @s NoGravity set value 1b
