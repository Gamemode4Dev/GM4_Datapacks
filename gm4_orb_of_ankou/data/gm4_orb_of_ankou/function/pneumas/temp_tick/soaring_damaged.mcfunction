# @s = none
# run from pneumas/soaring/damaged

execute as @a[gamemode=!spectator,tag=gm4_oa_soaring_damaged] run function gm4_orb_of_ankou:pneumas/soaring/back

execute if entity @a[tag=gm4_oa_soaring_damaged,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/soaring_damaged 1t
