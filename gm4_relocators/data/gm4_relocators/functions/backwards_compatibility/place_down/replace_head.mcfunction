# @s = fill replacing armor stand
# run from self and place_down/find_head

# check for heads
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=east]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/update_command_block",CustomName:'{"text":"Relocated Block"}'} replace player_wall_head[facing=west]{SkullOwner:{Properties:{textures:[{Signature:"gm4_relocated_block"}]}}}
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=west]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/update_command_block",CustomName:'{"text":"Relocated Block"}'} replace player_wall_head[facing=east]{SkullOwner:{Properties:{textures:[{Signature:"gm4_relocated_block"}]}}}
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=south]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/update_command_block",CustomName:'{"text":"Relocated Block"}'} replace player_wall_head[facing=north]{SkullOwner:{Properties:{textures:[{Signature:"gm4_relocated_block"}]}}}
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=north]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/update_command_block",CustomName:'{"text":"Relocated Block"}'} replace player_wall_head[facing=south]{SkullOwner:{Properties:{textures:[{Signature:"gm4_relocated_block"}]}}}
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=down]{auto:1b,Command:"function gm4_relocators:backwards_compatibility/place_down/update_command_block",CustomName:'{"text":"Relocated Block"}'} replace player_head{SkullOwner:{Properties:{textures:[{Signature:"gm4_relocated_block"}]}}}

tp @s ~ ~1 ~
scoreboard players add fill_counter gm4_rl_data 1
execute if score fill_success gm4_rl_data matches 0 unless score fill_counter gm4_rl_data matches 8.. at @s run function gm4_relocators:backwards_compatibility/place_down/replace_head
