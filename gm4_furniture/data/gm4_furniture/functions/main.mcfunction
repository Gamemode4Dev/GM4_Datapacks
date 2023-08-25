schedule function gm4_furniture:main 8t

# check horses, remove paintbrushes that have been equipped
execute as @e[type=horse,nbt={ArmorItems:[{tag:{gm4_furniture:"paintbrush"}}]}] at @s run function gm4_furniture:technical/paintbrush/remove_from_horse
