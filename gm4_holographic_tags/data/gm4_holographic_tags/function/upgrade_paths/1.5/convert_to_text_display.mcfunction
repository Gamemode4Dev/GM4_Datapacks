# collects data from the existing aec and initiates summoning of a replacement text display
# @s = outdated aec-based holographic tag
# at @s
# run from upgrade_path/1.5

# summon text display based on aec
tp ^ ^ ^.3
data modify storage gm4_holographic_tags:temp properties.raw_text set from entity @s CustomName
data modify storage gm4_holographic_tags:temp properties.rotation set from entity @s Rotation
execute at @s summon text_display run function gm4_holographic_tags:initialize_hologram
data remove storage gm4_holographic_tags:temp properties
kill @s
