# @s = an item entity
# run from main

# check for moulds waiting to be created
execute if entity @s[predicate=gm4_metallurgy:is_obsidian,predicate=gm4_metallurgy:on_ground] at @s if block ~ ~-0.1 ~ #minecraft:sand run function gm4_metallurgy:casting/check_mould_creation

# check for shamir on anvil
execute if items entity @s[tag=!gm4_ml_smooshed] contents *[count=1,custom_data~{gm4_metallurgy:{has_shamir:1b}}] at @s if block ~ ~-1 ~ #minecraft:anvil run function gm4_metallurgy:smooshing/item_on_anvil
