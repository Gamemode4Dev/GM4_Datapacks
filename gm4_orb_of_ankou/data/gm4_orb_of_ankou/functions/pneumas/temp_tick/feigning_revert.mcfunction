# @s = none
# run from pneumas/feigning

scoreboard players add @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning] gm4_oa_feign_t 1
execute as @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning,scores={gm4_oa_feign_t=2..}] run attribute @s minecraft:generic.follow_range modifier remove 375cd73a-ea26-4ec8-b2a3-e999cfa3167e
tag @e[type=#gm4_orb_of_ankou:feigning_affected,scores={gm4_oa_feign_t=2..}] remove gm4_oa_feigning
scoreboard players reset @e[type=#gm4_orb_of_ankou:feigning_affected,scores={gm4_oa_feign_t=2..}] gm4_oa_feign_t
execute if entity @e[type=#gm4_orb_of_ankou:feigning_affected,tag=gm4_oa_feigning,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/feigning_revert 1t
