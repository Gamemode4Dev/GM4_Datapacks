# zombie dripstone try to find place for a trap
# @s = zombie
# at @s positioned ~ ~x ~
# run from mob/init/mob_type/zombie/dripstone_caves/try
# run from here

execute if block ~ ~1 ~ #gm4_monsters_unbound:dripstone run return run function gm4_monsters_unbound:mob/init/mob_type/zombie/dripstone_caves/place

scoreboard players remove $raycast_limit gm4_mu_data 1
execute if score $raycast_limit gm4_mu_data matches 1.. positioned ~ ~1 ~ if block ~ ~ ~ #gm4:no_collision run function gm4_monsters_unbound:mob/init/mob_type/zombie/dripstone_caves/raycast
