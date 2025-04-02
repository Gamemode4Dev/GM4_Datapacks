# Decides if decorated/prepare_data should use maximum or count
# @s = temp entity inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with {id, count}
# run from decorated/check_if_pot_empty and upgrade_paths/3.1/legacy_decorated_pot

# early return for unsupported item
$execute unless data storage gm4_blossoming_pots:decorated_pots $(id) run return run kill @s

$execute store result score $max_count gm4_blossoming_pots.misc run data get storage gm4_blossoming_pots:decorated_pots $(id).maximum
# if pot over maximum use maximum as count
$execute unless score $max_count gm4_blossoming_pots.misc matches $(count).. \
    run data modify storage gm4_blossoming_pots:decorated_pots temp.count set from storage gm4_blossoming_pots:decorated_pots $(id).maximum
# if not, just use count as is
$execute if score $max_count gm4_blossoming_pots.misc matches $(count).. run data modify storage gm4_blossoming_pots:decorated_pots temp.count set value $(count)

# set id as well
$data merge storage gm4_blossoming_pots:decorated_pots {temp:{id:"$(id)"}}

function gm4_blossoming_pots:decorated/prepare_data with storage gm4_blossoming_pots:decorated_pots temp

kill @s
