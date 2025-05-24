# updates old area effect cloud based holographic tags into new text display based ones
# @s = player
# as @s
# run via upgrade paths util

execute as @e[type=area_effect_cloud,tag=gm4_hologram,scores={gm4_entity_version=1}] at @s run function gm4_holographic_tags:upgrade_path/1.5/convert_to_text_display
