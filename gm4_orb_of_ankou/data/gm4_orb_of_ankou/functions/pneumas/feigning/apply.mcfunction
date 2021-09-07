# @s = player with feigning pneuma who has been damaged and has less than 8 health
# run from advancement_triggers/player_damaged

# apply effects
effect give @s invisibility 10 255 true
effect give @s resistance 10 255 true
effect give @s slowness 10 255 true
effect give @s weakness 10 255 true
effect give @s jump_boost 10 128 true
effect give @s regeneration 10 0 false

# set data of hostile mobs
tag @e[type=#gm4_orb_of_ankou:feigning_affected,distance=..50] add gm4_oa_feigning
scoreboard players set @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning,distance=..50] gm4_oa_feign_t 0
execute as @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning,scores={gm4_oa_feign_t=0}] run attribute @s minecraft:generic.follow_range modifier add 375cd73a-ea26-4ec8-b2a3-e999cfa3167e no_range -1024 add

# push nearby mobs away
tag @s add gm4_feigning_player
execute as @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning,scores={gm4_oa_feign_t=0},distance=..2] run function gm4_orb_of_ankou:pneumas/feigning/move_away
tag @a remove gm4_feigning_player

# give mobs their follow range back
schedule function gm4_orb_of_ankou:pneumas/temp_tick/feigning_revert 1t
