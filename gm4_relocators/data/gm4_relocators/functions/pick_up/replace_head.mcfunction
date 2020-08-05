# @s = player who placed a relocator player head
# run from advancement "place_relocator"

advancement revoke @s only gm4_relocators:place_relocator

tag @s add gm4_rl_placed_relocator

fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=east]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~1 ~ ~ run function gm4_relocators:pick_up/find_machine"} replace player_wall_head[facing=west]{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=west]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~-1 ~ ~ run function gm4_relocators:pick_up/find_machine"} replace player_wall_head[facing=east]{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=south]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~ ~ ~1 run function gm4_relocators:pick_up/find_machine"} replace player_wall_head[facing=north]{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}}
fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=north]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~ ~ ~-1 run function gm4_relocators:pick_up/find_machine"} replace player_wall_head[facing=south]{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}}

fill ~-6 ~-5 ~-6 ~6 ~7 ~6 command_block[facing=down]{auto:1,CustomName:'{"text":"Relocator"}',Command:"execute as @p[tag=gm4_rl_placed_relocator,distance=..10] positioned ~ ~-1 ~ run function gm4_relocators:pick_up/find_machine"} replace player_head{Owner:{Id:"2c0fa9da-b8e7-4dfe-81eb-7885c62d6a92"}}
