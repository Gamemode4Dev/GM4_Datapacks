execute if entity @s[tag=!gm4_secret_trapped_sign] run data merge block ~ ~ ~ {Text4:"{\"text\":\"-*-\",\"bold\":false,\"italic\":false,\"underlined\":false,\"color\":\"black\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function trapped_signs:pulse\"}}"}
execute if entity @s[tag=gm4_secret_trapped_sign] run data merge block ~ ~ ~ {Text4:"{\"text\":\"\",\"bold\":false,\"italic\":false,\"underlined\":false,\"color\":\"black\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function trapped_signs:pulse\"}}"}
tag @s add trapped_signs_completed
