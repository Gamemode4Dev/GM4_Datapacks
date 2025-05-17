# @s = new living orb silverfish
# run from soul_forge/entities/set_data/loop_orb_pneumas

# get shard data from loot table
$loot replace entity @s weapon.offhand loot gm4_orb_of_ankou:items/soul_shard/$(id)
data modify storage gm4_orb_of_ankou:temp shard set from entity @s equipment.offhand
item replace entity @s weapon.offhand with minecraft:air

# set data of soul shard into orb of ankou
data modify storage gm4_orb_of_ankou:temp new_orb.components."minecraft:lore" append from storage gm4_orb_of_ankou:temp shard.components."minecraft:lore"[]
data modify storage gm4_orb_of_ankou:temp new_orb.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas append from storage gm4_orb_of_ankou:temp shard.components."minecraft:custom_data".gm4_orb_of_ankou.pneumas[]
data modify storage gm4_orb_of_ankou:temp new_orb.components."minecraft:enchantments" merge from storage gm4_orb_of_ankou:temp shard.components."minecraft:enchantments"
data modify storage gm4_orb_of_ankou:temp new_orb.components."minecraft:attribute_modifiers" append from storage gm4_orb_of_ankou:temp shard.components."minecraft:attribute_modifiers"[]
data remove storage gm4_orb_of_ankou:temp new_orb.components."minecraft:attribute_modifiers"[{id:"gm4_orb_of_ankou:attack_damage"}]
