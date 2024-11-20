scoreboard objectives add gm4_nbi_play minecraft.custom:minecraft.play_noteblock
scoreboard objectives add gm4_nbi_tune minecraft.custom:minecraft.tune_noteblock
scoreboard objectives add gm4_nbi_ray dummy
scoreboard objectives add gm4_nbi_change dummy

execute unless score note_block_interface gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Note Block Interface"}
execute unless score note_block_interface gm4_earliest_version < note_block_interface gm4_modules run scoreboard players operation note_block_interface gm4_earliest_version = note_block_interface gm4_modules
scoreboard players set note_block_interface gm4_modules 1

schedule function gm4_note_block_interface:tick 1t



#$moduleUpdateList
