scoreboard objectives add gm4_nbi_punch minecraft.custom:minecraft.play_noteblock
scoreboard objectives add gm4_nbi_click minecraft.custom:minecraft.tune_noteblock
scoreboard objectives add gm4_nbi_sneak minecraft.custom:minecraft.sneak_time
scoreboard objectives add gm4_nbi_ray dummy
scoreboard objectives add gm4_nbi_change dummy

scoreboard players set note_block_interface gm4_modules 1

execute unless score note_block_interface gm4_modules matches 1 run data modify storage gm4:log queue append value {type:"install",module:"Note Block Interface"}

schedule function note_block_interface:tick 1t

#$moduleUpdateList
