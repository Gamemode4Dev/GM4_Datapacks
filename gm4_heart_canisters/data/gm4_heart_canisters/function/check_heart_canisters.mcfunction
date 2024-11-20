# gets called for every player with at least 1 heart canister tier 1 item

scoreboard players set @s[nbt={Inventory:[{count:1,components:{"minecraft:custom_data":{gm4_heart_canister_tier:1b}}}]}] gm4_heart_can 1
scoreboard players set @s[nbt={Inventory:[{count:2,components:{"minecraft:custom_data":{gm4_heart_canister_tier:1b}}}]}] gm4_heart_can 2
scoreboard players set @s[nbt={Inventory:[{count:3,components:{"minecraft:custom_data":{gm4_heart_canister_tier:1b}}}]}] gm4_heart_can 3
scoreboard players set @s[nbt={Inventory:[{count:4,components:{"minecraft:custom_data":{gm4_heart_canister_tier:1b}}}]}] gm4_heart_can 4
scoreboard players set @s[nbt={Inventory:[{count:5,components:{"minecraft:custom_data":{gm4_heart_canister_tier:1b}}}]}] gm4_heart_can 5

scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{count:1,components:{"minecraft:custom_data":{gm4_heart_canister_tier:2b}}}]}] gm4_heart_can 6
scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{count:2,components:{"minecraft:custom_data":{gm4_heart_canister_tier:2b}}}]}] gm4_heart_can 7
scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{count:3,components:{"minecraft:custom_data":{gm4_heart_canister_tier:2b}}}]}] gm4_heart_can 8
scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{count:4,components:{"minecraft:custom_data":{gm4_heart_canister_tier:2b}}}]}] gm4_heart_can 9
scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{count:5,components:{"minecraft:custom_data":{gm4_heart_canister_tier:2b}}}]}] gm4_heart_can 10
