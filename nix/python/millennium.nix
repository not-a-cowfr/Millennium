{pkgs}: 
pkgs.python311Packages.buildPythonPackage {
  pname = "millennium";
  version = "git";

  src = ../../sdk/python-packages/millennium;
  patches = [
    ./paths.patch
  ];

  pytestFlagsArray = [
    "--deselect=tests/test_inotify_c.py::test_select_fd"
  ];

  postUnpack = ''
    cp ${../../sdk/package.json} ./millennium/package.json
    cp ${../../sdk/README.md} ./millennium/README.md
  '';
}
