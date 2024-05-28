# @s = any potion entity
# run from #gm4_potion_tracking:tag_potion

tag @s[tag=!gm4_potion,nbt={Item:{components:{"minecraft:potion_contents":{potion:"minecraft:invisibility"}}}}] add gm4_potion
tag @s[tag=!gm4_potion,nbt={Item:{components:{"minecraft:potion_contents":{potion:"minecraft:long_invisibility"}}}}] add gm4_potion
tag @s[tag=!gm4_potion,nbt={Item:{components:{"minecraft:potion_contents":{custom_effects:[{id:'minecraft:invisibility'}]}}}}] add gm4_potion
