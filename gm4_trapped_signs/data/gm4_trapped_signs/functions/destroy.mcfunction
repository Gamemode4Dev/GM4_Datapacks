# @s = trapped sign that needs to be broken
# run from process

execute if entity @s[tag=gm4_trapped_signs_pulsed] at @s run function gm4_trapped_signs:deactivate

loot spawn ~ ~0.6 ~ loot gm4_trapped_signs:blocks/trapped_sign
execute if entity @s[tag=gm4_secret_trapped_sign] run loot spawn ~ ~0.6 ~ loot gm4_trapped_signs:blocks/secret_trapped_sign
kill @s
