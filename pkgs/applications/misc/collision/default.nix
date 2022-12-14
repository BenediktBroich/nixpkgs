{
  collision,
  crystal,
  fetchFromGitHub,
  gettext,
  glib,
  gtk4,
  lib,
  libadwaita,
  pkg-config,
  shards,
  testers,
}:
crystal.buildCrystalPackage rec {
  pname = "collision";
  version = "3.3.1";

  src = fetchFromGitHub {
    owner = "GeopJr";
    repo = pname;
    rev = "v${version}";
    hash = "sha256-jqvN4QU+UdNhAWVimLANheqYmEKQXkJh8woGTR+ESKU=";
  };

  nativeBuildInputs = [
    pkg-config
    shards
  ];

  # See https://nixos.org/manual/nixpkgs/stable/#building-a-crystal-package
  # git clone https://github.com/GeopJr/Collision.git
  # cd Collision
  # git checkout tags/v3.3.1
  # if [ ! -f shard.lock ]; then nix-shell -p shards --run "shards lock"; fi
  # nix-shell -p crystal2nix --run crystal2nix
  # cp shard.lock ~/git/nixpkgs/pkgs/applications/misc/collision
  format = "shards";
  shardsFile = ./shards.nix;
  crystalBinaries.collision = {
    src = "src/${pname}.cr";
    options = [
      "-Dpreview_mt"
      "--release"
      "--no-debug"
    ];
  };

  preBuild = ''
    shards install
    ./bin/gi-crystal
  '';

  doCheck = true;

  passthru.tests.version = testers.testVersion {
    package = collision;
    command = "${pname} --help";
  };

  meta = with lib; {
    description = "Check hashes for your files - A GUI tool to generate, compare and verify MD5, SHA-1, SHA-256 & SHA-512 hashes";
    homepage = "https://collision.geopjr.dev";
    license = licenses.bsd2;
    maintainers = with maintainers; [benediktbroich];
    platforms = platforms.unix;
  };
}
