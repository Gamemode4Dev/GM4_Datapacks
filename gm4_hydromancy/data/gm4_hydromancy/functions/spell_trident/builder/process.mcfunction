# process spell trident
# @s = spell trident
# at @s
# run from spell_trident/process

execute if entity @s[tag=gm4_hy_spell_trident.builder.command_building,tag=gm4_hy_spell_trident.builder.command_ready] run function gm4_hydromancy:spell_trident/builder/create_command/finish
execute if entity @s[tag=gm4_hy_spell_trident.landed,tag=gm4_hy_spell_trident.builder.command_ready] run function gm4_hydromancy:spell_trident/builder/on_land/try_cast
tag @s[tag=gm4_hy_spell_trident.builder.command_building] add gm4_hy_spell_trident.builder.command_ready
execute if entity @s[tag=!gm4_hy_spell_trident.builder.command_ready] unless block 29999997 10 7130 command_block run function gm4_hydromancy:spell_trident/builder/create_command/start
