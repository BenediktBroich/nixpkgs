{ blueprint-compiler
, desktop-file-utils
, fetchFromGitHub
, fetchFromGitLab
, gobject-introspection
, lib
, libadwaita
, meson
, ninja
, python3
, stdenv
, testers
, wrapGAppsHook4
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "cartridges";
  version = "1.5.4";

  src = fetchFromGitHub {
    owner = "kra-mo";
    repo = "cartridges";
    rev = "v${finalAttrs.version}";
    sha256 = "sha256-pOGsuhsBZTFcq+1xsHXtBabV8i9pQw3w6UJnVE3EihM=";
  };

  buildInputs = [
    gobject-introspection
    libadwaita
    (python3.withPackages (p: with p; [
      pillow
      pygobject3
      pyyaml
      requests
    ]))
  ];

  nativeBuildInputs = [
    blueprint-compiler
    desktop-file-utils
    meson
    ninja
    wrapGAppsHook4
  ];

  passthru.tests.version = testers.testVersion {
    package = finalAttrs.finalPackage;
  };

  meta = with lib; {
    description = "A GTK4 + Libadwaita game launcher";
    longDescription = ''
      A simple game launcher for all of your games.
      It has support for importing games from Steam, Lutris, Heroic
      and more with no login necessary.
      You can sort and hide games or download cover art from SteamGridDB.
    '';
    homepage = "https://apps.gnome.org/app/hu.kramo.Cartridges";
    license = licenses.gpl3Plus;
    maintainers = with maintainers; [ benediktbroich getchoo ];
    platforms = platforms.unix;
  };
})
