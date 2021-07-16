#@s = player with feigning pneuma who has been damaged and has less than 8 health
#run from advancement_triggers/player_damaged

effect give @s invisibility 10 255 true
effect give @s slowness 10 255 true
effect give @s weakness 10 255 true
effect give @s jump_boost 10 128 true
effect give @s regeneration 10 0 false

team join gm4_oa_feigning @s
team join gm4_oa_feigning @e[type=#gm4_orb_of_ankou:feigning_affected,type=!player,distance=..50]
scoreboard players set @e[type=#gm4_orb_of_ankou:feigning_affected,team=gm4_oa_feigning,distance=..50] gm4_oa_feign_t 200
schedule function gm4_orb_of_ankou:pneumas/temp_tick/feigning_revert 1t
