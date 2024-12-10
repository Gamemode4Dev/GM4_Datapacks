# Sets up loop for plant stage changes
# @s = temp marker inside decorated pot
# at @s align xyz positioned ~.5 ~.5 ~.5
# with storage gm4_blossoming_pots:decorated_pots temp
    # which should have id and count
# run from decorated/as_marker

# early returns
$execute if data entity @n[type=minecraft:block_display,distance=..0.1,tag=gm4_blossoming_pots.display.decorated_pot] {FallDistance:$(count).0f} run return run kill @s

$execute store result score $array_len gm4_blossoming_pots.loop run data get storage gm4_blossoming_pots:decorated_pots $(id).$(count)

data modify storage gm4_blossoming_pots:decorated_pots temp.rotation set from entity @s data.rotation
execute store result storage gm4_blossoming_pots:decorated_pots temp.score int 1 run scoreboard players set @s gm4_blossoming_pots.loop 0
$data merge storage gm4_blossoming_pots:decorated_pots {temp:{id:"$(id)",count:$(count)}}
$data modify storage gm4_blossoming_pots:decorated_pots temp.data set from storage gm4_blossoming_pots:decorated_pots $(id).$(count)[0]

function gm4_blossoming_pots:decorated/loop with storage gm4_blossoming_pots:decorated_pots temp

$execute if score @s gm4_blossoming_pots.sound matches 1 as @a[distance=..16] \
    run function gm4_blossoming_pots:decorated/play_sound with storage gm4_blossoming_pots:decorated_pots $(id)
