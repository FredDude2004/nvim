local notes_remote = "git@github.com:FredDude2004/deez_notez.git"
local already_pulled = false

local function git_root(path)
	local result = vim.fn.systemlist({
		"git",
		"-C",
		path,
		"rev-parse",
		"--show-toplevel",
	})

	if vim.v.shell_error ~= 0 then
		return nil
	end

	return result[1]
end

local function is_notes_repo(path)
	local root = git_root(path)
	if not root then
		return nil
	end

	local remote = vim.fn.systemlist({
		"git",
		"-C",
		root,
		"remote",
		"get-url",
		"origin",
	})[1]

	if vim.v.shell_error ~= 0 then
		return nil
	end

	if remote == notes_remote then
		return root
	end

	return nil
end

local function pull_notes_repo(root)
	vim.fn.jobstart({ "git", "-C", root, "pull", "--rebase" }, {
		detach = true,
	})

	vim.notify("Pulling notes repo...", vim.log.levels.INFO)
end

local function commit_and_push_notes_repo(root)
	vim.fn.jobstart({
		"sh",
		"-c",
		table.concat({
			"git add -A",
			'git diff --cached --quiet || git commit -m "Auto-sync notes"',
			"git push",
		}, " && "),
	}, {
		cwd = root,
		detach = true,
	})

	vim.notify("Auto-syncing notes repo...", vim.log.levels.INFO)
end

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function(args)
		local path = vim.fn.fnamemodify(args.file, ":p:h")
		local root = is_notes_repo(path)

		if root and not already_pulled then
			already_pulled = true
			pull_notes_repo(root)
		end
	end,
})

vim.api.nvim_create_autocmd("VimLeavePre", {
	callback = function()
		local path = vim.fn.getcwd()
		local root = is_notes_repo(path)

		if root then
			commit_and_push_notes_repo(root)
		end
	end,
})
