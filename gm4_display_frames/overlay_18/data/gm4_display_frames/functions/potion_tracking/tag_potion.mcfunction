# @s = any potion entity
# run from #gm4_potion_tracking:tag_potion

tag @s[tag=!gm4_potion,nbt={Item:{tag:{Potion:"minecraft:invisibility"}}}] add gm4_potion
tag @s[tag=!gm4_potion,nbt={Item:{tag:{Potion:"minecraft:long_invisibility"}}}] add gm4_potion
tag @s[tag=!gm4_potion,nbt={Item:{tag:{CustomPotionEffects:[{Id:14}]}}}] add gm4_potion
