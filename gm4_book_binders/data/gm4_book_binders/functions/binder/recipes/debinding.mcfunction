# as book binder marker armor stands with enchanted book in hand
# at @s
#run from gm4_book_binders:binder/recipes/enchanted_book

# reset fake players
scoreboard players set enchantments_left gm4_binder_data 0

# summon paper item (y offset to deposit items in hopper, but still make them pop out of a solid block)
summon item ~ ~-0.26 ~ {Tags:["gm4_empty_enchanted_page"],PickupDelay:0s,Item:{id:"minecraft:paper",Count:1b,tag:{gm4_book_binders:{item:"enchanted_page"},CustomModelData:3420001,display:{Name:'{"translate":"item.gm4.enchanted_page","fallback":"Enchanted Page","italic":false}'},Enchantments:[]}}}
#append first enchant from book into paper
data modify entity @e[type=item,tag=gm4_empty_enchanted_page,limit=1,sort=nearest,distance=..0.3] Item.tag.Enchantments append from entity @s HandItems[0].tag.StoredEnchantments[0]
# delete enchantment from book
data remove entity @s HandItems[0].tag.StoredEnchantments[0]
#check if book still has enchants in it
execute store result score enchantments_left gm4_binder_data run data get entity @s HandItems[0].tag.StoredEnchantments

# reset tags
tag @e[type=item,distance=..0.3] remove gm4_empty_enchanted_page

#delete the book if so, loop otherwise
execute if score enchantments_left gm4_binder_data matches 1.. run function gm4_book_binders:binder/recipes/debinding

# advancement
advancement grant @a[distance=..3,gamemode=!spectator] only gm4:book_binders_debind
