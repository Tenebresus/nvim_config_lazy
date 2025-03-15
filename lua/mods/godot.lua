function open_godot_file (fileName, line, column)

    local window = get_window(fileName)
    print(window)

    if window == nil then
        print("something went wrong!")
        return
    end

    -- TODO: IT SOMETIMES SPLITS THE SCREEN AND OPEN THE FILE IN ONTHER WINDOW WHERE ANOTHER FILE IS ALREADY OPEN
    vim.api.nvim_set_current_win(window)
    vim.cmd('e ' .. fileName)
    vim.api.nvim_win_set_cursor(window, {tonumber(line), tonumber(column)})

    -- TODO: AFTER REMOTE SEND IS DONE A TRAILING "'" IS LEFT BEHIND WHICH CAUSES GOING TO NORMAL MODE TO FAIL (super annyoing)

end

-- TODO: FIX THIS FUCKING FUNCTION!
function get_window(fileName)

    local windows = vim.api.nvim_list_wins()
    local known_windows = {}
    local i = 0

    for _, win in ipairs(windows) do

        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_name(buf) == fileName then
            return win
        end

    end

    for _, win in ipairs(windows) do

        known_windows[i] = win
        i = i + 1

        local buf = vim.api.nvim_win_get_buf(win)
        if vim.api.nvim_buf_get_name(buf) == "" then
            return win
        end

    end

    vim.cmd('vsplit')

    for _, win in ipairs(windows) do

        local is_known = false
        for _, known_win in ipairs(known_windows) do

            if win == known_win then
                is_known = true
            end

        end

        if is_known == false then
            print(win)
            local buf = vim.api.nvim_create_buf(true, true)
            vim.api.nvim_win_set_buf(win, buf)
            return win
        end

    end

    return nil

end

vim.api.nvim_create_user_command('OpenGodotFile', function(opts)

    local args = opts.fargs

    local fileName = ""
    local line = 0
    local column = 0

    if args[1] then
        fileName = args[1]
    end

    if args[2] then
        line = args[2]
    end

    if args[3] then
        column = args[3]
    end

    open_godot_file(fileName, line, column)

end, { nargs = '*'})
