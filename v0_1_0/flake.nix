{
  description = ''A new awesome nimble package'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-xlsx-v0_1_0.flake = false;
  inputs.src-xlsx-v0_1_0.owner = "xflywind";
  inputs.src-xlsx-v0_1_0.ref   = "v0_1_0";
  inputs.src-xlsx-v0_1_0.repo  = "xlsx";
  inputs.src-xlsx-v0_1_0.type  = "github";
  
  inputs."zip".owner = "nim-nix-pkgs";
  inputs."zip".ref   = "master";
  inputs."zip".repo  = "zip";
  inputs."zip".dir   = "0_3_1";
  inputs."zip".type  = "github";
  inputs."zip".inputs.nixpkgs.follows = "nixpkgs";
  inputs."zip".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-xlsx-v0_1_0"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-xlsx-v0_1_0";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}