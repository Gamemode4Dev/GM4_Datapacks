# gets called for every player with at least 1 heart canister tier 1 item

scoreboard players set @s[nbt={Inventory:[{Count:1b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 1
scoreboard players set @s[nbt={Inventory:[{Count:2b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 2
scoreboard players set @s[nbt={Inventory:[{Count:3b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 3
scoreboard players set @s[nbt={Inventory:[{Count:4b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 4
scoreboard players set @s[nbt={Inventory:[{Count:5b,tag:{gm4_heart_canister_tier:1b}}]}] gm4_heart_can 5

scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:1b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 6
scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:2b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 7
scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:3b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 8
scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:4b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 9
scoreboard players set @s[scores={gm4_heart_can=5..},nbt={Inventory:[{Count:5b,tag:{gm4_heart_canister_tier:2b}}]}] gm4_heart_can 10
