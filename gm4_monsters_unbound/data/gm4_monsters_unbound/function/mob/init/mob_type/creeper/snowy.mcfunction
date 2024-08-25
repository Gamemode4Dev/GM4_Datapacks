# replace creeper with a zombie/stray
# @s = creeper
# at @s
# run from mob/init/mob_type/creeper/base


tp @s ~ ~-2050 ~
kill @s
scoreboard players set $removed_mob gm4_sr_data 1

execute if block ~ ~ ~ snow run return run summon marker ~ ~ ~ {Tags:["gm4_mu_snowy_trap"]}

execute store result score $pick_entity gm4_mu_data run random value 1..2
scoreboard players set $mob_extras gm4_sr_data 1
execute if score $pick_entity gm4_mu_data matches 1 run summon zombie ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
execute if score $pick_entity gm4_mu_data matches 2 run summon stray ~ ~ ~ {Tags:["gm4_sr_extra_mob"]}
