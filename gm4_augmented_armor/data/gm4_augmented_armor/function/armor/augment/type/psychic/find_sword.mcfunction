# find this players sword and move it
# @s = player wearing armor
# at @s rotated ~x ~
# run from armor/augment/type/psychic/eval_deg
# run from here

# find sword that should be moved
execute store result score $sword_id gm4_aa_data run data get storage gm4_augmented_armor:temp psychic.data[0].components."minecraft:custom_data".gm4_augmented_armor.slot
execute as @e[type=item_display,tag=gm4_aa_psychic.check_sword,distance=..12] if score @s gm4_aa_augment.psychic.id = $sword_id gm4_aa_data run tag @s add gm4_aa_psychic.current_sword

# check durability left on this armor
execute store result score $sword_damage gm4_aa_data run data get storage gm4_augmented_armor:temp psychic.data[0].components."minecraft:damage"
execute store result score $sword_durability gm4_aa_data run data get storage gm4_augmented_armor:temp psychic.data[0].components."minecraft:custom_data".gm4_augmented_armor.durability

# if no sword exists yet spawn a new one
execute if score $sword_damage gm4_aa_data < $sword_durability gm4_aa_data unless entity @e[type=item_display,tag=gm4_aa_psychic.current_sword,distance=..12] summon item_display run function gm4_augmented_armor:armor/augment/type/psychic/init_sword

# move the sword to the correct position
tag @s add gm4_aa_self
$execute if score $sword_damage gm4_aa_data < $sword_durability gm4_aa_data as @e[type=item_display,tag=gm4_aa_psychic.current_sword,distance=..12,limit=1] positioned ^ ^ ^$(offset) run function gm4_augmented_armor:armor/augment/type/psychic/move_sword
tag @s remove gm4_aa_self

# if more swords should exist run this again for those rotated around the player
data remove storage gm4_augmented_armor:temp psychic.data[0]
execute if score $psychic.count gm4_aa_data matches 2 if data storage gm4_augmented_armor:temp psychic.data[0] rotated ~180 ~ run function gm4_augmented_armor:armor/augment/type/psychic/find_sword with storage gm4_augmented_armor:temp psychic
execute if score $psychic.count gm4_aa_data matches 3 if data storage gm4_augmented_armor:temp psychic.data[0] rotated ~120 ~ run function gm4_augmented_armor:armor/augment/type/psychic/find_sword with storage gm4_augmented_armor:temp psychic
execute if score $psychic.count gm4_aa_data matches 4 if data storage gm4_augmented_armor:temp psychic.data[0] rotated ~90 ~ run function gm4_augmented_armor:armor/augment/type/psychic/find_sword with storage gm4_augmented_armor:temp psychic
