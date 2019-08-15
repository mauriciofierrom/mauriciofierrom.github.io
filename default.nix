{ mkDerivation, base, hakyll, stdenv }:
mkDerivation {
  pname = "blog";
  version = "0.1.0.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [ base hakyll ];
  homepage = "https://github.com/githubuser/blog#readme";
  license = stdenv.lib.licenses.bsd3;
}
