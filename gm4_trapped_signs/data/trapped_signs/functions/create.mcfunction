summon area_effect_cloud ~ ~ ~ {Duration:2000000000,Tags:["trapped_signs_init"]}
data merge block ~ ~ ~ {Text4:"{\"text\":\"-*-\",\"bold\":false,\"italic\":false,\"underlined\":false,\"color\":\"black\",\"clickEvent\":{\"action\":\"run_command\",\"value\":\"function trapped_signs:pulse\"}}"}
data merge entity @e[limit=1,type=area_effect_cloud,tag=trapped_signs_init] {Tags:["trapped_sign"]}
