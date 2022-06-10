package co.gm4.test;

import net.minecraft.gametest.framework.GameTest;
import net.minecraft.gametest.framework.GameTestHelper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import net.fabricmc.fabric.api.gametest.v1.FabricGameTest;

import java.util.stream.Collectors;

public class Gm4Tests implements FabricGameTest {
	public static final Logger LOGGER = LoggerFactory.getLogger("GM4");

	@GameTest(template = EMPTY_STRUCTURE)
	public void loaded(GameTestHelper helper) {
		var scores = helper.getLevel().getScoreboard();
		if (!scores.hasObjective("load.status")) {
			helper.fail("Missing objective load.status");
		}
		LOGGER.info("Objectives: " + scores.getObjectiveNames().stream().collect(Collectors.joining(", ")));
		helper.succeed();
	}
}
