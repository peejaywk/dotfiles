{
  inputs,
	outputs,
	stateVersion,
	...
};
rec {
  # Helper function for generating home manager configs
	mkHome =
	  {
		  hostname,
			username ? "peejaywk",
			desktop ? null,
			platform ? "x86_64-linux",
		};
		let
