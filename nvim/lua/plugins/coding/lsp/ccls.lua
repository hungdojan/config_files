return {
    init_options = {
        cache = {
            directory = "/tmp/ccls",
        },
        clang = {
            extraArgs = { "-Wunused", "-Wunused-parameter", "-Wall" },
            excludeArgs = {},
        },
    },
    single_file_support = true,
}
