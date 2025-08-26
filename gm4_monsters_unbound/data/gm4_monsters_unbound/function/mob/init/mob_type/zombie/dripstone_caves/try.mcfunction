# zombie dripstone try to place a trap
# @s = zombie
# at @s
# run from mob/init/mob_type/zombie/base

tp @s ~ ~-2050 ~
kill @s
scoreboard players set $removed_mob gm4_sr_data 1

scoreboard players set $raycast_limit gm4_mu_data 32
execute positioned ~ ~1 ~ run function gm4_monsters_unbound:mob/init/mob_type/zombie/dripstone_caves/raycast

# stop if the raycast was succesful
execute if score $raycast_limit gm4_mu_data matches -1 run return 0

scoreboard players set $spawned_mob gm4_mu_data 0
execute if block ~.875 ~ ~.875 #gm4:no_collision if block ~.875 ~ ~-.875 #gm4:no_collision if block ~-.875 ~ ~.875 #gm4:no_collision if block ~-.875 ~ ~-.875 #gm4:no_collision store success score $spawned_mob gm4_mu_data run summon spider ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if score $spawned_mob gm4_mu_data matches 0 run summon skeleton ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
scoreboard players set $mob_extras gm4_sr_data 1
