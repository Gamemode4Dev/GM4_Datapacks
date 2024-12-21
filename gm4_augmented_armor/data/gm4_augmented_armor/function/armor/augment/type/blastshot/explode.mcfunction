
# calculate and store damage of explosion
execute store result score $level gm4_aa_data run data get entity @s data.gm4_augmented_armor.blastshot_level
execute store result score $damage gm4_aa_data run data get entity @s data.gm4_augmented_armor.blastshot_damage
scoreboard players operation $damage gm4_aa_data *= $level gm4_aa_data
scoreboard players operation $damage gm4_aa_data /= #100 gm4_aa_data
execute store result storage gm4_augmented_armor:temp blastshot.damage float 0.1 run scoreboard players get $damage gm4_aa_data

# check if arrow just hit an entity or killed it
execute if score $landed gm4_aa_data matches 2 if entity @e[distance=..12,nbt={HurtTime:10s}] run scoreboard players set $landed gm4_aa_data 1

# tag the owner of the arrow to deal the damage from them
scoreboard players operation $id gm4_aa_data = @s gm4_aa_id
execute as @a if score @s gm4_aa_id = $id gm4_aa_data run tag @s add gm4_aa_augment_damager

# double radius if kill
execute unless score $landed gm4_aa_data matches 2 if entity @p[tag=gm4_aa_augment_damager] run function gm4_augmented_armor:armor/augment/type/blastshot/explode_normal
execute if score $landed gm4_aa_data matches 2 if entity @p[tag=gm4_aa_augment_damager] run function gm4_augmented_armor:armor/augment/type/blastshot/explode_big

# cleanup
tag @a remove gm4_aa_augment_damager
data remove storage gm4_augmented_armor:temp blastshot
execute on vehicle run kill @s
kill @s
