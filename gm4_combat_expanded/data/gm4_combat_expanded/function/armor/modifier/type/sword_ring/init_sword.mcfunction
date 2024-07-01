# spawn sword if it doesn't exist
# @s = new sword item_display
# at @s
# run from armor/modifier/type/sword_ring/find_sword

data merge entity @s {teleport_duration:2,Tags:["gm4_ce_sword_ring.current_sword","gm4_ce_sword_ring.sword"],transformation:{left_rotation:[0f,0.425f,0f,1f],right_rotation:[1f,0f,0f,1f],translation:[0f,0f,0f],scale:[1f,1f,1f]},item:{id:"minecraft:wooden_sword",count:1}}

# set the scales 
execute store result entity @s transformation.scale[0] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100
execute store result entity @s transformation.scale[1] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100
execute store result entity @s transformation.scale[2] float 0.003 run data get storage gm4_combat_expanded:temp sword_ring.scale 100

# set scores
scoreboard players operation @s gm4_ce_sword_ring = $sword_id gm4_ce_data
scoreboard players operation @s gm4_ce_id = $player_id gm4_ce_id

# set material
execute store result score $sword_material gm4_ce_data run data get storage gm4_combat_expanded:temp sword_ring.data[0].components."minecraft:custom_data".gm4_combat_expanded.material
execute if score $sword_material gm4_ce_data matches 2 run data modify entity @s item.id set value "stone_sword"
execute if score $sword_material gm4_ce_data matches 3 run data modify entity @s item.id set value "iron_sword"
execute if score $sword_material gm4_ce_data matches 4 run data modify entity @s item.id set value "golden_sword"
execute if score $sword_material gm4_ce_data matches 5 run data modify entity @s item.id set value "diamond_sword"
execute if score $sword_material gm4_ce_data matches 6 run data modify entity @s item.id set value "netherite_sword"

# store material for damage calculation
scoreboard players operation @s gm4_ce_data = $sword_material gm4_ce_data
