build: dotfiles
	docker build -t devenv .

dotfiles:
	git clone https://github.com/andrejlamov/dotfiles.git
run:
	docker run --rm --memory-swap -1 -v `readlink -f ~/code`:/root/code -i -t devenv
