return {
    'abdallahsoliman00/neocoderunner.nvim',
    opts = {
        default_runners = {
            tex = { 'latexmk -pdf ${filePath}' },
            c = {
                build = "gcc -o ${fileName} ${filePath}",
                run = "./${fileName}"
            },
            cpp = {
                build = "g++ -o ${fileName} ${filePath}",
                run = "./${fileName}"
            }
        },
    },
}
