# @s = trapped sign that needs to be broken
# run from process

execute if entity @s[tag=gm4_trapped_signs_pulsed] at @s run function trapped_signs:deactivate

summon area_effect_cloud ~ ~ ~ {Passengers:[{id:item,Item:{id:redstone,Count:3b}},{id:item,Item:{id:tripwire_hook,Count:2b}}]}
execute if entity @s[tag=gm4_secret_trapped_sign] run summon area_effect_cloud ~ ~ ~ {Passengers:[{id:item,Item:{id:ink_sac,Count:1b}}]}
kill @s
