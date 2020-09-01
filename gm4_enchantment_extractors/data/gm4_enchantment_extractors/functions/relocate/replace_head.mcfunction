# @s = fill replacing AEC
# run from self and gm4_enchantment_extractors:place_down_check

execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=east]{auto:1,Command:"function gm4_enchantment_extractors:relocate/place_down/west"} replace player_wall_head[facing=west]{SkullOwner:{Id:[I;-983517977,466373274,-1879558378,861584362]}}
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=west]{auto:1,Command:"function gm4_enchantment_extractors:relocate/place_down/east"} replace player_wall_head[facing=east]{SkullOwner:{Id:[I;-983517977,466373274,-1879558378,861584362]}}
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=south]{auto:1,Command:"function gm4_enchantment_extractors:relocate/place_down/north"} replace player_wall_head[facing=north]{SkullOwner:{Id:[I;-983517977,466373274,-1879558378,861584362]}}
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=north]{auto:1,Command:"function gm4_enchantment_extractors:relocate/place_down/south"} replace player_wall_head[facing=south]{SkullOwner:{Id:[I;-983517977,466373274,-1879558378,861584362]}}
execute if score fill_success gm4_rl_data matches 0 store success score fill_success gm4_rl_data run fill ~-6 ~ ~-6 ~6 ~ ~6 command_block[facing=down]{auto:1,Command:"function gm4_enchantment_extractors:relocate/place_down/floor"} replace player_head{SkullOwner:{Id:[I;-983517977,466373274,-1879558378,861584362]}}

tp @s ~ ~1 ~
scoreboard players add fill_counter gm4_rl_data 1
execute if score fill_success gm4_rl_data matches 0 unless score fill_counter gm4_rl_data matches 8.. at @s run function gm4_enchantment_extractors:relocate/replace_head
