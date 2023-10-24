# check chime target
# @s = entity hit with the weapon
# at @s
# run from weapon/modifier/chime/activate

data modify storage gm4_combat_expanded:temp check_UUID set from entity @s UUID
execute store success score $UUID_mismatch gm4_ce_data run data modify storage gm4_combat_expanded:temp check_UUID set from storage gm4_combat_expanded:temp tag.gm4_combat_expanded.last_target
execute if score $UUID_mismatch gm4_ce_data matches 0 run function gm4_combat_expanded:weapon/modifier/chime/damage_apply
