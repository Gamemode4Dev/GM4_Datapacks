


tag @s remove gm4_apple_leaf
tag @s remove gm4_fruiting_leaf
tag @s add gm4_apple

tag @s remove smithed.block
tag @s add smithed.entity
tag @s add smithed.strict

scoreboard players set @s gm4_entity_version 2

execute if entity @s[tag=gm4_ripe_apple] align xyz run summon marker ~0.5 ~2.5 ~0.5 {CustomName:'"gm4_apple_leaf"',Tags:["gm4_tree_leaf","gm4_apple_leaf","smithed.entity","smithed.strict","smithed.block"]}
execute if entity @s[tag=!gm4_ripe_apple] align xyz run summon marker ~0.5 ~1.5 ~0.5 {CustomName:'"gm4_apple_leaf"',Tags:["gm4_tree_leaf","gm4_apple_leaf","smithed.entity","smithed.strict","smithed.block"]}
