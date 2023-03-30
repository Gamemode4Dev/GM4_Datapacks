# cast the builder spell at trident landing location
# @s = spell trident
# at @s
# run from spell_trident/process_slow

execute on owner run tag @s add gm4_hy_target

scoreboard players set $builder.spell_cast gm4_hy_data 0
#execute unless block ~ ~-0.05 ~ #gm4:no_collision run function gm4_hydromancy:spell_trident/builder/


execute on owner run tag @s remove gm4_hy_target
