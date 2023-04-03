# initialize this spell trident spell
# @s = spell trident
# at @s
# run from spell_trident/init_trident

tag @s add gm4_hy_spell_trident.ride
tag @s add gm4_hy_spell_trident.process_fast

ride @p[tag=gm4_hy_using_spell_trident] dismount
ride @p[tag=gm4_hy_using_spell_trident] mount @s
data modify entity @s damage set value 0.0d
