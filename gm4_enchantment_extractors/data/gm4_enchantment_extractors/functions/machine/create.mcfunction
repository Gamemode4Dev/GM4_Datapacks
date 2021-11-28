# places the enchantment_extractor down
# @s = player who placed the enchantment_extractor
# located at the center of the placed block
# run from gm4_enchantment_extractors:machine/verify_placement

# place dropper
execute if score $rotation gm4_machine_data matches 1 run setblock ~ ~ ~ dropper[facing=down]{CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"container.gm4.enchantment_extractor"}]}'}
execute if score $rotation gm4_machine_data matches 2 run setblock ~ ~ ~ dropper[facing=up]{CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"container.gm4.enchantment_extractor"}]}'}
execute if score $rotation gm4_machine_data matches 3 run setblock ~ ~ ~ dropper[facing=south]{CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"container.gm4.enchantment_extractor"}]}'}
execute if score $rotation gm4_machine_data matches 4 run setblock ~ ~ ~ dropper[facing=west]{CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"container.gm4.enchantment_extractor"}]}'}
execute if score $rotation gm4_machine_data matches 5 run setblock ~ ~ ~ dropper[facing=north]{CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"container.gm4.enchantment_extractor"}]}'}
execute if score $rotation gm4_machine_data matches 6 run setblock ~ ~ ~ dropper[facing=east]{CustomName:'{"translate":"%1$s%3427655$s","with":["Enchantment Extractor",{"translate":"container.gm4.enchantment_extractor"}]}'}

# summon display armor stand and marker entity
summon armor_stand ~ ~-1.2 ~ {NoGravity:1,Marker:1,Invulnerable:1,Invisible:1,DisabledSlots:2039552,Tags:["gm4_no_edit","gm4_enchantment_extractor_stand","gm4_machine_stand","smithed.block"],HasVisualFire:1,CustomName:'"gm4_enchantment_extractor_stand"',ArmorItems:[{},{},{},{id:"minecraft:enchanting_table",Count:1b,tag:{CustomModelData:3420001}}]}
summon marker ~ ~ ~ {Tags:["gm4_enchantment_extractor","gm4_machine_marker","smithed.block"],CustomName:'"gm4_enchantment_extractor"'}

# mark block as placed
playsound entity.experience_orb.pickup master @a[distance=..5] ~ ~ ~ 1 0.7 1
scoreboard players set $placed_block gm4_machine_data 1
