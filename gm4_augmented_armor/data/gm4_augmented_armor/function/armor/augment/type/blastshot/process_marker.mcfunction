
# check if arrow is still in flight
scoreboard players set $landed gm4_aa_data 2
execute store result score $landed gm4_aa_data on vehicle run data get entity @s inGround

# explode if arrow has landed or hot something
execute if score $landed gm4_aa_data matches 1.. run return run function gm4_augmented_armor:armor/augment/type/blastshot/explode

# update damage in case its changing mid-flight (from other modifiers)
execute store result entity @s data.gm4_augmented_armor.blastshot_damage int 1 on vehicle run data get entity @s damage 500
