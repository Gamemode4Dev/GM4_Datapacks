# @s = none
# run from pneumas/advancement_triggers/magic_damaged_1 and pneumas/advancement_triggers/magic_damaged_2 and pneumas/advancement_triggers/magic_ignore

execute as @a[gamemode=!spectator,tag=gm4_oa_magic_damaged] run function gm4_orb_of_ankou:pneumas/magic_damaged/check

execute if entity @a[tag=gm4_oa_magic_damaged,limit=1] run schedule function gm4_orb_of_ankou:pneumas/temp_tick/magic_damaged 1t
