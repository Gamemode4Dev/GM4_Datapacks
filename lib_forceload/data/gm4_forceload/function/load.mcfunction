scoreboard objectives add gm4_dimension dummy
gamerule commandBlockOutput false

execute store success score $initialized gm4_dimension if block 29999998 1 7133 birch_wall_sign
execute if score $initialized gm4_dimension matches 0 run summon marker ~ 0 ~ {CustomName:'"minecraft:overworld"',Tags:["gm4_dimension","gm4_new_dimension"]}
execute if score $initialized gm4_dimension matches 0 as @e[type=marker,tag=gm4_new_dimension,limit=1] run function gm4_forceload:init_ow_chunk
function gm4_forceload:load_wait

# remove this after 1.21: summons new armor stand entity if missing
execute if loaded 29999998 1 7133 unless entity 344d47-4-4-4-f04ce104d run summon armor_stand 29999999 0 7135 {UUID:[I;3427655,262148,262159,80613453],Invulnerable:1b,Invisible:1b,Marker:1b,Tags:["smithed.entity","smithed.strict"],CustomName:'"lib_forceload_armorstand"'}
