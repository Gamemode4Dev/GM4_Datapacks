# run from tick

execute positioned ~ ~1 ~ if block ~ ~ ~ #gm4:air align xyz run summon marker ~.5 ~.5 ~.5 {Tags:["gm4_ai_beacon"]}
fill ~ ~1 ~ ~ ~1 ~ light replace #gm4:air
