# @s = player taking damage
# from advancement take_damage

execute as @a[scores={gm4_sf_died=1..}] at @s run function gm4_soul_fragments:player/died

# release soul if holding a soul in a totem
execute if predicate gm4_soul_fragments:totem at @s run function gm4_soul_fragments:totem/release_angry_soul

advancement revoke @s only gm4_soul_fragments:take_damage
