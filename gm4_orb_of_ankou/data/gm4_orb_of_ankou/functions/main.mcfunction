## SOUL FORGE ##

# check if player is in the nether
execute store result score nether_player gm4_oa_forge if entity @a[gamemode=!spectator,tag=gm4_oa_in_nether,limit=1]

# mark soul altars as loaded if a player is nearby
execute if score nether_player gm4_oa_forge matches 1.. store result score loaded_forge gm4_oa_forge at @e[type=armor_stand,tag=gm4_soul_forge] if entity @a[gamemode=!spectator,distance=..8,limit=1]

# destroy soul forge
execute as @e[type=armor_stand,tag=gm4_soul_forge] at @s unless block ~ ~ ~ soul_fire run function gm4_orb_of_ankou:soul_forge/destroy

# soul forge visuals
execute as @e[type=armor_stand,tag=gm4_soul_forge] at @s if predicate gm4_orb_of_ankou:has_multiblock run function gm4_orb_of_ankou:soul_forge/process


## PNEUMA STUFF ##

# gliding
effect give @a[gamemode=!spectator,tag=gm4_pneuma_gliding,scores={gm4_oa_swim=1..}] dolphins_grace 3 1 true
scoreboard players reset @a gm4_oa_swim

# soaring
tag @a[tag=gm4_oa_soaring_off_ground,nbt={OnGround:1b}] remove gm4_oa_soaring_off_ground
effect give @a[gamemode=!spectator,tag=gm4_oa_soaring_off_ground] jump_boost 2 255 true

# run player commands
execute as @a[gamemode=!spectator,tag=gm4_has_pneuma] run function gm4_orb_of_ankou:player

# revert invulnerable item
scoreboard players add @e[type=item,tag=gm4_oa_invulnerable] gm4_pneuma_data 1
execute as @e[type=item,tag=gm4_oa_invulnerable,scores={gm4_pneuma_data=2..}] run function gm4_orb_of_ankou:pneumas/revert_invulnerable_item

schedule function gm4_orb_of_ankou:main 16t
