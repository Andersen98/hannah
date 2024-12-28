{pkgs,...}:{


	imports = [ 
		./kitty.nix
		./tofi.nix
		./hyprland
		./sway
		./nixgl.nix
	];
	
	home.packages = with pkgs; [

		

		# Internet
		firefox
		

		# Document, Media, and Image Viewers
		feh
		zathura
		vlc
		libreoffice-qt6-fresh
	    inkscape
		
	];
}
