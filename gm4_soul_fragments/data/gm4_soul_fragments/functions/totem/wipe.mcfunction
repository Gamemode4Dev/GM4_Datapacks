# @s = soul in a totem on the ground releasing a soul
# from spawn_fragment

execute if entity @s[type=item] run data remove entity @s Item.tag.CustomModelData
execute if entity @s[type=item] run data remove entity @s Item.tag.display
execute if entity @s[type=item] run data remove entity @s Item.tag.Enchantments
execute if entity @s[type=item] run data remove entity @s Item.tag.gm4_soul_fragments
