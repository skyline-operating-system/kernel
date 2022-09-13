kernel_asm_sources += files(
    'init.S'
)

assembler = generator(clang,
    output: '@BASENAME@.S.o',
    arguments: [
        '--target=aarch64-elf',
        '-c', '@INPUT@',
        '-o', '@OUTPUT@'
    ]
)

kernel_asm_objects = assembler.process(kernel_asm_sources)

kernel_elf = executable(f'@kernel_basename@.elf', [
    kernel_cpp_sources,
    kernel_asm_objects
], include_directories: kernel_cpp_includes)

kernel_target = custom_target('kernel',
  output : f'@kernel_basename@.bin',
  input : kernel_elf,
  command : [llvm_objcopy, '-O', 'binary', '@INPUT@', '@OUTPUT@'],
  build_by_default: true
)
