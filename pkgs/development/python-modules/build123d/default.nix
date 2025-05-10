{
  lib,
  stdenv,
  buildPythonPackage,
  certifi,
  chardet,
  charset-normalizer,
  fetchPypi,
  idna,
  pysocks,
  pytest-mock,
  pytest-xdist,
  pytestCheckHook,
  pythonOlder,
  urllib3,
}:

buildPythonPackage rec {
  pname = "build123d";
  version = "0.9.1";
  format = "setuptools";

  disabled = pythonOlder "3.7";

  __darwinAllowLocalNetworking = true;

  src = fetchPypi {
    inherit pname version;
    hash = "";
  };

  patches = [
  ];

  dependencies = [
    stdenv.cc.cc.lib
    gcc
    expat
    libGL
    xorg.libX11
    xorg.libXrender
    zlib
  ];

  optional-dependencies = {
  };

#  nativeCheckInputs = [
#    pytest-mock
#    pytest-xdist
#    pytestCheckHook
#  ] ++ optional-dependencies.socks;

  pythonImportsCheck = [ "build123d" ];

  meta = with lib; {
    description = "a python-based, parametric, boundary representation (BREP) modeling framework for 2D and 3D CAD";
    homepage = "https://build123d.readthedocs.io/en/latest/index.html";
    changelog = "";
    license = licenses.asl20;
    maintainers = with maintainers; [ gumyr ];
  };
}
