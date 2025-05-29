# place dripstone trap
# @s = zombie
# at @s positioned ~ ~x ~
# run from mob/init/mob_type/zombie/dripstone_caves/raycast

tp @s ~ ~-2050 ~
kill @s
scoreboard players set $removed_mob gm4_sr_data 1

scoreboard players set $raycast_limit gm4_mu_data -1

execute align y run summon marker ~ ~ ~ {Tags:["gm4_mu_trap","gm4_mu_dripstone_trap"],CustomName:'{"text":"GM4 Monsters Unbound - Dripstone Trap"}'}
