# @s = player taking damage
# from advancement take_damage

execute as @a[scores={gm4_sf_died=1..}] run function gm4_soul_fragments:player/died

# release soul if holding a soul in a lantern
execute if predicate gm4_soul_fragments:soul_in_a_lantern run function gm4_soul_fragments:player/items/check_lanterns

advancement revoke @s only gm4_soul_fragments:take_damage
