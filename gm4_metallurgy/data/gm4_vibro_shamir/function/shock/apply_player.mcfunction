# @s = player that will take damage from a vibro shockwave
# run from shock/calculate

tag @s add gm4_vibro_attacked

# calculate new health
execute store result score $health gm4_vibro_shock run data get entity @s Health 100
scoreboard players operation $health gm4_vibro_shock -= $shockwave gm4_vibro_shock
scoreboard players operation $health gm4_vibro_shock /= #100 gm4_vibro_shock

# calculate amount of max_health to remove to get to new health
execute store result score $remove_health gm4_vibro_shock run attribute @s minecraft:generic.max_health get
scoreboard players operation $remove_health gm4_vibro_shock -= $health gm4_vibro_shock

# lower player's max health to their new health
execute if score $remove_health gm4_vibro_shock matches 512.. run attribute @s minecraft:generic.max_health modifier add minecraft:ff6db900-dbd6-47bd-9219-66c7282a84af -512 add_value
execute if score $remove_health gm4_vibro_shock matches 512.. run scoreboard players remove $remove_health gm4_vibro_shock 512
execute if score $remove_health gm4_vibro_shock matches 256.. run attribute @s minecraft:generic.max_health modifier add minecraft:c45a7b6f-ac1c-44b4-8d5f-bc4aaa743f80 -256 add_value
execute if score $remove_health gm4_vibro_shock matches 256.. run scoreboard players remove $remove_health gm4_vibro_shock 256
execute if score $remove_health gm4_vibro_shock matches 128.. run attribute @s minecraft:generic.max_health modifier add minecraft:fb369a6d-7026-4274-9888-d2e1c66a5959 -128 add_value
execute if score $remove_health gm4_vibro_shock matches 128.. run scoreboard players remove $remove_health gm4_vibro_shock 128
execute if score $remove_health gm4_vibro_shock matches 64.. run attribute @s minecraft:generic.max_health modifier add minecraft:9dd58507-2a53-4ab6-8688-b0fa0be103ab -64 add_value
execute if score $remove_health gm4_vibro_shock matches 64.. run scoreboard players remove $remove_health gm4_vibro_shock 64
execute if score $remove_health gm4_vibro_shock matches 32.. run attribute @s minecraft:generic.max_health modifier add minecraft:54197d85-31a1-4862-b63a-39d7e6249656 -32 add_value
execute if score $remove_health gm4_vibro_shock matches 32.. run scoreboard players remove $remove_health gm4_vibro_shock 32
execute if score $remove_health gm4_vibro_shock matches 16.. run attribute @s minecraft:generic.max_health modifier add minecraft:8e3c149e-0e7c-452e-b0c1-729289c27838 -16 add_value
execute if score $remove_health gm4_vibro_shock matches 16.. run scoreboard players remove $remove_health gm4_vibro_shock 16
execute if score $remove_health gm4_vibro_shock matches 8.. run attribute @s minecraft:generic.max_health modifier add minecraft:30aabc20-f152-4399-ae1f-25c5d2bc4ab6 -8 add_value
execute if score $remove_health gm4_vibro_shock matches 8.. run scoreboard players remove $remove_health gm4_vibro_shock 8
execute if score $remove_health gm4_vibro_shock matches 4.. run attribute @s minecraft:generic.max_health modifier add minecraft:552ce249-02c9-44ff-a7c7-1c85b84d56aa -4 add_value
execute if score $remove_health gm4_vibro_shock matches 4.. run scoreboard players remove $remove_health gm4_vibro_shock 4
execute if score $remove_health gm4_vibro_shock matches 2.. run attribute @s minecraft:generic.max_health modifier add minecraft:4da9ec81-1250-437d-bd99-57be649410e3 -2 add_value
execute if score $remove_health gm4_vibro_shock matches 2.. run scoreboard players remove $remove_health gm4_vibro_shock 2
execute if score $remove_health gm4_vibro_shock matches 1.. run attribute @s minecraft:generic.max_health modifier add minecraft:66ff51d4-70ad-4213-84ce-21b7b48fa316 -1 add_value
execute if score $remove_health gm4_vibro_shock matches 1.. run scoreboard players remove $remove_health gm4_vibro_shock 1

# update the player's health
effect give @s minecraft:instant_health 1 0 true
effect give @s instant_damage 1 3 true
execute if score $health gm4_vibro_shock matches 1.. run effect give @s resistance 1 4 true
execute if score $health gm4_vibro_shock matches ..0 run function gm4_vibro_shamir:shock/revert_health

# visuals
playsound minecraft:entity.player.attack.crit player @a[distance=..8] ~ ~ ~ 1 1.4
particle minecraft:crit ~ ~.5 ~ 0 0 0 .5 20
particle minecraft:damage_indicator ~ ~.5 ~ 0 0 0 .5 5

tag @a[tag=gm4_vibro_user,limit=1] add gm4_vibro_shock

# revert max health attribute
schedule function gm4_vibro_shamir:shock/check_shock 1t
