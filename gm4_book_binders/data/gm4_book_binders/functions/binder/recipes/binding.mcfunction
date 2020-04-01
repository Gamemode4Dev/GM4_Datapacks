# as book binder marker armor stands with leather in hand
# at @s
#run from gm4_book_binders:binder/recipes/leather

# reset fake players
scoreboard players set enchantments_left gm4_binder_data 0

#append first enchant from foot storage into enchanted book
data modify entity @e[type=item,tag=gm4_empty_enchanted_book,limit=1,sort=nearest,distance=..0.3] Item.tag.StoredEnchantments append from entity @s ArmorItems[0].tag.StoredEnchantments[0]
# delete enchantment from foot storage
data remove entity @s ArmorItems[0].tag.StoredEnchantments[0]
#check if foot storage still has enchants in it
execute store result score enchantments_left gm4_binder_data run data get entity @s ArmorItems[0].tag.StoredEnchantments

#delete the leather if so, loop otherwise
execute if score enchantments_left gm4_binder_data matches 1.. run function gm4_book_binders:binder/recipes/binding

# advancement
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:book_binders_bind
