
# make marker ride arrow
ride @s mount @n[type=#gm4_augmented_armor:arrow,tag=gm4_aa_target,distance=..0.1]
tag @s add gm4_aa_process_marker.tick
tag @s add gm4_aa_process_marker.blastshot

# store blast damage, arrow motion and level in marker in case arrow hits an entity
execute store result entity @s data.gm4_augmented_armor.blastshot_damage int 1 on vehicle run data get entity @s damage 500
execute store result entity @s data.gm4_augmented_armor.blastshot_level int 1 run scoreboard players get $blastshot_level gm4_aa_data

# set id to track owner
scoreboard players operation @s gm4_aa_id = $id gm4_aa_data
