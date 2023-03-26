# counts the number of players heads
# @s = player that just placed a machine block player head
# located at @s
# run from gm4_machines:plade_down/place_machine_block

execute store result score $player_head_add gm4_machine_data run clone ~-4 ~-4 ~-1 ~4 ~-4 ~4 ~-4 ~-4 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~-3 ~-1 ~4 ~-3 ~4 ~-4 ~-3 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~-2 ~-1 ~4 ~-2 ~4 ~-4 ~-2 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~-1 ~-1 ~4 ~-1 ~4 ~-4 ~-1 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~ ~-1 ~4 ~ ~4 ~-4 ~ ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~1 ~-1 ~4 ~1 ~4 ~-4 ~1 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~2 ~-1 ~4 ~2 ~4 ~-4 ~2 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~3 ~-1 ~4 ~3 ~4 ~-4 ~3 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~4 ~-1 ~4 ~4 ~4 ~-4 ~4 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~5 ~-1 ~4 ~5 ~4 ~-4 ~5 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
execute store result score $player_head_add gm4_machine_data run clone ~-4 ~6 ~-1 ~4 ~6 ~4 ~-4 ~6 ~-1 filtered #gm4_machines:player_heads{SkullOwner:{Properties:{textures:[{Signature:"gm4_machine"}]}}} force
scoreboard players operation $player_head_count gm4_machine_data += $player_head_add gm4_machine_data
