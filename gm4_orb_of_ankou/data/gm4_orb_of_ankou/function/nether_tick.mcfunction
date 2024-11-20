# runs tick functions in the nether
# @s = none
# located at world spawn, in the nether
# run from tick

# creation
execute as @a[gamemode=!spectator,x=0,scores={gm4_oa_fns=1..}] at @s run function gm4_orb_of_ankou:soul_forge/used_flint_and_steel

# check item before it burns
execute if score loaded_forge gm4_oa_forge matches 1.. at @e[type=armor_stand,x=0,tag=gm4_soul_forge] if predicate gm4_orb_of_ankou:has_multiblock align xyz as @e[type=item,tag=!gm4_oa_checked_item,dx=0,dy=0,dz=0] run function gm4_orb_of_ankou:soul_forge/recipes/check_item
