# @s = none
# run from pneumas/feigning

scoreboard players remove @e[type=#gm4_orb_of_ankou:feigning_affected,team=gm4_oa_feigning] gm4_oa_feign_t 1
execute as @e[type=#gm4_orb_of_ankou:feigning_affected,team=gm4_oa_feigning,scores={gm4_oa_feign_t=..0}] run team leave @s
scoreboard players reset @e[type=#gm4_orb_of_ankou:feigning_affected,scores={gm4_oa_feign_t=..0}] gm4_oa_feign_t
execute if entity @e[type=#gm4_orb_of_ankou:feigning_affected,team=gm4_oa_feigning,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/feigning_revert 1t
