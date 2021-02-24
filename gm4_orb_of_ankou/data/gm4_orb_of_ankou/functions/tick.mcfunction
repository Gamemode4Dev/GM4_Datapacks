## SOUL FORGE ##

#creation
execute if score nether_player gm4_oa_forge matches 1.. as @a[gamemode=!spectator,tag=gm4_oa_in_nether,scores={gm4_oa_fns=1..}] at @s run function gm4_orb_of_ankou:soul_forge/used_flint_and_steel
scoreboard players reset @a gm4_oa_fns

#check item before it burns
execute if score loaded_forge gm4_oa_forge matches 1.. at @e[type=armor_stand,tag=gm4_soul_forge] if predicate gm4_orb_of_ankou:has_multiblock align xyz as @e[type=item,tag=!gm4_oa_checked_item,dx=0,dy=0,dz=0] run function gm4_orb_of_ankou:soul_forge/recipes/check_item


## PNEUMA STUFF ##

# use bow
scoreboard players reset @a gm4_oa_bow

schedule function gm4_orb_of_ankou:tick 1t
