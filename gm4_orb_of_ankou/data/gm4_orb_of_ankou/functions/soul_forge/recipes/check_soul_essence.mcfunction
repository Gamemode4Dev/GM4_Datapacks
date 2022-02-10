# @s =  soul essence item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from soul_forge/recipes/check_item

# if forge has no stored essences set the essence
execute unless score @e[type=armor_stand,tag=gm4_oa_selected_forge,limit=1] gm4_oa_essence matches 1.. run function gm4_orb_of_ankou:soul_forge/recipes/add_first_soul_essence

# check if the essence is the same as the one stored in the forge
execute store success score invalid_essence gm4_oa_essence run data modify storage gm4_orb_of_ankou:temp ArmorItems[0].tag.gm4_orb_of_ankou.stored_pneuma set from storage gm4_orb_of_ankou:temp Item.tag.gm4_orb_of_ankou.stored_pneuma
data modify storage gm4_orb_of_ankou:temp ArmorItems[0].tag set from storage gm4_orb_of_ankou:temp Item.tag
data modify storage gm4_orb_of_ankou:temp ArmorItems[1].Count set value 1b

# if same essence, add it to the forge storage
execute if score invalid_essence gm4_oa_essence matches 0 run function gm4_orb_of_ankou:soul_forge/recipes/add_soul_essence

# else summon endermites, number of endermites is equal to the count of items thrown
execute if score invalid_essence gm4_oa_essence matches 1 store result score failed_count gm4_oa_essence run data get storage gm4_orb_of_ankou:temp Item.Count
execute if score invalid_essence gm4_oa_essence matches 1 run function gm4_orb_of_ankou:soul_forge/entities/summon_failed_essence

# prepare for another essence to be checked
data modify storage gm4_orb_of_ankou:temp ArmorItems[0] set from storage gm4_orb_of_ankou:temp ArmorItems[1]
