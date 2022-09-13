nasm_bin_generator = generator(nasm,
    output: '@BASENAME@.S.o',
    arguments: [
        '-f', 'bin',
        '-o', '@OUTPUT@',
        '@INPUT@'
    ]
)

nasm_bin_sources = files(
    'stage1.S'
)
