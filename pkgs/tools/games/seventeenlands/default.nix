{ lib, python3Packages }:

python3Packages.buildPythonApplication rec {
  pname = "seventeenlands";
  version = "0.1.31";

  src = python3Packages.fetchPypi {
    inherit pname version;
    sha256 = "7fb1792c668c587292c2cbb72f1e5ddda7bcfd45777e8fd677efd802bf4453f8";
  };

  propagatedBuildInputs = with python3Packages; [ requests dateutil tkinter ];

  pythonImportsCheck = [ "seventeenlands" ];

  doCheck = false;

  meta = with lib; {
    description = "Utility to upload MTG Arena data to 17Lands.com";
    homepage = "https://github.com/rconroy293/mtga-log-client";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ mnikkel ];
  };
}
