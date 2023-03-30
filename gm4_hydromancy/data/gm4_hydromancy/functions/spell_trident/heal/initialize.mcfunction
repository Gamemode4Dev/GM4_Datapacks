# initialize this spell trident spell
# @s = spell trident
# at @s
# run from spell_trident/init_trident

tag @s add gm4_hy_spell_trident.heal
tag @s add gm4_hy_spell_trident.process_slow

data modify entity @s damage set value 0.0d
# TODO: make soo it cant be picked up
