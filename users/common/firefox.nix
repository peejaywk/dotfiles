{ pkgs, inputs, ... }:
{
	programs.firefox = {
		enable = true;
		profiles.default = {
			extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
				bitwarden
				ublock-origin
				sponsorblock
				youtube-shorts-block
				darkreader
			];
		};
	};
}
