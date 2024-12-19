
execute store result score $picksound gm4_mu_data run random value 1..11

execute if score $picksound gm4_mu_data matches 1..2 run playsound entity.creeper.primed hostile @s ^1 ^ ^-1 1 1
execute if score $picksound gm4_mu_data matches 3..4 run playsound entity.creeper.primed hostile @s ^-1 ^ ^-1 1 1
execute if score $picksound gm4_mu_data matches 5 run playsound entity.zombie.ambient hostile @s ^2 ^ ^-3 1 1
execute if score $picksound gm4_mu_data matches 6 run playsound entity.zombie.ambient hostile @s ^-2 ^ ^-3 1 1
execute if score $picksound gm4_mu_data matches 7 run playsound entity.skeleton.ambient hostile @s ^2 ^ ^-3 1 1
execute if score $picksound gm4_mu_data matches 8 run playsound entity.skeleton.ambient hostile @s ^-2 ^ ^-3 1 1
execute if score $picksound gm4_mu_data matches 9 run playsound entity.spider.ambient hostile @s ^2 ^ ^-3 1 1
execute if score $picksound gm4_mu_data matches 10 run playsound entity.spider.ambient hostile @s ^-2 ^ ^-3 1 1
execute if score $picksound gm4_mu_data matches 11 run playsound entity.witch.ambient hostile @s ^2 ^ ^-3 1 1
