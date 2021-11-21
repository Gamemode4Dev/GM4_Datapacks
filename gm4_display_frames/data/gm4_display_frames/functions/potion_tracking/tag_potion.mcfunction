# @s = any potion entity
# run from #gm4_potion_tracking:tag_potion

data modify storage gm4_display_frames:temp Item.tag set from entity @s Item.tag

execute if data storage gm4_display_frames:temp Item.tag{Potion:"minecraft:invisibility"} run tag @s add gm4_potion
execute unless entity @s[tag=gm4_potion] if data storage gm4_display_frames:temp Item.tag{Potion:"minecraft:long_invisibility"} run tag @s add gm4_potion
execute unless entity @s[tag=gm4_potion] if data storage gm4_display_frames:temp Item.tag{CustomPotionEffects:[{Id:14b}]} run tag @s add gm4_potion

data remove storage gm4_display_frames:temp Item
