project('skyline-kernel', 'cpp', default_options: [
    'cpp_std=c++20'
])

# Get git info
git_commit_hash = get_option('git_commit_hash')
git_tag = get_option('git_tag')

# Determine version string
kernel_version = git_commit_hash
if git_tag != ''
    kernel_version = git_tag
endif

# Executable filename stuff
kernel_extname = '.bin'

# Currently supported architectures
supported_architectures = [
    'x86_64',
    'aarch64'
]

# These are filled by the chosen architecture subdir
supported_sub_architectures = []
supported_bootloaders = []

# Get arch & subarch
architecture = get_option('architecture')
sub_architecture = get_option('sub_architecture')
full_architecture_path = architecture
full_architecture_name = architecture

# Get target bootloader
bootloader = get_option('bootloader')

# Check if arch is supported and load the subdir
if architecture not in supported_architectures
    error(f'Architecture not supported: @architecture@')
endif
subdir(f'arch/@architecture@')

# Some architectures don't have subarches
if sub_architecture != ''
    if sub_architecture not in supported_sub_architectures
        error(f'Sub architecture \'@sub_architecture@\' not supported on architecture \'@full_architecture_name@\'')
    endif

    # Load the subarch subdir
    full_architecture_path = f'@architecture@/@sub_architecture@'
    full_architecture_name = f'@architecture@-@sub_architecture@'
    subdir(f'arch/@full_architecture_path@')
endif

# Same thing with bootloader subdir
if bootloader not in supported_bootloaders
    error(f'Bootloader \'@bootloader@\' not supported on architecture \'@full_architecture_name@\'')
endif
subdir(f'boot/@full_architecture_path@/@bootloader@')

# Set after bootloader so it can influence extname
kernel_basename = f'skyline-kernel-@full_architecture_name@-@bootloader@-@kernel_version@'
kernel_fullname = f'@kernel_basename@@kernel_extname@'

executable(kernel_fullname)
