package co.gm4.test.mixin;

import co.gm4.test.Gm4Tests;
import com.google.common.collect.ImmutableSet;
import net.minecraft.server.packs.PackType;
import net.minecraft.server.packs.repository.FolderRepositorySource;
import net.minecraft.server.packs.repository.PackRepository;
import net.minecraft.server.packs.repository.PackSource;
import net.minecraft.server.packs.repository.RepositorySource;
import org.spongepowered.asm.mixin.Final;
import org.spongepowered.asm.mixin.Mixin;
import org.spongepowered.asm.mixin.Mutable;
import org.spongepowered.asm.mixin.Shadow;
import org.spongepowered.asm.mixin.injection.At;
import org.spongepowered.asm.mixin.injection.Inject;
import org.spongepowered.asm.mixin.injection.callback.CallbackInfo;

import java.io.File;
import java.util.HashSet;
import java.util.Set;
import java.util.stream.Collectors;

@Mixin(PackRepository.class)
public abstract class PackRepositoryMixin {

    @Shadow @Final @Mutable
    private Set<RepositorySource> sources;

    @Inject(method = "<init>(Lnet/minecraft/server/packs/PackType;[Lnet/minecraft/server/packs/repository/RepositorySource;)V", at = @At("TAIL"))
    private void injectMethod(PackType packType, RepositorySource[] sources, CallbackInfo info) {
        if (packType == PackType.SERVER_DATA) {
            var externalPath = new File("../../");
            Gm4Tests.LOGGER.info("Loading packs from " + externalPath.getAbsolutePath());
            var externalPacks = new FolderRepositorySource(externalPath, PackSource.BUILT_IN);
            var newSources = new HashSet<>(ImmutableSet.copyOf(this.sources));
            newSources.add(externalPacks);
            this.sources = newSources;
        }
        Gm4Tests.LOGGER.info("Pack sources: " + this.sources.stream().map(Object::toString).collect(Collectors.joining(", ")));
    }
}
