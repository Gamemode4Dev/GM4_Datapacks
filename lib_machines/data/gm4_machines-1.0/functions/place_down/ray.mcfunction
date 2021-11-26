# raycast to find the player head
# @s = marker ray
# located ^ ^ ^0.X, X = number of iterations
# run from gm4_machines-1.0:place_down/place_machine_block

# check blocks around the marker ray
scoreboard players set $found gm4_machine_data 0
execute store success score $found gm4_machine_data align xyz positioned ~0.5 ~0.5 ~0.5 if block ~ ~ ~ #gm4_machines-1.0:player_heads{SkullOwner:{Name:"gm4_machine"}} run summon marker ~ ~ ~ {Tags:["gm4_machine_marker","gm4_new_machine_marker"]}
execute if score $found gm4_machine_data matches 0 store success score $found gm4_machine_data align xyz positioned ~0.5 ~1.5 ~0.5 if block ~ ~ ~ #gm4_machines-1.0:player_heads{SkullOwner:{Name:"gm4_machine"}} run summon marker ~ ~ ~ {Tags:["gm4_machine_marker","gm4_new_machine_marker"]}
execute if score $found gm4_machine_data matches 0 store success score $found gm4_machine_data align xyz positioned ~0.5 ~-0.5 ~0.5 if block ~ ~ ~ #gm4_machines-1.0:player_heads{SkullOwner:{Name:"gm4_machine"}} run summon marker ~ ~ ~ {Tags:["gm4_machine_marker","gm4_new_machine_marker"]}
execute if score $found gm4_machine_data matches 0 store success score $found gm4_machine_data align xyz positioned ~1.5 ~0.5 ~0.5 if block ~ ~ ~ #gm4_machines-1.0:player_heads{SkullOwner:{Name:"gm4_machine"}} run summon marker ~ ~ ~ {Tags:["gm4_machine_marker","gm4_new_machine_marker"]}
execute if score $found gm4_machine_data matches 0 store success score $found gm4_machine_data align xyz positioned ~-0.5 ~0.5 ~0.5 if block ~ ~ ~ #gm4_machines-1.0:player_heads{SkullOwner:{Name:"gm4_machine"}} run summon marker ~ ~ ~ {Tags:["gm4_machine_marker","gm4_new_machine_marker"]}
execute if score $found gm4_machine_data matches 0 store success score $found gm4_machine_data align xyz positioned ~0.5 ~0.5 ~1.5 if block ~ ~ ~ #gm4_machines-1.0:player_heads{SkullOwner:{Name:"gm4_machine"}} run summon marker ~ ~ ~ {Tags:["gm4_machine_marker","gm4_new_machine_marker"]}
execute if score $found gm4_machine_data matches 0 store success score $found gm4_machine_data align xyz positioned ~0.5 ~0.5 ~-0.5 if block ~ ~ ~ #gm4_machines-1.0:player_heads{SkullOwner:{Name:"gm4_machine"}} run summon marker ~ ~ ~ {Tags:["gm4_machine_marker","gm4_new_machine_marker"]}

# move forward
scoreboard players add $ray gm4_machine_data 1
execute if score $ray gm4_machine_data matches 0..50 unless score $found gm4_machine_data matches 1 positioned ^ ^ ^0.1 run function gm4_machines-1.0:place_down/ray
