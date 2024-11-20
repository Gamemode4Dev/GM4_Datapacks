# @s = player with striding pneuma who is above lava
# run from pneumas/temp_tick/striding

execute align xyz run summon marker ~0.5 ~-1 ~0.5 {Tags:["gm4_oa_striding_block"]}
setblock ~ ~-1 ~ magma_block
schedule function gm4_orb_of_ankou:pneumas/temp_tick/striding_revert 1t
