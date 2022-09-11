kernel_cpp_sources += files(
    'entry.cc'
)

kernel_target = executable(f'@kernel_basename@.efi',
    sources: kernel_cpp_sources,
    include_directories: kernel_cpp_includes
)
