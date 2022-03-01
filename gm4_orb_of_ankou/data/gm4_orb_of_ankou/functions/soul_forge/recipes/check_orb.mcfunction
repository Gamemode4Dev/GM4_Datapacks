# @s =  orb of ankou item in a soul forge
# located at the position of the soul forge armor stand (align xyz)
# run from soul_forge/recipes/check_item

# check if an orb is already stored in the forge
execute as @e[type=armor_stand,tag=gm4_oa_selected_forge,limit=1] store success score has_orb gm4_oa_forge if entity @s[tag=gm4_oa_has_orb]

# check pneuma count of orb
execute store result score pneuma_count gm4_oa_forge run data get storage gm4_orb_of_ankou:temp Item.tag.gm4_orb_of_ankou.pneumas
execute if score pneuma_count gm4_oa_forge matches 4.. run scoreboard players set has_orb gm4_oa_forge 1

# store orb if it doesn't have one stored already, summon living orb if an orb is already stored in the forge or the orb already has 4 or more pneumas
execute if score has_orb gm4_oa_forge matches 0 run function gm4_orb_of_ankou:soul_forge/recipes/add_orb
execute if score has_orb gm4_oa_forge matches 1 store result score orb_count gm4_oa_forge run data get storage gm4_orb_of_ankou:temp Item.Count
execute if score has_orb gm4_oa_forge matches 1 run function gm4_orb_of_ankou:soul_forge/entities/summon_living_orb
