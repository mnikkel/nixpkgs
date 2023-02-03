{ lib
, buildDotnetModule
, dotnetCorePackages
, fetchFromGitHub
}:


buildDotnetModule rec {
  pname = "mtga-tracker-daemon";
  version = "1.0.6.1";

  patches = [ ./rules.patch ];

  dotnet-sdk = dotnetCorePackages.sdk_6_0;
  dotnet-runtime = dotnetCorePackages.runtime_6_0;

  projectFile = "src/mtga-tracker-daemon/mtga-tracker-daemon.csproj";

  # How-to update deps:
  # $ nix-build -A pinta.fetch-deps
  # $ ./result
  # $ cp /tmp/Pinta-deps.nix ./pkgs/applications/graphics/pinta/deps.nix
  # TODO: create update script
  nugetDeps = ./deps.nix;

  executables = [ "mtga-tracker-daemon" ];

  src = fetchFromGitHub {
    owner = "frcaton";
    repo = "mtga-tracker-daemon";
    rev = version;
    hash = "sha256-0z1roAlw4K3LG45WvkAOnperXpcicwAZrtpqdrJUSE0=";
  };


  meta = with lib; {
    homepage = "https://www.mtgatool.com";
    description = "Magic the Gathering Arena Tracker";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ mnikkel ];
    platforms = with platforms; linux;
    mainProgram = "mtga-tracker-daemon";
  };
}
