local c = {
    base         = '#24273a',
    grey_10      = '#373b58',
    white        = '#f4f2fd',
    red          = '#ff4064',
    orange       = '#fe8019',
    green        = '#50fa7b',
    blue         = '#0077ff',
    purple       = '#9252ff',
}
return {
    normal = {
        a = { bg = c.blue, fg = c.white, gui = 'bold' },
        b = { bg = c.white, fg = c.base },
        c = { bg = c.grey_10, fg = c.white }
    },
    insert = {
        a = { bg = c.blue, fg = c.white, gui = 'bold' },
        b = { bg = c.white, fg = c.base },
        c = { bg = c.grey_10, fg = c.white }
    },
    replace = {
        a = { bg = c.green, fg = c.base, gui = 'bold' },
        b = { bg = c.white, fg = c.base },
        c = { bg = c.grey_10, fg = c.white }
    },
    visual = {
        a = { bg = c.purple, fg = c.white, gui = 'bold' },
        b = { bg = c.white, fg = c.base },
        c = { bg = c.grey_10, fg = c.white }
    },
    command = {
        a = { bg = c.red, fg = c.white, gui = 'bold' },
        b = { bg = c.white, fg = c.base },
        c = { bg = c.grey_10, fg = c.white }
    }
}
