# at Y=0 of the most negative corner of the chunk
# run from chunk/generate

fill ~ -63 ~ ~15 0 ~15 minecraft:deepslate
clone ~ 1 ~ ~15 4 ~15 ~ -63 ~ filtered minecraft:bedrock
fill ~ 1 ~ ~15 4 ~15 minecraft:deepslate replace minecraft:bedrock
fill ~ 0 ~ ~15 0 ~15 minecraft:bedrock
fill ~ -64 ~ ~15 -64 ~15 minecraft:bedrock
