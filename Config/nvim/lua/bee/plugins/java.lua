return {
	-- "mfussenegger/nvim-jdtls",
	-- ft = { "java" },
	-- config = function()
	-- 	local home = os.getenv("HOME")
	-- 	local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
	-- 	local workspace_dir = "/home/clint/.workspace/" .. project_name
	-- 	local lombok_path = "/home/clint/.local/share/nvim/mason/packages/jdtls/lombok.jar"
	--
	-- 	require("jdtls").start_or_attach({
	-- 		cmd = {
	-- 			home .. "/.sdkman/candidates/java/current/bin/java",
	-- 			"-Declipse.application=org.eclipse.jdt.ls.core.id1",
	-- 			"-Dosgi.bundles.defaultStartLevel=4",
	-- 			"-Declipse.product=org.eclipse.jdt.ls.core.product",
	-- 			"-Dlog.protocol=true",
	-- 			"-Dlog.level=ALL",
	-- 			"-javaagent:" .. lombok_path,
	-- 			"-Xmx1g",
	-- 			"--add-modules=ALL-SYSTEM",
	-- 			"--add-opens",
	-- 			"java.base/java.util=ALL-UNNAMED",
	-- 			"--add-opens",
	-- 			"java.base/java.lang=ALL-UNNAMED",
	-- 			-- 💀
	-- 			"-jar",
	-- 			"/mnt/JAJS600M2TB/dotfiles/config/nvim/java/plugins/org.eclipse.equinox.launcher_1.6.900.v20240613-2009.jar",
	-- 			-- "/mnt/JAJS600M2TB/dotfiles/config/nvim/java/plugins/org.eclipse.equinox.launcher.gtk.linux.x86_64_1.2.1100.v20240722-2106.jar",
	-- 			-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^                                       ^^^^^^^^^^^^^^
	-- 			-- Must point to the                                                     Change this to
	-- 			-- eclipse.jdt.ls installation                                           the actual version
	-- 			-- 💀
	-- 			"-configuration",
	-- 			"/mnt/JAJS600M2TB/dotfiles/config/nvim/java/config_linux",
	-- 			-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^        ^^^^^^
	-- 			-- Must point to the                      Change to one of `linux`, `win` or `mac`
	-- 			-- eclipse.jdt.ls installation            Depending on your system.
	--
	-- 			-- 💀
	-- 			-- See `data directory configuration` section in the README
	-- 			"-data",
	-- 			workspace_dir,
	-- 		},
	-- 		root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew" }),
	-- 		settings = {
	-- 			java = {},
	-- 		},
	-- 		init_options = {
	-- 			bundles = {},
	-- 		},
	-- 	})
	-- end,
}
