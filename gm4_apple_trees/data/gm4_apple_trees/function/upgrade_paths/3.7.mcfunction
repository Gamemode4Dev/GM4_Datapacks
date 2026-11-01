# upgrades armor stand apples to item displays and interaction entities

execute as @e[type=armor_stand,tag=gm4_apple,scores={gm4_entity_version=2}] if entity @s[nbt={Small:0b}] at @s positioned ~ ~2.5 ~ rotated ~180 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run function gm4_apple_trees:upgrade_paths/3.7/entity_replace_apple
execute as @e[type=armor_stand,tag=gm4_apple,scores={gm4_entity_version=2}] if entity @s[nbt={Small:1b}] at @s positioned ~ ~1.5 ~ rotated ~180 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run function gm4_apple_trees:upgrade_paths/3.7/entity_replace_apple

# note: golden apples had a different entity version <26.2. We skip value 2 to sync them with normal apple trees
execute as @e[type=armor_stand,tag=gm4_golden_apple,scores={gm4_entity_version=1}] if entity @s[nbt={Small:0b}] at @s positioned ~ ~2.5 ~ rotated ~180 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run function gm4_apple_trees:upgrade_paths/3.7/entity_replace_gapple
execute as @e[type=armor_stand,tag=gm4_golden_apple,scores={gm4_entity_version=1}] if entity @s[nbt={Small:1b}] at @s positioned ~ ~1.5 ~ rotated ~180 ~ align xyz positioned ~0.5 ~0.5 ~0.5 run function gm4_apple_trees:upgrade_paths/3.7/entity_replace_gapple
