# @s = player who has an enderpuff and is falling
# run from tick

execute store result score $fall_distance gm4_ef_data run data get entity @s FallDistance 10
execute if score $fall_distance gm4_ef_data matches 25.. run tag @s add gm4_ef_fall
tag @s[scores={gm4_ef_sneak=1..},nbt={FallFlying:1b}] add gm4_ef_fall
effect give @s[tag=gm4_ef_fall] slow_falling 1 0
