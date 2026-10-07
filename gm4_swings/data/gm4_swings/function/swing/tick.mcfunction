execute store result storage gm4_swings:data length int 1 run scoreboard players get @s gm4_swings.length

# get data from seat
scoreboard players set $found_seat gm4_swings.dummy 0
scoreboard players operation $id gm4_swings.id = @s gm4_swings.id
execute rotated as @s as @e[tag=gm4_swings.swing_seat,predicate=gm4_swings:id_match,distance=..10,limit=1,type=minecraft:item_display] at @s run function gm4_swings:seat/tick

# if no seat found, spawn a new one and skip a tick
execute if score $found_seat gm4_swings.dummy matches 0 rotated as @s run return run function gm4_swings:swing/respawn_seat

# store data
data modify storage gm4_swings:data rotation set from entity @s Rotation[1]
data modify storage gm4_swings:data origin_pos set from entity @s Pos

execute store result storage gm4_swings:data angular_velocity double 0.000001 run scoreboard players get @s gm4_swings.angular_velocity

# if not hit a block in this tick, if it was tagged as having hit a block previously, untag
execute if score $hit_block gm4_swings.dummy matches 0 run tag @s[tag=gm4_swings.hit_block] remove gm4_swings.hit_block

# if hit a block in this tick and is not tagged as having hit a block previously, bounce
execute if score $hit_block gm4_swings.dummy matches 1 if entity @s[tag=!gm4_swings.hit_block] run function gm4_swings:swing/hit_block

# calculate angular velocity
data modify storage gm4_swings:data angular_velocity set compute default float gm4_swings:pendulum
execute store result score @s gm4_swings.angular_velocity run data get storage gm4_swings:data angular_velocity 1000000

# add velocity to angle
data modify storage gm4_swings:data new_rotation set compute default float gm4_swings:add_rotation

# stop lil oscillations, but dont reset if a player is present
execute if score $has_player gm4_swings.dummy matches 0 if predicate gm4_swings:small_oscillation run function gm4_swings:swing/reset_motion

# rotation exploit
execute store success entity @s OnGround byte 1 store success score @s gm4_swings.toggle unless score @s gm4_swings.toggle matches 1

# store new angle
data modify entity @s Rotation[1] set from storage gm4_swings:data new_rotation

# move seat
execute rotated as @s positioned ^ ^-0.5 ^ as @e[tag=gm4_swings.swing_seat,predicate=gm4_swings:id_match,distance=..10,limit=1,type=minecraft:item_display] run function gm4_swings:seat/move with storage gm4_swings:data