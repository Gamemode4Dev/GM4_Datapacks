## SOUL FORGE ##

execute in the_nether run function gm4_orb_of_ankou:nether_main


## PNEUMA STUFF ##

# gliding
effect give @a[gamemode=!spectator,tag=gm4_pneuma_gliding,scores={gm4_oa_swim=1..}] dolphins_grace 3 1 true
scoreboard players reset @a gm4_oa_swim

# soaring
execute as @a[tag=gm4_oa_soaring_off_ground,nbt={OnGround:1b}] run function gm4_orb_of_ankou:pneumas/soaring/remove_fall_protection

# sniffing
scoreboard players remove @a[scores={gm4_oa_sniff=1..}] gm4_oa_sniff 1

# run player commands
execute as @a[gamemode=!spectator,tag=gm4_has_pneuma] run function gm4_orb_of_ankou:player

# revert invulnerable item
scoreboard players add @e[type=item,tag=gm4_oa_invulnerable] gm4_pneuma_data 1
execute as @e[type=item,tag=gm4_oa_invulnerable,scores={gm4_pneuma_data=2..}] run function gm4_orb_of_ankou:pneumas/revert_invulnerable_item

schedule function gm4_orb_of_ankou:main 16t
