{ lib
, attrs
, buildPythonPackage
, fetchPypi
, hatch-fancy-pypi-readme
, hatch-vcs
, hatchling
, importlib-resources
, jsonschema-specifications
, pkgutil-resolve-name
, pip
, pytestCheckHook
, pythonOlder
, referencing
, rpds-py

# optionals
, fqdn
, idna
, isoduration
, jsonpointer
, rfc3339-validator
, rfc3986-validator
, rfc3987
, uri-template
, webcolors
}:

buildPythonPackage rec {
  pname = "jsonschema";
  version = "4.21.1";
  format = "pyproject";

  disabled = pythonOlder "3.8";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-hXJ8ACefX6a+2+YjjSqmQDvt2LSGSrESB9B988wbLuU=";
  };

  postPatch = ''
    patchShebangs json/bin/jsonschema_suite
  '';

  nativeBuildInputs = [
    hatch-fancy-pypi-readme
    hatch-vcs
    hatchling
  ];

  propagatedBuildInputs = [
    attrs
    jsonschema-specifications
    referencing
    rpds-py
  ] ++ lib.optionals (pythonOlder "3.9") [
    importlib-resources
    pkgutil-resolve-name
  ];

  passthru.optional-dependencies = {
    format = [
      fqdn
      idna
      isoduration
      jsonpointer
      rfc3339-validator
      rfc3987
      uri-template
      webcolors
    ];
    format-nongpl = [
      fqdn
      idna
      isoduration
      jsonpointer
      rfc3339-validator
      rfc3986-validator
      uri-template
      webcolors
    ];
  };

  nativeCheckInputs = [
    pip
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "jsonschema"
  ];

  meta = with lib; {
    description = "An implementation of JSON Schema validation";
    mainProgram = "jsonschema";
    homepage = "https://github.com/python-jsonschema/jsonschema";
    license = licenses.mit;
    maintainers = with maintainers; [ domenkozar ];
  };
}
