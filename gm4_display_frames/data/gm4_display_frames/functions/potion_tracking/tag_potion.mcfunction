# @s = any potion entity
# run from #gm4_potion_tracking:tag_potion

execute if items entity @s[tag=!gm4_potion] contents *[potion_contents="minecraft:invisibility"] run tag @s add gm4_potion
execute if items entity @s[tag=!gm4_potion] contents *[potion_contents="minecraft:long_invisibility"] run tag @s add gm4_potion
# TODO 1.20.5: needs partial component predicate
tag @s[tag=!gm4_potion,nbt={Item:{components:{'minecraft:potion_contents':{custom_effects:[{id:'minecraft:invisibility'}]}}}}] add gm4_potion
