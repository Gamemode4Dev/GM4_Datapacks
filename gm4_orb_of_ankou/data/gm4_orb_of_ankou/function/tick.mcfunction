## SOUL FORGE ##

execute if score nether_player gm4_oa_forge matches 1.. in the_nether run function gm4_orb_of_ankou:nether_tick

## PNEUMA STUFF ##

# sneaking stuff
execute as @a[gamemode=!spectator,tag=gm4_has_pneuma,scores={gm4_oa_sneak=0},tag=gm4_oa_sneaking] run function gm4_orb_of_ankou:pneumas/sneak/stopped
execute as @a[gamemode=!spectator,tag=gm4_has_pneuma,scores={gm4_oa_sneak=1..}] run function gm4_orb_of_ankou:pneumas/sneak/check
scoreboard players set @a gm4_oa_sneak 0

# reset use tool scoreboards
scoreboard players reset @a gm4_oa_fns

schedule function gm4_orb_of_ankou:tick 1t
