{ pkgs, lib, config, inputs, ... }:

{
  # https://devenv.sh/basics/
  env.GREET = "devenv";

  packages = with inputs.ezTrack-flake.packages."x86_64-linux"; [
    python
    jupyter
    numpy
    scipy
    pandas
    opencv
    holoviews
    bokeh
    pyviz-comms
    jinja2
    scikit-learn
    matplotlib
    tqdm
    ];

  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    git --version
  '';

  # https://devenv.sh/tests/
  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

}
