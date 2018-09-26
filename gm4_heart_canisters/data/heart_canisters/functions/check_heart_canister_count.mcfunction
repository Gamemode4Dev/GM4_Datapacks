# gets called for every player with at least 1 heart canister tier 1 item

scoreboard players reset @s gm4_heart_can

scoreboard players set @s[nbt={Inventory:[{Count:1b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 1
scoreboard players set @s[nbt={Inventory:[{Count:2b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 2
scoreboard players set @s[nbt={Inventory:[{Count:3b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 3
scoreboard players set @s[nbt={Inventory:[{Count:4b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 4
scoreboard players set @s[nbt={Inventory:[{Count:5b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 5

scoreboard players add @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:1b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 1
scoreboard players add @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:2b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 2
scoreboard players add @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:3b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 3
scoreboard players add @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:4b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 4
scoreboard players add @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:5b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 5

# give the player the health boost effect
effect give @s[scores={gm4_heart_can=1}] health_boost 1 0 true
effect give @s[scores={gm4_heart_can=2}] health_boost 1 1 true
effect give @s[scores={gm4_heart_can=3}] health_boost 1 2 true
effect give @s[scores={gm4_heart_can=4}] health_boost 1 3 true
effect give @s[scores={gm4_heart_can=5}] health_boost 1 4 true
effect give @s[scores={gm4_heart_can=6}] health_boost 1 5 true
effect give @s[scores={gm4_heart_can=7}] health_boost 1 6 true
effect give @s[scores={gm4_heart_can=8}] health_boost 1 7 true
effect give @s[scores={gm4_heart_can=9}] health_boost 1 8 true
effect give @s[scores={gm4_heart_can=10}] health_boost 1 9 true
