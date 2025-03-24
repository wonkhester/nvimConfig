return {
    "f-person/git-blame.nvim",
    event = "VeryLazy",
    opts = {
        enabled = true,
        message_template = " <summary> • <date> • <author> • <<sha>>",
        date_format = "%Y-%m-%d %H:%M:%S",
        virtual_text_column = 1,
    },
}
