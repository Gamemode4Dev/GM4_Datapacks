# spawn sword if it doesn't exist
# @s = new sword item_display
# at @s
# run from armor/augment/type/psychic/find_sword

data merge entity @s {teleport_duration:2,Tags:["gm4_aa_psychic.current_sword","gm4_aa_psychic.sword"],transformation:{left_rotation:[0f,0.425f,0f,1f],right_rotation:[1f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:wooden_sword",count:1}}

# set the scales 
execute store result entity @s transformation.scale[0] float 0.0075 run data get storage gm4_augmented_armor:temp psychic.scale 100
execute store result entity @s transformation.scale[1] float 0.0075 run data get storage gm4_augmented_armor:temp psychic.scale 100
execute store result entity @s transformation.scale[2] float 0.0075 run data get storage gm4_augmented_armor:temp psychic.scale 100

# set scores
scoreboard players operation @s gm4_aa_augment.psychic.id = $sword_id gm4_aa_data
scoreboard players operation @s gm4_aa_id = $player_id gm4_aa_id

# set material
execute store result score $sword_material gm4_aa_data run data get storage gm4_augmented_armor:temp psychic.data[0].components."minecraft:custom_data".gm4_augmented_armor.material
execute if score $sword_material gm4_aa_data matches 2 run data modify entity @s item.id set value "stone_sword"
execute if score $sword_material gm4_aa_data matches 3 run data modify entity @s item.id set value "iron_sword"
execute if score $sword_material gm4_aa_data matches 4 run data modify entity @s item.id set value "golden_sword"
execute if score $sword_material gm4_aa_data matches 5 run data modify entity @s item.id set value "diamond_sword"
execute if score $sword_material gm4_aa_data matches 6 run data modify entity @s item.id set value "netherite_sword"

# store material for damage calculation
scoreboard players operation @s gm4_aa_data = $sword_material gm4_aa_data
